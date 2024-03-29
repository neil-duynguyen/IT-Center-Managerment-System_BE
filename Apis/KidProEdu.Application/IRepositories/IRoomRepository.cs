﻿using KidProEdu.Application.Repositories;
using KidProEdu.Domain.Entities;
using KidProEdu.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.IRepositories
{

    public interface IRoomRepository : IGenericRepository<Room>
    {
        Task<List<Room>> GetRoomByName(string name);
        Task<List<Room>> GetRoomByStatus(StatusOfRoom status);
    }
}
