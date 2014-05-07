using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Npgsql;

namespace FlaggLib4Net.Data.Postgresql.Scripting
{
    public class PostgresqlScriptRunner
    {
        public static PostgresqlScriptResult RunStatements(String statement, String connectionString, String delimiter = ";")
        {
            PostgresqlScriptResult result = new PostgresqlScriptResult();

            result.ScriptStart = DateTime.Now;

            if (delimiter != null)
            {
                try
                {
                    IList<String> statements = statement.Split(delimiter.ToCharArray()[0]).ToList<String>();

                    using (NpgsqlConnection cn = PostgresqlScriptRunner.CreateConnection(connectionString))
                    {
                        foreach (String stmt in statements)
                        {
                            PostgresqlScript script = new PostgresqlScript(stmt);

                            if (script.IsValid)
                            {
                                using (NpgsqlCommand cmd = PostgresqlScriptRunner.CreateScriptCommand(stmt, cn))
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
                    using (NpgsqlConnection cn = PostgresqlScriptRunner.CreateConnection(connectionString))
                    {
                        using (NpgsqlCommand cmd = PostgresqlScriptRunner.CreateScriptCommand(statement, cn))
                        {
                            PostgresqlScript script = new PostgresqlScript(statement);

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

        private static NpgsqlConnection CreateConnection(String connectionString)
        {
            NpgsqlConnection cn = new NpgsqlConnection(connectionString);
            cn.Open();
            return cn;
        }

        private static NpgsqlCommand CreateScriptCommand(String statement, NpgsqlConnection cn)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();

            cmd.CommandText = statement;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = cn;

            return cmd;

        }

    }
}
