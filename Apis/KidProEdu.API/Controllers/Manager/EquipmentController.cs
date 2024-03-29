﻿using KidProEdu.Application.Interfaces;
using KidProEdu.Application.ViewModels.CategoryEquipmentViewModels;
using KidProEdu.Application.ViewModels.EquipmentViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace KidProEdu.API.Controllers.Manager
{
    [Route("api/[controller]")]
    [ApiController]
    public class EquipmentController : ControllerBase
    {
        private readonly IEquipmentService _equipmentService;
        public EquipmentController(IEquipmentService equipmentService)
        {
            _equipmentService = equipmentService;
        }

        [HttpGet("Equipments")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> Equipments()
        {
            return Ok(await _equipmentService.GetEquipments());
        }

        [HttpGet("{id}")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> Equipment(Guid id)
        {
            var equipment = await _equipmentService.GetEquipmentById(id);
            if (equipment == null)
            {
                return NotFound();
            }
            return Ok(equipment);
        }

        [HttpGet("Equipments/{name}")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> EquipmentByName(string name)
        {
            var equipments = await _equipmentService.GetListEquipmentByName(name);
            if (equipments == null)
            {
                return NotFound();
            }
            return Ok(equipments);
        }

        [HttpPost]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> PostEquipment(CreateEquipmentViewModel createEquipmentViewModel)
        {
            try
            {
                var result = await _equipmentService.CreateEquipment(createEquipmentViewModel);
                if (result)
                {
                    return Ok("Thiết bị đã được tạo thành công.");
                }
                else
                {
                    return BadRequest("Thiết bị đã được tạo thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("EquipmentBorrowedManagement")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> EquipmentBorrowedManagement(EquipmentWithLogEquipmentBorrowedViewModel equipmentWithLogEquipmentBorrowedViewModel)
        {
            try
            {
                var result = await _equipmentService.EquipmentBorrowedManagement(equipmentWithLogEquipmentBorrowedViewModel);
                if (result)
                {
                    return Ok("Mượn thiết bị thành công.");
                }
                else
                {
                    return BadRequest("Mượn thiết bị thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("EquipmentRepairManagement")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> EquipmentRepairManagement(EquipmentWithLogEquipmentRepairViewModel equipmentWithLogEquipmentRepairViewModel)
        {
            try
            {
                var result = await _equipmentService.EquipmentRepairManagement(equipmentWithLogEquipmentRepairViewModel);
                if (result)
                {
                    return Ok("Mang thiết bị đi bảo dưỡng thành công.");
                }
                else
                {
                    return BadRequest("Mang thiết bị đi bảo dưỡng thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("EquipmentReturnedManagement")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> EquipmentReturnedManagement(EquipmentWithLogEquipmentReturnedViewModel equipmentWithLogEquipmentReturnedViewModel)
        {
            try
            {
                var result = await _equipmentService.EquipmentReturnedManagement(equipmentWithLogEquipmentReturnedViewModel);
                if (result)
                {
                    return Ok("Trả thiết bị thành công.");
                }
                else
                {
                    return BadRequest("Trả thiết bị thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> PutEquipment(UpdateEquipmentViewModel updateEquipmentViewModel)
        {
            try
            {
                var result = await _equipmentService.UpdateEquipment(updateEquipmentViewModel);
                if (result)
                {
                    return Ok("Thiết bị đã được cập nhật thành công.");
                }
                else
                {
                    return BadRequest("Thiết bị đã được cập nhật thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> DeleteEquipment(Guid id)
        {
            try
            {
                var result = await _equipmentService.DeleteEquipment(id);
                if (result)
                {
                    return Ok("Thiết bị đã được xóa thành công.");
                }
                else
                {
                    return BadRequest("Thiết bị đã được xóa thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
