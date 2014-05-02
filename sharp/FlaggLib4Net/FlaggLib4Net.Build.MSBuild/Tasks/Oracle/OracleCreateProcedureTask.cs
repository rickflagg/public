using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Microsoft.Build.Framework;
using Microsoft.Build.Utilities;

using FlaggLib4Net.IO.Extensions;
using FlaggLib4Net.Data.Oracle.Scripting;
using System.IO;


namespace FlaggLib4Net.Build.MSBuild.Tasks.Oracle
{
    public class OracleCreateProcedureTask: Task
    {
        [Required]
        public ITaskItem[] ProcedureScripts { get; set; }

        [Required]
        public String ConnectionString { get; set; }

        public override bool Execute()
        {
            bool retval = false;

            if (ProcedureScripts != null)
            {
                foreach (ITaskItem item in ProcedureScripts)
                {
                    if (item.ItemSpec.Length > 0)
                    {
                        try
                        {
                            Log.LogMessage(String.Format("Using script file: {0}", item.ItemSpec));

                            String scriptBody = new FileInfo(item.ItemSpec).ReadContent();

                            OracleScriptResult result = OracleScriptRunner.RunStatements(scriptBody, this.ConnectionString, null);

                            if (result.IsSuccessful)
                            {
                                if (result.Scripts.Count > 0)
                                {
                                    foreach (OracleScript script in result.Scripts)
                                    {
                                        Log.LogMessage("Successfully executed: {0}", script.Body);
                                    }

                                    Log.LogMessage(String.Format("Script Execution Time: {0} second(s)", result.ExecutionTime.Seconds));
                                }
                            }
                            else
                            {
                                Log.LogError("Script execution failed with the following: {0} : {1}", result.ScriptException.Message, result.ScriptException.StackTrace);
                            }

                        }
                        catch (Exception ex)
                        {
                            Log.LogError(ex.StackTrace);
                        }
                    }
                }
            }

            return retval;
        }
    }
}
