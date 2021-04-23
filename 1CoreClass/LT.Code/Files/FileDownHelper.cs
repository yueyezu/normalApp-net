﻿/**
* Title: 文件服务器上传下载的操作
* Author: other
* Date: long long ago
* Desp:
*/
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;
using System.Web;

namespace LT.Code
{
    public class FileDownHelper
    {

        /// <summary>
        /// 根据文件的相对路径，进行文件的下载返回
        /// </summary>
        /// <param name="fileName">文件的绝对路径</param>
        /// <param name="name">下载文件的名称</param>
        public static void DownLoad(string fileName, string name)
        {
            string destFileName = FileHelper.GetFullPath(fileName);
            if (File.Exists(destFileName))
            {
                FileInfo fi = new FileInfo(destFileName);

                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ClearHeaders();
                HttpContext.Current.Response.Buffer = false;
                HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(name, System.Text.Encoding.UTF8));
                HttpContext.Current.Response.AppendHeader("Content-Length", fi.Length.ToString());
                HttpContext.Current.Response.ContentType = "application/octet-stream";
                HttpContext.Current.Response.WriteFile(destFileName);
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();
            }
        }

        /// <summary>
        /// 根据文件的相对路径进行文件的下载
        /// </summary>
        /// <param name="fileName">文件名称</param>
        public static void DownLoad(string fileName)
        {
            string filePath = FileHelper.GetFullPath(fileName);
            long chunkSize = 204800;             //指定块大小 
            byte[] buffer = new byte[chunkSize]; //建立一个200K的缓冲区 
            long dataToRead = 0;                 //已读的字节数   
            FileStream stream = null;
            try
            {
                //打开文件   
                stream = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.Read);
                dataToRead = stream.Length;

                //添加Http头   
                HttpContext.Current.Response.ContentType = "application/octet-stream";
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachement;filename=" + HttpUtility.UrlEncode(Path.GetFileName(filePath)));
                HttpContext.Current.Response.AddHeader("Content-Length", dataToRead.ToString());

                while (dataToRead > 0)
                {
                    if (HttpContext.Current.Response.IsClientConnected)
                    {
                        int length = stream.Read(buffer, 0, Convert.ToInt32(chunkSize));
                        HttpContext.Current.Response.OutputStream.Write(buffer, 0, length);
                        HttpContext.Current.Response.Flush();
                        HttpContext.Current.Response.Clear();
                        dataToRead -= length;
                    }
                    else
                    {
                        dataToRead = -1; //防止client失去连接 
                    }
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("Error:" + ex.Message);
            }
            finally
            {
                if (stream != null) stream.Close();
                HttpContext.Current.Response.Close();
            }
        }

        /// <summary>
        /// 根据指定的请求信息，进行文件的返回
        /// </summary>
        /// <param name="request">请求信息</param>
        /// <param name="response">返回对象</param>
        /// <param name="fileName">文件名称</param>
        /// <param name="fullPath">文件绝对路径</param>
        /// <param name="speed">下载速度控制</param>
        /// <returns></returns>
        public static bool ResponseFile(HttpRequest request, HttpResponse response, string fileName, string fullPath, long speed)
        {
            try
            {
                FileStream myFile = new FileStream(fullPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                BinaryReader br = new BinaryReader(myFile);
                try
                {
                    response.AddHeader("Accept-Ranges", "bytes");
                    response.Buffer = false;

                    long fileLength = myFile.Length;
                    long startBytes = 0;
                    int pack = 10240;  //10K bytes
                    int sleep = (int)Math.Floor((double)(1000 * pack / speed)) + 1;

                    if (request.Headers["Range"] != null)
                    {
                        response.StatusCode = 206;
                        string[] range = request.Headers["Range"].Split(new char[] { '=', '-' });
                        startBytes = Convert.ToInt64(range[1]);
                    }
                    response.AddHeader("Content-Length", (fileLength - startBytes).ToString());
                    if (startBytes != 0)
                    {
                        response.AddHeader("Content-Range", string.Format(" bytes {0}-{1}/{2}", startBytes, fileLength - 1, fileLength));
                    }

                    response.AddHeader("Connection", "Keep-Alive");
                    response.ContentType = "application/octet-stream";
                    response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));

                    br.BaseStream.Seek(startBytes, SeekOrigin.Begin);
                    int maxCount = (int)Math.Floor((double)((fileLength - startBytes) / pack)) + 1;

                    for (int i = 0; i < maxCount; i++)
                    {
                        if (response.IsClientConnected)
                        {
                            response.BinaryWrite(br.ReadBytes(pack));
                            Thread.Sleep(sleep);
                        }
                        else
                        {
                            i = maxCount;
                        }
                    }
                }
                catch
                {
                    return false;
                }
                finally
                {
                    br.Close();
                    myFile.Close();
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// 文件上传
        /// </summary>
        /// <param name="request">请求信息</param>
        /// <param name="filePath">图片保存路径</param>
        /// <returns></returns>
        public static Dictionary<string, string> Upload(HttpRequestBase request, string filePath)
        {
            Dictionary<string, string> dictionary = new Dictionary<string, string>();
            int i = 0;
            foreach (string fileNum in request.Files)
            {
                var fileBase = request.Files[fileNum];

                //扩展名
                string fileName = Path.GetFileName(fileBase.FileName);
                var dateTime = DateTime.Now;
                var filename = dateTime.ToString("yyyyMMddHHmmss") + dateTime.Millisecond.ToString() + "_" + fileName;

                var filepath = FileHelper.GetFullPath(filePath) + filename;

                fileBase.SaveAs(filepath);
                dictionary.Add(request.Files.AllKeys[i], filePath + "/" + filename);
                i = i + 1;
            }
            return dictionary;
        }
    }
}
