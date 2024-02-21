﻿using Infrastructures.Repositories;
using KidProEdu.Application.Interfaces;
using KidProEdu.Application.IRepositories;
using KidProEdu.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Infrastructures.Repositories
{

    public class LessonRepository : GenericRepository<Lesson>, ILessonRepository
    {
        private readonly AppDbContext _dbContext;
        public LessonRepository(AppDbContext context, ICurrentTime timeService, IClaimsService claimsService) : base(context, timeService, claimsService)
        {
            _dbContext = context;
        }

        public async Task<List<Lesson>> GetLessonByName(string name)
        {
            var lessons = await _dbContext.Lessons
                .Where(x => x.Name.ToLower() == name.ToLower() && x.IsDeleted == false)
                .ToListAsync();

            return lessons;
        }

        public async Task<List<Lesson>> GetLessonsByCourseId(Guid CourseId)
        {
            return await _dbContext.Lessons.Where(x => !x.IsDeleted && x.CourseId == CourseId).ToListAsync();
        }
    }
}
