using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FluentNHibernate.Mapping;
using Homesite.Data.Entities;


namespace Homesite.Data.Mappings
{
    public class ClientMap: ClassMap<Client>
    {
        public ClientMap()
        {
            Table("clients");

            Id(x => x.Id).GeneratedBy.Sequence("seq_clients");
            Map(x => x.Active);
            Map(x => x.DateCreated);
            Map(x => x.Name);

        }
    }
}
