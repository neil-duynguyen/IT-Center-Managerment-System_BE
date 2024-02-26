﻿using KidProEdu.Application.Interfaces;
using KidProEdu.Application.ViewModels.RequestViewModels;
using Microsoft.AspNetCore.Mvc;

namespace KidProEdu.API.Controllers
{
    [Route("api/[controller]/")]
    [ApiController]
    public class RequestController : ControllerBase
    {
        private readonly IRequestService _requestService;
        public RequestController(IRequestService requestService)
        {
            _requestService = requestService;
        }

        [HttpGet("Requests")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> Requests()
        {
            return Ok(await _requestService.GetRequests());
        }

        [HttpGet("{id}")]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> Request(Guid id)
        {
            var Request = await _requestService.GetRequestById(id);
            if (Request == null)
            {
                return NotFound();
            }
            return Ok(Request);
        }

        [HttpPost]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> PostRequest(CreateRequestViewModel createRequestViewModel)
        {
            try
            {
                var result = await _requestService.CreateRequest(createRequestViewModel);
                if (result)
                {
                    return Ok("Yêu cầu đã được tạo thành công.");
                }
                else
                {
                    return BadRequest("Yêu cầu đã được tạo thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> PutRequest(UpdateRequestViewModel updateRequestViewModel)
        {
            try
            {
                var result = await _requestService.UpdateRequest(updateRequestViewModel);
                if (result)
                {
                    return Ok("Yêu cầu đã được cập nhật thành công.");
                }
                else
                {
                    return BadRequest("Yêu cầu đã được cập nhật thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete]
        /*[Authorize(Roles = ("Admin"))]*/
        public async Task<IActionResult> DeleteRequest(Guid RequestId)
        {
            try
            {
                var result = await _requestService.DeleteRequest(RequestId);
                if (result)
                {
                    return Ok("Yêu cầu đã được xóa thành công.");
                }
                else
                {
                    return BadRequest("Yêu cầu đã được xóa thất bại.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
