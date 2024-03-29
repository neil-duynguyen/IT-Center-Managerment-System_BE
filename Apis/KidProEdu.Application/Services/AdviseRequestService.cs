﻿using AutoMapper;
using AutoMapper.Execution;
using KidProEdu.Application.Interfaces;
using KidProEdu.Application.Utils;
using KidProEdu.Application.Validations.AdviseRequests;
using KidProEdu.Application.ViewModels.AdviseRequestViewModels;
using KidProEdu.Application.ViewModels.UserViewModels;
using KidProEdu.Domain.Entities;
using System.Linq.Expressions;
using System.Reflection.Metadata.Ecma335;

namespace KidProEdu.Application.Services
{
    public class AdviseRequestService : IAdviseRequestService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ICurrentTime _currentTime;
        private readonly IClaimsService _claimsService;
        private readonly IMapper _mapper;

        public AdviseRequestService(IUnitOfWork unitOfWork, ICurrentTime currentTime, IClaimsService claimsService, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _currentTime = currentTime;
            _claimsService = claimsService;
            _mapper = mapper;
        }
        public async Task<bool> CreateAdviseRequest(CreateAdviseRequestViewModel createAdviseRequestViewModel)
        {
            var validator = new CreateAdviseRequestViewModelValidator();
            var validationResult = validator.Validate(createAdviseRequestViewModel);
            if (!validationResult.IsValid)
            {
                foreach (var error in validationResult.Errors)
                {
                    throw new Exception(error.ErrorMessage);
                }
            }

            var adviseRequest = await _unitOfWork.AdviseRequestRepository.GetAdviseRequestByEmail(createAdviseRequestViewModel.Email);
            if (adviseRequest != null)
            {
                throw new Exception("Email đã tồn tại");
            }

            adviseRequest = await _unitOfWork.AdviseRequestRepository.GetAdviseRequestByPhone(createAdviseRequestViewModel.Phone);
            if (adviseRequest != null)
            {
                throw new Exception("Số điện thoại đã tồn tại");
            }

            if (createAdviseRequestViewModel.TestDate != null && createAdviseRequestViewModel.StartTime != null)
            {
                var adviseRequests = _unitOfWork.AdviseRequestRepository.GetAllAsync().Result.Where(x => x.IsTested == false
               && x.TestDate.Date.Equals(createAdviseRequestViewModel.TestDate.Value.Date)
               && x.SlotId == createAdviseRequestViewModel.SlotId
               && x.IsTested == false).ToList();
                if (adviseRequests != null && adviseRequests.Count >= 5)
                {
                    throw new Exception("Lịch đánh giá cho thời gian này đã đủ số lượng");
                }
            }

            var mapper = _mapper.Map<AdviseRequest>(createAdviseRequestViewModel);
            mapper.StatusAdviseRequest = Domain.Enums.StatusAdviseRequest.Pending;

            await _unitOfWork.AdviseRequestRepository.AddAsync(mapper);

            var result = await _unitOfWork.SaveChangeAsync();
            if (result > 0)
            {
                await SendEmailUtil.SendEmail(mapper.Email, "Xác nhận yêu cầu tư vấn",
                    "Kính gửi quý phụ huynh, \n\n" +
                    "Yêu cầu tư vấn của bạn đã được xác nhận, \n" +
                    "Thông tin:, \n" +
                    "         Người đăng kí: " + createAdviseRequestViewModel.FullName + "\n" +
                    "         Email: " + createAdviseRequestViewModel.Email + "\n" +
                    "         Sđt: " + createAdviseRequestViewModel.Phone + "\n" +
                    "Nhân viên của chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất. \n\n" +
                    "Trân trọng, \n" +
                    "KidPro Education!");
                return true;
            }
            else
            {
                throw new Exception("Tạo yêu cầu tư vấn thất bại");
            }
        }

        public async Task<bool> DeleteAdviseRequest(Guid AdviseRequestId)
        {
            var result = await _unitOfWork.AdviseRequestRepository.GetByIdAsync(AdviseRequestId);

            if (result == null)
                throw new Exception("Không tìm thấy yêu cầu tư vấn này");
            else
            {
                _unitOfWork.AdviseRequestRepository.SoftRemove(result);
                return await _unitOfWork.SaveChangeAsync() > 0 ? true : throw new Exception("Xóa yêu cầu tư vấn thất bại");
            }
        }

        public async Task<AdviseRequestViewModel> GetAdviseRequestById(Guid AdviseRequestId)
        {
            var result = await _unitOfWork.AdviseRequestRepository.GetByIdAsync(AdviseRequestId);
            var mapper = _mapper.Map<AdviseRequestViewModel>(result);
            return mapper;
        }

        public async Task<List<AdviseRequestViewModel>> GetAdviseRequests()
        {
            var results = _unitOfWork.AdviseRequestRepository.GetAllAsync().Result
                .Where(x => x.IsDeleted == false).OrderByDescending(x => x.CreationDate).ToList();
            List<AdviseRequestViewModel> list = new List<AdviseRequestViewModel>();
            foreach (var item in results)
            {
                var mapper = _mapper.Map<AdviseRequestViewModel>(item);
                if (mapper.UserId != null)
                {
                    mapper.Staff = _mapper.Map<UserViewModel>(await _unitOfWork.UserRepository.GetByIdAsync((Guid)item.UserId));
                }
                list.Add(mapper);
            }

            return list;
        }

        public async Task<List<AdviseRequestViewModel>> GetAdviseRequestByTestDate(DateTime testDate)
        {
            var results = await _unitOfWork.AdviseRequestRepository.GetAdviseRequestByTestDate(testDate);
            var mapper = _mapper.Map<List<AdviseRequestViewModel>>(results);
            return mapper;
        }

        public async Task<bool> UpdateAdviseRequest(UpdateAdviseRequestViewModel updateAdviseRequestViewModel, params Expression<Func<AdviseRequest, object>>[] uniqueProperties)
        {
            var count = 0;
            var validator = new UpdateAdviseRequestViewModelValidator();
            var validationResult = validator.Validate(updateAdviseRequestViewModel);
            if (!validationResult.IsValid)
            {
                foreach (var error in validationResult.Errors)
                {
                    throw new Exception(error.ErrorMessage);
                }
            }

            var adviseRequest = await _unitOfWork.AdviseRequestRepository.GetByIdAsync(updateAdviseRequestViewModel.Id)
                ?? throw new Exception("Không tìm thấy yêu cầu tư vấn");

            if (adviseRequest.UserId != null)
            {
                if (updateAdviseRequestViewModel.UserId != adviseRequest.UserId)
                {

                    throw new Exception("Yêu cầu tư vấn này đã có người nhận");
                }
            }

            if (updateAdviseRequestViewModel.TestDate != null && updateAdviseRequestViewModel.StartTime != null)
            {
                if (updateAdviseRequestViewModel.TestDate.Value.Date.Equals(adviseRequest.TestDate.Date) &&
                    updateAdviseRequestViewModel.SlotId.Equals(adviseRequest.SlotId) &&
                    updateAdviseRequestViewModel.StartTime.Value.Equals(adviseRequest.StartTime.Value))
                {

                }
                else
                {
                    var adviseRequests = _unitOfWork.AdviseRequestRepository.GetAllAsync().Result.Where(x => x.IsTested == false
                    && x.TestDate.Date.Equals(updateAdviseRequestViewModel.TestDate.Value.Date)
                    && x.SlotId == updateAdviseRequestViewModel.SlotId
                    && x.IsTested == false).ToList();
                    if (adviseRequests != null && adviseRequests.Count >= 5)
                    {
                        throw new Exception("Lịch đánh giá cho thời gian này đã đủ số lượng");
                    }
                    else
                    {
                        count++;
                    }
                }
            }

            foreach (var property in uniqueProperties)
            {
                var obj = await _unitOfWork.AdviseRequestRepository.GetAdviseRequestByProperty(updateAdviseRequestViewModel, property);
                if (obj != null && obj.Id != updateAdviseRequestViewModel.Id)
                {
                    throw new Exception($"{property.GetMember().Name} đã tồn tại");
                }
            }

            var mapper = _mapper.Map(updateAdviseRequestViewModel, adviseRequest);

            _unitOfWork.AdviseRequestRepository.Update(mapper);

            var result = await _unitOfWork.SaveChangeAsync();
            if (result > 0)
            {
                if (count > 0)
                {
                    await SendEmailUtil.SendEmail(mapper.Email, "Xác nhận thay đổi lịch đăng kí tham gia đánh giá đầu vào",
                    "Kính gửi quý phụ huynh, \n\n" +
                    "Xác nhận lịch đăng kí tham gia đánh giá đầu vào của trẻ đã thay đổi sang: " + mapper.StartTime + " - "
                    + mapper.EndTime + " ngày " + mapper.TestDate + ".\n\n" +
                    "Trân trọng, \n" +
                    "KidPro Education!");
                }
                return true;
            }
            else
            {
                throw new Exception("Cập nhật yêu cầu tư vấn thất bại");
            }
        }

        public async Task AutoSendEmail()
        {
            var advises = await _unitOfWork.AdviseRequestRepository.GetAdviseRequestByTestDate(_currentTime.GetCurrentTime().AddDays(1));
            foreach (var item in advises)
            {
                await SendEmailUtil.SendEmail(item.Email, "Nhắc nhở ngày tham gia làm bài kiểm tra đầu vào của KidPro",
                    "Kính gửi quý phụ huynh, \n\n" +
                    "KidPro xin gửi thông báo đến quý phụ huynh có trẻ đã đăng kí lịch làm bài kiểm tra đầu vào của KidPro" +
                    " lúc: " + item.StartTime + " - " + item.EndTime + " ngày " + item.TestDate.Date + ". \n\n" +
                    "Xin cảm ơn, \n" +
                    "KidPro Education!");
            }
        }
    }
}
