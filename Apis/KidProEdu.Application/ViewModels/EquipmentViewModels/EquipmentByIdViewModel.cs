﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.ViewModels.EquipmentViewModels
{

    public class EquipmentByIdViewModel
    {
        public Guid Id { get; set; }
        public Guid CategoryEquipmentId { get; set; }
        public Guid? RoomId { get; set; }
        public string? Name { get; set; }
        public double? Price { get; set; }
        public string? Code { get; set; }
        public string? Status { get; set; }
        public string? WarrantyPeriod { get; set; }
        public DateTime? PurchaseDate { get; set; }
        public DateTime? BorrowedDate { get; set; }
        public DateTime? ReturnedDate { get; set; }
        public DateTime? ReturnedDealine { get; set; }
        public DateTime? RepairDate { get; set; }
        public Guid? UserAccountId { get; set; }
        public string? UserName { get; set;}

    }
}
