﻿using KidProEdu.Domain.Enums;
using System.ComponentModel.DataAnnotations.Schema;

namespace KidProEdu.Domain.Entities
{

    public class AdviseRequest : BaseEntity
    {
        [ForeignKey("UserAccount")]
        public Guid? UserId { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Location { get; set; }
        public DateTime TestDate { get; set; }
        public bool? IsTested { get; set; }
        public StatusAdviseRequest StatusAdviseRequest { get; set; }
        public virtual UserAccount? UserAccount { get; set; }
    }
}
