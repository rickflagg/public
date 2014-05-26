﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Entities;

namespace Homesite.Data.Entities
{
    public class ProgrammingLanguage: BaseEntity, IProgrammingLanguage
    {
        public virtual string ReferenceUrl { get; set; }
    }
}
