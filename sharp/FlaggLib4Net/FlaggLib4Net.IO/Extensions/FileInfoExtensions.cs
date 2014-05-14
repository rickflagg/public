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

        public static byte[] ConcatenateFiles(this IList<FileInfo> files)
        {
            byte[] retval = null;
            long totalBytes = 0;
            int positionIndicator = 0;

            if (files.AllFilesExist())
            {
                IList<byte[]> fileBytes = new List<byte[]>();

                foreach (FileInfo file in files)
                {
                    byte[] tempBytes = File.ReadAllBytes(file.FullName);
                    totalBytes += tempBytes.LongLength;
                    fileBytes.Add(tempBytes);
                }

                retval = new byte[totalBytes];

                for (int i = 0; i < files.Count; i++)
                {
                    byte[] tempBytes = fileBytes[i];

                    Buffer.BlockCopy(tempBytes, 0, retval, positionIndicator, tempBytes.Length);

                    positionIndicator += tempBytes.Length;

                }

            }


            return retval;
        }


        public static bool AllFilesExist(this IList<FileInfo> files)
        {
            bool retval = true;

            if (files == null || files.Count == 0)
            {
                retval = false;
            }
            else
            {
                foreach (FileInfo file in files)
                {
                    if (!file.Exists)
                    {
                        retval = false;
                        break;
                    }
                }
            }

            return retval;
        }

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
