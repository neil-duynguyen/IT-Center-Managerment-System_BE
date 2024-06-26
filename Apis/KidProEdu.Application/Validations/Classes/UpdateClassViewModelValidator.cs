﻿using FluentValidation;
using KidProEdu.Application.ViewModels.ClassViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.Validations.Classes
{
    public class UpdateClassViewModelValidator : AbstractValidator<UpdateClassViewModel>
    {
        public UpdateClassViewModelValidator()
        {
            RuleFor(x => x.Id).NotNull().NotEmpty().WithMessage("Id lớp không thể bỏ trống");
            RuleFor(x => x.ClassCode).NotNull().NotEmpty().WithMessage("Mã lớp không thể bỏ trống");
            /*RuleFor(x => x.StartDate).NotEmpty().WithMessage("Ngày bắt đầu không thể bỏ trống")
                .GreaterThan(DateTime.Now.Date).WithMessage("Ngày bắt đầu không thể trước thời gian hiện tại");
            RuleFor(x => x.EndDate).NotEmpty().WithMessage("Ngày kết thúc không thể bỏ trống")
                .GreaterThan(x => x.StartDate).WithMessage("Ngày kết thúc phải sau ngày bắt đầu");*/
            RuleFor(x => x.MaxNumber).NotNull().WithMessage("Số lượng học sinh tối đa không thể bỏ trống")
                .GreaterThan(0).WithMessage("Số lượng học sinh tối đa phải lớn hơn 0")
                .GreaterThanOrEqualTo(x => x.ExpectedNumber)
                .WithMessage("Số lượng học sinh tối đa phải lớn hơn số lượng học sinh dự kiến");
            RuleFor(x => x.ExpectedNumber).NotNull().WithMessage("Số lượng học sinh dự kiến không thể bỏ trống")
                .GreaterThan(0).WithMessage("Số lượng học sinh dự kiến phải lớn hơn 0");
        }
    }
}
