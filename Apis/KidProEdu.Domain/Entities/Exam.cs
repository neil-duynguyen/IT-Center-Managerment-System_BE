﻿using KidProEdu.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Domain.Entities
{
    public class Exam : BaseEntity
    {
        public Guid? CourseId { get; set; }
        public Guid? ClassId { get; set; }
        public string TestName { get; set; }
        public string? TestCode { get; set; }
        public DateTime TestDate { get; set; }
        public int TestDuration { get; set; }
        public int? TotalQuestion { get; set; }
        public TestType TestType { get; set; }
        public virtual Course? Course { get; set; }
        public virtual Class? Class { get; set; }
        public IList<ChildrenAnswer> ChildrenAnswer { get; set; }
    }
}
