﻿using KidProEdu.Application.ViewModels.EquipmentViewModels;
using KidProEdu.Domain.Entities;
using KidProEdu.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.Interfaces
{

    public interface IEquipmentService
    {
        Task<List<EquipmentViewModel>> GetEquipments();
        Task<List<EquipmentViewModel>> GetEquipmentByStatus(StatusOfEquipment status);
        Task<List<EquipmentViewModel>> GetListEquipmentByName(string name);
        Task<bool> CreateEquipment(CreateEquipmentViewModel createEquipmentViewModel);
        Task<bool> UpdateEquipment(UpdateEquipmentViewModel updateEquipmentViewModel);
        Task<EquipmentByIdViewModel> GetEquipmentById(Guid id);
        Task<bool> DeleteEquipment(Guid id);
        Task<bool> EquipmentBorrowedManagement(EquipmentBorrowedManagementViewModel equipmentWithLogEquipmentBorrowedViewModel);
        Task<bool> EquipmentRepairManagement(EquipmentRepairManagementViewModel equipmentWithLogEquipmentRepairViewModel);
        Task<bool> EquipmentReturnedManagement(EquipmentReturnedManagementViewModel equipmentWithLogEquipmentReturnedViewModel);
        Task AutoCheckReturn();
    }
}
