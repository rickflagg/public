using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlaggLib4Net.Data.Postgresql.Scripting
{
    public class PostgresqlScript
    {
        public String Body { get; set; }
        public int RecordsAffected { get; set; }

        public bool IsValid
        {
            get
            {
                bool retval = false;

                if (this.Body.Length > 0)
                {
                    String tempBody = this.Body.
                        Replace("\n", "")
                        .Replace("\r", "");

                    retval = tempBody.Length > 0;
                }

                return retval;
            }
        }

        public PostgresqlScript(String body)
        {
            this.Body = body;
        }

    }
}
