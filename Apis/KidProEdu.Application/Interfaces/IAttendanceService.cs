﻿using KidProEdu.Application.ViewModels.AttendanceViewModels;
using KidProEdu.Application.ViewModels.BlogViewModels;
using KidProEdu.Application.ViewModels.LessonViewModels;
using KidProEdu.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.Interfaces
{

    public interface IAttendanceService
    {
        Task<List<AttendanceViewModel>> GetAttendanceByScheduleId(Guid id);
        Task<List<AttendanceViewModel>> GetAttendances();
        Task<bool> UpdateAttendances(List<UpdateAttendanceViewModel> updateAttendanceViewModel);
    }
}