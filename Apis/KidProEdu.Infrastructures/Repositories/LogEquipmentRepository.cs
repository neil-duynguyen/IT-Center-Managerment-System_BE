﻿using Infrastructures.Repositories;
using KidProEdu.Application.Interfaces;
using KidProEdu.Application.IRepositories;
using KidProEdu.Domain.Entities;
using KidProEdu.Domain.Enums;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Infrastructures.Repositories
{
    public class LogEquipmentRepository : GenericRepository<LogEquipment>, ILogEquipmentRepository
    {
        private readonly AppDbContext _dbContext;
        public LogEquipmentRepository(AppDbContext context, ICurrentTime timeService, IClaimsService claimsService) : base(context, timeService, claimsService)
        {
            _dbContext = context;
        }

        public async Task<List<LogEquipment>> GetLogEquipmentByCode(string code)
        {
            var logEquipments = await _dbContext.LogEquipment
               .Where(x => x.Code.ToLower() == code.ToLower() && x.IsDeleted == false)
               .ToListAsync();

            return logEquipments;
        }

        public async Task<List<LogEquipment>> GetLogEquipmentByEquipmentId(Guid equipmentId)
        {
            var logEquipments = await _dbContext.LogEquipment
                .Where(x => x.EquipmentId == equipmentId && x.IsDeleted == false)
                .ToListAsync();

            return logEquipments;
        }

        public async Task<List<LogEquipment>> GetLogEquipmentByName(string name)
        {
            var logEquipments = await _dbContext.LogEquipment
                .Where(x => x.Name.ToLower() == name.ToLower() && x.IsDeleted == false)
                .ToListAsync();

            return logEquipments;
        }

        public async Task<List<LogEquipment>> GetLogEquipmentByRoomId(Guid roomId)
        {
            var logEquipments = await _dbContext.LogEquipment
                .Where(x => x.RoomId == roomId && x.IsDeleted == false)
                .ToListAsync();

            return logEquipments;
        }

        public async Task<List<LogEquipment>> GetLogEquipmentByStatus(StatusOfEquipment statusOfEquipment)
        {
            var logEquipments = await _dbContext.LogEquipment
                .Where(x => x.Status == statusOfEquipment && x.IsDeleted == false)
                .ToListAsync();
            return logEquipments;
        }

        public async Task<List<LogEquipment>> GetLogEquipmentByUserId(Guid userId)
        {
            var logEquipments = await _dbContext.LogEquipment
                .Where(x => x.UserAccountId == userId && x.IsDeleted == false)
                .ToListAsync();

            return logEquipments;
        }

        public async Task<List<LogEquipment>> GetLogEquipmentByReturnDeadline(DateTime returnDeadline)
        {
            var logEquipments = await _dbContext.LogEquipment
                .Where(x => x.ReturnedDealine.Value.Date == returnDeadline.Date
                && x.Status == StatusOfEquipment.Borrowed && x.IsDeleted == false)
                .ToListAsync();

            return logEquipments;
        }


    }
}

