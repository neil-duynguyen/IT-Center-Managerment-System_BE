﻿using FluentValidation;
using KidProEdu.Application.ViewModels.EquipmentViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.Validations.Equipments
{

    public class UpdateEquipmentViewModelValidator : AbstractValidator<UpdateEquipmentViewModel>
    {
        public UpdateEquipmentViewModelValidator()
        {
            RuleFor(x => x.Id).NotEmpty().WithMessage("Id không được để trống.");
            RuleFor(x => x.CategoryEquipmentId).NotEmpty().WithMessage("Danh mục thiết bị không được để trống.");
            RuleFor(x => x.RoomId).NotEmpty().WithMessage("Phòng không được để trống.");
            RuleFor(x => x.Name).NotEmpty().WithMessage("Tên không được để trống.")
                .MaximumLength(50).WithMessage("Tên không quá 50 ký tự.");
            RuleFor(x => x.Code).NotEmpty().WithMessage("Code không được để trống.")
                .MaximumLength(10).WithMessage("Code không quá 10 ký tự.");
            RuleFor(x => x.Price).NotEmpty().WithMessage("Giá không được để trống.")
                .GreaterThanOrEqualTo(0).WithMessage("Giá phải lớn hơn hoặc bằng 0.");
            RuleFor(x => x.Status).NotEmpty().WithMessage("Trạng thái không được để trống.")
                .IsInEnum().WithMessage("Trạng thái không hợp lệ.");
            RuleFor(x => x.WarrantyDate).NotEmpty().WithMessage("Ngày bảo hành không được để trống.")
                .Must(BeValidWarrantyDate).WithMessage("Ngày bảo hành phải nhỏ hơn hoặc bằng ngày hiện tại.");
        }

        private bool BeValidWarrantyDate(DateTime? warrantyDate)
        {
            return !warrantyDate.HasValue || warrantyDate.Value.Date <= DateTime.Today;
        }
    }
}
