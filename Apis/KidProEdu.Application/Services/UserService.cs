﻿using AutoMapper;
using KidProEdu.Application.Interfaces;
using KidProEdu.Application.Utils;
using KidProEdu.Application.ViewModels.LoginViewModel;
using KidProEdu.Application.ViewModels.UserViewModels;
using KidProEdu.Domain.Entities;
using Microsoft.Extensions.Configuration;

namespace KidProEdu.Application.Services
{
    public class UserService : IUserService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;
        private readonly ICurrentTime _currentTime;
        private readonly IConfiguration _configuration;

        public UserService(IMapper mapper, IUnitOfWork unitOfWork, ICurrentTime currentTime, IConfiguration configuration)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
            _currentTime = currentTime;
            _configuration = configuration;
        }

        public async Task<LoginViewModel> LoginAsync(UserLoginViewModel userObject)
        {
            var user = await _unitOfWork.UserRepository.GetUserByUserNameAndPasswordHash(userObject.UserName, userObject.Password.Hash());
            if (user == null)
            {
                throw new Exception("Tên đăng nhập hoặc mật khẩu không chính xác.");
            }

            var token = user.GenerateJsonWebToken(_configuration["AppSettings:SecretKey"]);

            var userViewModel = _mapper.Map<LoginViewModel>(user);
            userViewModel.Token = token;

            return userViewModel;
        }

        public async Task<bool> CreateAccountAsync(CreateUserViewModel userObject)
        {
            // check username exited
            var isExited = await _unitOfWork.UserRepository.CheckUserNameExited(userObject.UserName);

            if (isExited)
            {
                throw new Exception("Username exited please try again");
            }

            /* var newUser = new User
             {
                 RoleId = userObject.RoleId,
                 UserName = userObject.UserName,
                 PasswordHash = new String("123").Hash(),
                 FullName = userObject.FullName,
                 GenderType = userObject.GenderType,
                 Email = userObject.Email,
                 Phone = userObject.Phone,
                 Address = userObject.Address,
                 CreationDate = _currentTime.GetCurrentTime(),
             };*/

            var newUser = _mapper.Map<User>(userObject);
            newUser.PasswordHash = newUser.PasswordHash.Hash();

            await _unitOfWork.UserRepository.AddAsync(newUser);

            return await _unitOfWork.SaveChangeAsync() > 0 ? true : false;
        }
    }
}
