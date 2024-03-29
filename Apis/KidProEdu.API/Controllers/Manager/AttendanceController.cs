﻿using KidProEdu.Application.Interfaces;
using KidProEdu.Application.Services;
using KidProEdu.Application.ViewModels.AttendanceViewModels;
using KidProEdu.Application.ViewModels.SkillCertificateViewModels;
using KidProEdu.Application.ViewModels.SkillViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace KidProEdu.API.Controllers.Manager
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttendanceController : ControllerBase
    {
        private readonly IAttendanceService _attendanceService;
        public AttendanceController(IAttendanceService attendanceService)
        {
            _attendanceService = attendanceService;
        }

        [HttpGet]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> Attendances()
        {
            return Ok(await _attendanceService.GetAttendances());
        }

        [HttpGet("AttendanceByScheduleId/{id}")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> AttendanceByScheduleId(Guid id)
        {
            return Ok(await _attendanceService.GetAttendanceByScheduleId(id));
        }

        [HttpPost]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> PostAttendance(List<CreateAttendanceViewModel> createAttendanceViewModel)
        {
            try
            {
                var result = await _attendanceService.CreateAttendances(createAttendanceViewModel);
                if (result)
                {
                    return Ok("Điểm danh đã được tạo thành công.");
                }
                else
                {
                    return BadRequest("Điểm danh đã được tạo thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> PutAttendance(List<UpdateAttendanceViewModel> updateAttendanceViewModels)
        {
            try
            {
                var result = await _attendanceService.UpdateAttendances(updateAttendanceViewModels);
                if (result)
                {
                    return Ok("Kĩ năng đã được cập nhật thành công.");
                }
                else
                {
                    return BadRequest("Kĩ năng đã được cập nhật thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> DeleteAttendance(Guid id)
        {
            try
            {
                var result = await _attendanceService.DeleteAttendance(id);
                if (result)
                {
                    return Ok("Kĩ năng đã được xóa thành công.");
                }
                else
                {
                    return BadRequest("Kĩ năng đã được xóa thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
