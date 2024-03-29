﻿using KidProEdu.Application.Interfaces;
using KidProEdu.Application.Services;
using KidProEdu.Application.ViewModels.EnrollmentViewModels;
using KidProEdu.Application.ViewModels.SkillCertificateViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace KidProEdu.API.Controllers.Staff
{
    [Route("api/[controller]")]
    [ApiController]
    public class EnrollmentController : ControllerBase
    {
        private readonly IEnrollmentServices _enrollmentServices;

        public EnrollmentController(IEnrollmentServices enrollmentServices)
        {
            _enrollmentServices = enrollmentServices;
        }

        [HttpGet("Enrollments")]
        [Authorize(Roles = ("Staff"))]
        public async Task<IActionResult> GetEnrollment()
        {
            return Ok(await _enrollmentServices.GetEnrollment());
        }

        [HttpGet("GetEnrollmentByStaffId/{id}")]
        [Authorize(Roles = ("Manager"))]
        public async Task<IActionResult> GetEnrollmentById(Guid Id)
        {
            return Ok(await _enrollmentServices.GetEnrollmentById(Id));
        }

        [HttpGet("GetEnrollmentByClass/{classId}")]
        //[Authorize(Roles = ("Manager"))]
        public async Task<IActionResult> GetEnrollmentByClass(Guid classId)
        {
            return Ok(await _enrollmentServices.GetEnrollmentsByClassId(classId));
        }

        [HttpPost]
        public async Task<IActionResult> PostEnrollment(CreateEnrollmentViewModel createEnrollmentViewModel)
        {
            try
            {
                var result = await _enrollmentServices.CreateEnrollment(createEnrollmentViewModel);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> PutEnrollment(UpdateEnrollmentViewModel updateEnrollmentViewModel)
        {
            try
            {
                var result = await _enrollmentServices.UpdateEnrollment(updateEnrollmentViewModel);
                if (result)
                {
                    return Ok("Tham gia đã được cập nhật thành công.");
                }
                else
                {
                    return BadRequest("Tham gia đã được cập nhật thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
