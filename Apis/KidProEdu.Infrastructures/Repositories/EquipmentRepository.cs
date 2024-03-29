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

    public class EquipmentRepository : GenericRepository<Equipment>, IEquipmentRepository
    {
        private readonly AppDbContext _dbContext;
        public EquipmentRepository(AppDbContext context, ICurrentTime timeService, IClaimsService claimsService) : base(context, timeService, claimsService)
        {
            _dbContext = context;
        }

        public async Task<List<Equipment>> GetListEquipmentByName(string name)
        {
            var equipments = await _dbContext.Equipment
                .Where(x => x.Name.ToLower() == name.ToLower() && x.IsDeleted == false)
                .ToListAsync();

            return equipments;
        }

        public override async Task<Equipment> GetByIdAsync(Guid id)
        {
            return await _dbContext.Equipment.Include(x => x.LogEquipments.OrderByDescending(x => x.CreationDate)).ThenInclude(x => x.UserAccount).OrderByDescending(x => x.CreationDate).FirstOrDefaultAsync(x => x.Id == id && !x.IsDeleted);
        }
    }
}
