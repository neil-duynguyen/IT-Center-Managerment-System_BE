﻿using KidProEdu.Application.ViewModels.CertificateViewModel;
using KidProEdu.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KidProEdu.Application.Interfaces
{
    public interface ICertificateService
    {
        Task<bool> CreateCertificate(List<CreateCertificateViewModel> certificate);
    }
}
