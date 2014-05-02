using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;

namespace FlaggLib4Net.IO.Extensions
{
    public static class FileInfoExtensions
    {
        /// <summary>
        /// Reads a files contents and returns a UTF encoded string
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        public static String ReadContent(this FileInfo file)
        {
            String retval = String.Empty;

            if (file.Exists)
            {
                using (StreamReader sr = new StreamReader(file.OpenRead()))
                {
                    retval = sr.ReadToEnd();
                }

                byte[] bytes = Encoding.Default.GetBytes(retval);
                retval = Encoding.UTF8.GetString(bytes);
            }

            return retval;
        }

    }
}
