﻿using KidProEdu.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Domain.Entities
{
    public class Slot : BaseEntity
    {
        public string Name { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public SlotType SlotType { get; set; }
        public IList<Schedule> Schedule { get; set; }
        public IList<AdviseRequest> AdviseRequests { get; set; }
    }
}
