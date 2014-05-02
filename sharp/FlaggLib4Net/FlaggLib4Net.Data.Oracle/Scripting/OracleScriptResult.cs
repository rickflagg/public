using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlaggLib4Net.Data.Oracle.Scripting
{
    public class OracleScriptResult
    {
        public Exception ScriptException { get; set; }
        public DateTime ScriptStart { get; set; }
        public DateTime ScriptEnd { get; set; }
        public bool IsSuccessful { get; set; }
        public IList<OracleScript> Scripts { get; set; }


        public TimeSpan ExecutionTime
        {
            get
            {
                return ScriptEnd.Subtract(ScriptStart);
            }
        }

        public OracleScriptResult()
        {
            this.Scripts = new List<OracleScript>();
        }

    }
}
