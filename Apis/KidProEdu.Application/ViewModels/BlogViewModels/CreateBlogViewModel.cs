﻿using KidProEdu.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.ViewModels.BlogViewModels
{
    public class CreateBlogViewModel
    {
        public Guid UserId { get; set; }
        public string Content { get; set; }
        public string? Image { get; set; }
        public string Title { get; set; }
        public ICollection<Guid> TagIds { get; set; }
    }
}
