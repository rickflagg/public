using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.DataAccess.Client;


namespace FlaggLib4Net.Data.Oracle.Scripting
{
    public static class OracleScriptRunner
    {
        public static OracleScriptResult RunStatements(String statement, String connectionString, String delimiter = ";")
        {
            OracleScriptResult result = new OracleScriptResult();

            result.ScriptStart = DateTime.Now;

            if (delimiter != null)
            {
                try
                {
                    IList<String> statements = statement.Split(delimiter.ToCharArray()[0]).ToList<String>();

                    using (OracleConnection cn = OracleScriptRunner.CreateConnection(connectionString))
                    {
                        foreach (String stmt in statements)
                        {
                            OracleScript script = new OracleScript(stmt);

                            if (script.IsValid)
                            {
                                using (OracleCommand cmd = OracleScriptRunner.CreateScriptCommand(stmt, cn))
                                {
                                    script.RecordsAffected = cmd.ExecuteNonQuery();
                                    result.Scripts.Add(script);
                                }
                            }

                        }
                    }

                    result.ScriptEnd = DateTime.Now;
                    result.IsSuccessful = true;
                }
                catch (Exception ex)
                {
                    result.ScriptException = ex;
                    result.IsSuccessful = false;
                    result.ScriptEnd = DateTime.Now;
                }
            }
            else
            {
                try
                {
                    using (OracleConnection cn = OracleScriptRunner.CreateConnection(connectionString))
                    {
                        using (OracleCommand cmd = OracleScriptRunner.CreateScriptCommand(statement, cn))
                        {
                            OracleScript script = new OracleScript(statement);

                            if (script.IsValid)
                            {
                                script.RecordsAffected = cmd.ExecuteNonQuery();
                                result.Scripts.Add(script);
                            }
                        }
                    }

                    result.ScriptEnd = DateTime.Now;
                    result.IsSuccessful = true;

                }
                catch (Exception ex)
                {
                    result.ScriptException = ex;
                    result.IsSuccessful = false;
                    result.ScriptEnd = DateTime.Now;
                }
            }

            return result;
        }

        private static OracleConnection CreateConnection(String connectionString)
        {
            OracleConnection cn = new OracleConnection(connectionString);
            cn.Open();
            return cn;
        }

        private static OracleCommand CreateScriptCommand(String statement, OracleConnection cn)
        {
            OracleCommand cmd = new OracleCommand();

            cmd.CommandText = statement;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = cn;

            return cmd;

        }

    }
}
