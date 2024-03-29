﻿using FluentValidation;
using KidProEdu.Application.ViewModels.TagViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.Validations.Tags
{

    public class UpdateTagViewModelValidator : AbstractValidator<UpdateTagViewModel>
    {
        public UpdateTagViewModelValidator()
        {
            RuleFor(x => x.Id).NotEmpty().WithMessage("Id không được để trống.");
            RuleFor(x => x.TagName).NotEmpty().WithMessage("Tên không được để trống.")
                .MaximumLength(50).WithMessage("Tên không quá 50 ký tự.");
            RuleFor(x => x.Description).NotEmpty().WithMessage("Mô tả không được để trống.")
                .MaximumLength(500).WithMessage("Mô tả không quá 500 ký tự.");
        }



    }
}
