﻿using KidProEdu.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.ViewModels.CategoryEquipmentViewModels
{

    public class UpdateCategoryEquipmentViewModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
        public TypeCategoryEquipment TypeCategoryEquipment { get; set; }
        //public string? Code { get; set; }
    }
}
