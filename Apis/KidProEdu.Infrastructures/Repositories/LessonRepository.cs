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

        public async Task<Lesson> GetLessonByName(string name)
        {
            var lessoon = await _dbContext.Lesson.FirstOrDefaultAsync(x => x.Name.ToLower() == name.ToLower() && !x.IsDeleted);
            return lessoon;
        }

        public async Task<List<Lesson>> GetLessonsByCourseId(Guid CourseId)
        {
            return await _dbContext.Lesson.Where(x => !x.IsDeleted && x.CourseId == CourseId).ToListAsync();
        }

    }
}
