﻿using KidProEdu.Application.Repositories;
using KidProEdu.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.IRepositories
{
    public interface IContractRepository : IGenericRepository<Contract>
    {
        Task<List<Contract>> GetContractByCode(string code);
        Task<List<Contract>> GetContractByTeacherId(Guid teacherId);
    }
}
