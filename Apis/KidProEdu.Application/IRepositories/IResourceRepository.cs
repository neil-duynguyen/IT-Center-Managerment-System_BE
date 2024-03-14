﻿using KidProEdu.Application.Repositories;
using KidProEdu.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.IRepositories
{

    public interface IResourceRepository : IGenericRepository<Resource>
    {
        //Task<List<Resource>> GetDocumentsByLessonId(Guid lessonId);
        Task<List<Resource>> GetDocumentsByClassId(Guid classId);
    }
}