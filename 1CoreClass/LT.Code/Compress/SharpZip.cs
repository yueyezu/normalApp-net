/**
* Title: SharpZip的压缩解压操作
* Author: other
* Date: long long ago
* Desp: 可以根据文件以及文件路径实现对文件的压缩与解压操作。
*/

using System;
using System.IO;
using System.Text;
using ICSharpCode.SharpZipLib.Zip;

namespace LT.Code
{
    public class SharpZip
    {
        #region 压缩文件与文件夹

        /// <summary>
        /// 压缩文件夹
        /// </summary>
        /// <param name="folderToZip"></param>
        /// <param name="zipedFileName"></param>
        public static void ZipDirectory(string folderToZip, string zipedFileName)
        {
            ZipDirectory(folderToZip, zipedFileName, string.Empty, true, string.Empty, string.Empty, true);
        }

        public static void ZipDirectory(string folderToZip, string zipedFileName, string password)
        {
            ZipDirectory(folderToZip, zipedFileName, password, true, string.Empty, string.Empty, true);
        }

        /// <summary>
        /// 压缩文件夹
        /// </summary>
        /// <param name="folderToZip">需要压缩的文件夹</param>
        /// <param name="zipedFileName">压缩后的Zip完整文件名（如D:\test.zip）</param>
        /// <param name="isRecurse">如果文件夹下有子文件夹，是否递归压缩</param>
        /// <param name="password">解压时需要提供的密码</param>
        /// <param name="fileRegexFilter">文件过滤正则表达式</param>
        /// <param name="directoryRegexFilter">文件夹过滤正则表达式</param>
        /// <param name="isCreateEmptyDirectories">是否压缩文件中的空文件夹</param>
        public static void ZipDirectory(string folderToZip, string zipedFileName, string password, bool isRecurse,
                                        string fileRegexFilter, string directoryRegexFilter,
                                        bool isCreateEmptyDirectories)
        {
            if (!Directory.Exists(folderToZip))
            {
                throw new IOException("要压缩的文件夹" + folderToZip + "不存在！");
            }
            FastZip fastZip = new FastZip();
            if (!password.Equals(string.Empty))
            {
                fastZip.Password = password;
            }
            fastZip.CreateEmptyDirectories = isCreateEmptyDirectories;
            fastZip.CreateZip(zipedFileName, folderToZip, isRecurse, fileRegexFilter, directoryRegexFilter);
        }

        /// <summary>
        /// 压缩文件
        /// </summary>
        /// <param name="fileToZip">要进行压缩的文件名</param>
        /// <param name="zipedFileName">压缩后生成的压缩文件名</param>
        /// <param name="password"></param>
        /// <exception cref="FileNotFoundException"></exception>
        /// <returns></returns>
        public static bool ZipFile(string fileToZip, string zipedFileName, String password)
        {
            if (!File.Exists(fileToZip))
            {
                throw new FileNotFoundException("指定要压缩的文件: " + fileToZip + " 不存在!");
            }
            FileStream zipFile = null;
            ZipOutputStream zipStream = null;
            ZipEntry zipEntry = null;
            bool res = true;
            try
            {
                zipFile = File.OpenRead(fileToZip);
                byte[] buffer = new byte[zipFile.Length];
                zipFile.Read(buffer, 0, buffer.Length);
                zipFile.Close();

                zipFile = File.Create(zipedFileName);
                zipStream = new ZipOutputStream(zipFile);
                zipStream.Password = password;
                zipEntry = new ZipEntry(Path.GetFileName(fileToZip));
                zipStream.PutNextEntry(zipEntry);
                zipStream.SetLevel(6);

                zipStream.Write(buffer, 0, buffer.Length);
            }
            catch
            {
                res = false;
            }
            finally
            {
                if (zipEntry != null)
                    zipEntry = null;
                if (zipStream != null)
                {
                    zipStream.Finish();
                    zipStream.Close();
                }
                if (zipFile != null)
                {
                    zipFile.Close();
                }
                GC.Collect();
                GC.Collect(1);
            }
            return res;
        }

        #endregion

        #region 解压文件与文件夹

        public static void UnZipFile(string fileToUnZip, string targetDirectory)
        {
            UnZipFile(fileToUnZip, targetDirectory, string.Empty, string.Empty);
        }

        public static void UnZipFile(string fileToUnZip, string targetDirectory, string password)
        {
            UnZipFile(fileToUnZip, targetDirectory, password, string.Empty);
        }

        /// <summary>
        /// 解压缩文件
        /// </summary>
        /// <param name="fileToUnZip">Zip的完整文件名（如D:\test.zip）</param>
        /// <param name="targetDirectory">解压到的目录</param>
        /// <param name="password">解压密码</param>
        /// <param name="fileFilter">文件过滤正则表达式</param>
        public static void UnZipFile(string fileToUnZip, string targetDirectory, string password, string fileFilter)
        {
            if (!File.Exists(fileToUnZip))
            {
                throw new IOException("找不到压缩的文件" + fileToUnZip);
            }

            if (!Directory.Exists(targetDirectory))
            {
                Directory.CreateDirectory(targetDirectory);
            }

            FastZip fastZip = new FastZip();
            if (!password.Equals(string.Empty))
            {
                fastZip.Password = password;
            }
            fastZip.ExtractZip(fileToUnZip, targetDirectory, fileFilter);
        }

        /// <summary>
        /// 解压功能(解压压缩文件到指定目录)
        /// </summary>
        /// <param name="fileToUnZip">待解压的文件</param>
        /// <param name="targetDirectory">指定解压目标目录</param>
        /// <param name="password">密码</param>
        public static void UnZip(string fileToUnZip, string targetDirectory, string password)
        {
            if (!File.Exists(fileToUnZip))
            {
                throw new IOException("找不到压缩的文件！");
            }

            if (!Directory.Exists(targetDirectory))
            {
                Directory.CreateDirectory(targetDirectory);
            }

            ZipInputStream s = null;
            ZipEntry theEntry = null;

            FileStream streamWriter = null;
            try
            {
                s = new ZipInputStream(File.OpenRead(fileToUnZip));
                s.Password = password;
                while ((theEntry = s.GetNextEntry()) != null)
                {
                    if (theEntry.Name != String.Empty)
                    {
                        string fileName = Path.Combine(targetDirectory, theEntry.Name);
                        ///判断文件路径是否是文件夹
                        if (fileName.EndsWith("/") || fileName.EndsWith("//"))
                        {
                            Directory.CreateDirectory(fileName);
                            continue;
                        }

                        streamWriter = File.Create(fileName);
                        int size = 2048;
                        byte[] data = new byte[2048];
                        while (true)
                        {
                            size = s.Read(data, 0, data.Length);
                            if (size > 0)
                            {
                                streamWriter.Write(data, 0, size);
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                }
            }
            finally
            {
                if (streamWriter != null)
                {
                    streamWriter.Close();
                    streamWriter = null;
                }
                if (theEntry != null)
                {
                    theEntry = null;
                }
                if (s != null)
                {
                    s.Close();
                    s = null;
                }
                GC.Collect();
                GC.Collect(1);
            }
        }

        #endregion

        #region 压缩/解压字符串

        /// <summary>
        /// 将传入字符串以Zip算法压缩后，返回Base64编码字符
        /// </summary>
        /// <param name="rawString">需要压缩的字符串</param>
        /// <returns>压缩后的Base64编码的字符串</returns>
        public static string ZipString(string rawString)
        {
            if (string.IsNullOrEmpty(rawString) || rawString.Length == 0)
            {
                return "";
            }
            else
            {
                byte[] rawData = Encoding.UTF8.GetBytes(rawString);
                byte[] zippedData = ZipBytes(rawData);
                return Convert.ToBase64String(zippedData);
            }
        }

        /// <summary>
        /// 将传入字符串以Zip算法压缩后，返回Base64编码字符
        /// </summary>
        /// <param name="rawString">需要压缩的字符串</param>
        /// <returns>压缩后的Base64编码的字符串</returns>
        public static string ZipString(string rawString, string password)
        {
            if (string.IsNullOrEmpty(rawString) || rawString.Length == 0)
            {
                return "";
            }
            byte[] rawData = Encoding.UTF8.GetBytes(rawString);
            byte[] zippedData = ZipBytes(rawData, password);
            return Convert.ToBase64String(zippedData);
        }

        /// <summary>
        /// Zip压缩Byte
        /// </summary>
        /// <param name="rawData"></param>
        /// <returns></returns>
        public static byte[] ZipBytes(byte[] rawData, string password = "")
        {
            MemoryStream ms = new MemoryStream();
            ZipOutputStream zipout = new ZipOutputStream(ms);
            zipout.SetLevel(6);
            if (password != "")
            {
                zipout.Password = password;
            }
            ZipEntry entry = new ZipEntry("");
            zipout.PutNextEntry(entry);
            zipout.Write(rawData, 0, rawData.Length);
            zipout.Close();
            byte[] outArr = ms.ToArray();
            ms.Close();
            return outArr;
        }

        /// <summary>
        /// 将传入的字符串资料以Zip算法解压缩
        /// </summary>
        /// <param name="zippedString">经GZip压缩后的字符串</param>
        /// <returns>原始未压缩字符串</returns>
        public static string UnZipString(string zippedString)
        {
            if (string.IsNullOrEmpty(zippedString) || zippedString.Length == 0)
            {
                return "";
            }
            byte[] zippedData = Convert.FromBase64String(zippedString);
            return Encoding.UTF8.GetString(UnZipBytes(zippedData));
        }

        /// <summary>
        /// 将传入的字符串资料以Zip算法解压缩
        /// </summary>
        /// <param name="zippedString">经GZip压缩后的字符串</param>
        /// <returns>原始未压缩字符串</returns>
        public static string UnZipString(string zippedString, string password)
        {
            if (string.IsNullOrEmpty(zippedString) || zippedString.Length == 0)
            {
                return "";
            }
            byte[] zippedData = Convert.FromBase64String(zippedString);
            return Encoding.UTF8.GetString(UnZipBytes(zippedData, password));
        }

        /// <summary>
        /// ZIP解压Byte
        /// </summary>
        /// <param name="zippedData"></param>
        /// <returns></returns>
        public static byte[] UnZipBytes(byte[] zippedData, string password = "")
        {
            byte[] writeData = new byte[2048];
            ZipEntry theEntry = null;
            ZipInputStream zipinput = new ZipInputStream(new MemoryStream(zippedData));
            if (password != "")
            {
                zipinput.Password = password;
            }
            MemoryStream outStream = new MemoryStream();
            while ((theEntry = zipinput.GetNextEntry()) != null)
            {
                while (true)
                {
                    int size = zipinput.Read(writeData, 0, writeData.Length);
                    if (size > 0)
                    {
                        outStream.Write(writeData, 0, size);
                    }
                    else
                    {
                        break;
                    }
                }
            }
            zipinput.Close();
            byte[] outArr = outStream.ToArray();
            outStream.Close();
            return outArr;
        }

        #endregion
    }
}