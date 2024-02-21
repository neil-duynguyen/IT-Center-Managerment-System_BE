using KidProEdu.Application.Interfaces;
using KidProEdu.Application.Repositories;
using KidProEdu.Application.ViewModels.UserViewModels;
using KidProEdu.Domain.Entities;
using KidProEdu.Infrastructures;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Infrastructures.Repositories
{
    public class UserRepository : GenericRepository<UserAccount>, IUserRepository
    {
        private readonly AppDbContext _dbContext;

        public UserRepository(AppDbContext dbContext,
            ICurrentTime timeService,
            IClaimsService claimsService)
            : base(dbContext,
                  timeService,
                  claimsService)
        {
            _dbContext = dbContext;
        }

        public Task<bool> CheckUserNameExited(string username) => _dbContext.Users.AnyAsync(u => u.UserName == username);

        public async Task<UserAccount> GetUserByUserNameAndPasswordHash(string username, string passwordHash)
        {
            var user = await _dbContext.Users.Include(u => u.Role)
                .FirstOrDefaultAsync(record => record.UserName == username
                                        && record.PasswordHash == passwordHash);
            if (user is null)
            {
                throw new Exception("UserName & password is not correct");
            }
            return user;
        }

        public override async Task<List<UserAccount>> GetAllAsync()
        {
            return await _dbSet.Include(x => x.Role).Where(x => !x.IsDeleted).ToListAsync();
        }

        public override async Task<UserAccount> GetByIdAsync(Guid id)
        {
            return await _dbSet.Include(x => x.Role).Where(x => !x.IsDeleted).FirstAsync(x => x.Id == id);
        }

        public async Task<UserAccount> GetUserAccountByProperty(UpdateUserViewModel updateUserViewModel, Expression<Func<UserAccount, object>> property)
        {
            var body = property.Body;
            MemberExpression memberExpression;

            // Nếu biểu thức lambda là một UnaryExpression, ta cần lấy Operand
            if (body is UnaryExpression unaryExpression)
            {
                memberExpression = (MemberExpression)unaryExpression.Operand;
            }
            // Nếu biểu thức lambda là một MemberExpression
            else if (body is MemberExpression)
            {
                memberExpression = (MemberExpression)body;
            }
            else
            {
                throw new ArgumentException("Invalid expression type");
            }

            var propertyName = memberExpression.Member.Name;

            switch (propertyName)
            {
                case nameof(UserAccount.UserName):
                    return await _dbContext.Users
                        .Where(x => x.UserName.ToLower().Equals(updateUserViewModel.UserName.ToLower()) && x.IsDeleted == false)
                        .FirstOrDefaultAsync();
                case nameof(UserAccount.Email):
                    return await _dbContext.Users
                        .Where(x => x.Email.ToLower().Equals(updateUserViewModel.Email.ToLower()) && x.IsDeleted == false)
                        .FirstOrDefaultAsync();
                case nameof(UserAccount.Phone):
                    return await _dbContext.Users
                        .Where(x => x.Phone.ToLower().Equals(updateUserViewModel.Phone.ToLower()) && x.IsDeleted == false)
                        .FirstOrDefaultAsync();
                // Thêm các trường hợp xử lý khác nếu cần
                default:
                    throw new ArgumentException($"Property {propertyName} is not supported.");
            }
        }
    }
}
