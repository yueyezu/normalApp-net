/*
 * 名称：FTP操作类
 * 用户：zxc
 * 时间：2014-09-26
 * 
 *  使用方式：
 *  string ftpConn = "server=192.168.0.1;userName=Test;password=test";
    FTPHelper ftpHelper = new FTPHelper(ftpConn);
    ftpHelper.OnUpLoadDataChange += ftpHelper_OnUpLoadDataChange;
    try
    {
        fileResult = ftpHelper.Upload(filePath, dataModel.TaskFileName);
    }
    catch (Exception ex)
    {
        LogHelp.LogErrorMsg("ftp上传错误。原因：" + ex, "MediaMsgForm.xaml.cs 193");
    }
 * **/

using System;
using System.Collections;
using System.IO;
using System.Net;

namespace LT.Code
{
    public class FTPHelper
    {
        #region properties

        private string loginPassword;
        private string remoteIP;
        private string loginUser;

        /// <summary>
        /// 远程服务器IP地址
        /// </summary>
        public string RemoteIP
        {
            get { return remoteIP; }
            set { remoteIP = value; }
        }

        /// <summary>
        /// 登录用户
        /// </summary>
        public string LoginUser
        {
            get { return loginUser; }
            set { loginUser = value; }
        }

        /// <summary>
        /// 登录密码
        /// </summary>
        public string LoginPassword
        {
            get { return loginPassword; }
            set { loginPassword = value; }
        }

        #endregion

        #region constructor

        public FTPHelper()
        {
        }

        /// <summary>
        /// 初始化FTPHelper类
        /// </summary>
        /// <param name="remoteIP">远程FTP服务器IP地址</param>
        /// <param name="loginUser">FTP登录账号</param>
        /// <param name="loginPassword">FTP登录密码</param>
        public FTPHelper(string remoteIP, string loginUser, string loginPassword)
        {
            this.remoteIP = remoteIP.Trim() == "" ? "localhost" : remoteIP.Trim();
            this.loginUser = loginUser.Trim();
            this.loginPassword = loginPassword.Trim();
        }

        /// <summary>
        /// 根据连接字符串连接ftp服务器
        /// 字符串形式：server=192.168.0.1;userName=Test;password=test
        /// </summary>
        /// <param name="connStr"></param>
        public FTPHelper(string connStr)
        {
            Hashtable hash = new Hashtable();
            string[] tempStrs = connStr.Split(';');
            foreach (string tempStr in tempStrs)
            {
                string[] temp = tempStr.Split('=');
                hash.Add(temp[0].Trim(), temp[1].Trim());
            }

            this.remoteIP = hash["server"].ToString();
            this.loginUser = hash["userName"].ToString();
            this.loginPassword = hash["password"].ToString();
        }

        #endregion

        #region 上传下载操作

        /// <summary>
        /// 上传文件到FTP服务器
        /// </summary>
        /// <param name="localFilePath">上传文件的本地路径和名称</param>
        /// <param name="remoteFilePath">上传文件的FTP路径和名称（相对FTP根目录）</param>
        /// <returns></returns>
        public bool Upload(string localFilePath, string remoteFilePath)
        {
            return Upload(localFilePath, remoteFilePath, remoteIP, loginUser, loginPassword);
        }

        /// <summary>
        /// 上传文件到FTP服务器
        /// </summary>
        /// <param name="localFilePath">上传文件的本地路径和名称</param>
        /// <param name="remoteFilePath">上传文件的FTP路径和名称（相对FTP根目录）</param>
        /// <param name="ftpServerIP">FTP服务器IP地址</param>
        /// <param name="loginName">FTP 服务器登录名</param>
        /// <param name="loginPassword">FTP 服务器登录密码</param>
        /// <returns>上传是否成功</returns>
        public bool Upload(string localFilePath, string remoteFilePath, string ftpServerIP, string loginName, string loginPassword)
        {
            MakeDirectoryOfFile(remoteFilePath, ftpServerIP, loginName, loginPassword);
            FileInfo fileInf = new FileInfo(localFilePath);

            string uri = "ftp://" + ftpServerIP + "/" + remoteFilePath;
            FtpWebRequest reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(uri));
            reqFTP.Credentials = new NetworkCredential(loginName, loginPassword);
            reqFTP.KeepAlive = false; // 在一个命令之后被执行 默认为true，连接不会被关闭
            reqFTP.Method = WebRequestMethods.Ftp.UploadFile;
            reqFTP.UseBinary = true; // 指定数据传输类型
            reqFTP.ContentLength = fileInf.Length; // 上传文件时通知服务器文件的大小

            int buffLength = 2048;
            byte[] buff = new byte[buffLength];

            FileStream fs = fileInf.OpenRead();
            Stream strm = null;
            try
            {
                strm = reqFTP.GetRequestStream(); // 把上传的文件写入流
                int contentLen = fs.Read(buff, 0, buffLength);
                while (contentLen != 0) // 流内容没有结束
                {
                    strm.Write(buff, 0, contentLen); // 把内容从file stream 写入 upload stream
                    contentLen = fs.Read(buff, 0, buffLength);
                }
            }
            catch (Exception ex)
            {
                reqFTP.Abort();
                LogHelper.Error(typeof(FTPHelper), ex);
                return false;
            }
            finally
            {
                if (strm != null) strm.Close();
                fs.Close();
            }
            return true;
        }

        /// <summary>
        /// 上传文件到FTP服务器
        /// </summary>
        /// <param name="localFile">上传文件的文件二进制流</param>
        /// <param name="remoteFilePath">上传文件的FTP路径和名称（相对FTP根目录）</param>
        /// <returns></returns>
        public bool Upload(byte[] localFile, string remoteFilePath)
        {
            return Upload(localFile, remoteFilePath, remoteIP, loginUser, loginPassword);
        }
        /// <summary>
        /// 上传文件到FTP服务器
        /// </summary>
        /// <param name="localFile">上传文件的文件二进制流</param>
        /// <param name="remoteFilePath">上传文件的FTP路径和名称（相对FTP根目录）</param>
        /// <param name="ftpServerIP">FTP服务器IP地址</param>
        /// <param name="loginName">FTP 服务器登录名</param>
        /// <param name="loginPassword">FTP 服务器登录密码</param>
        /// <returns>上传是否成功</returns>
        public bool Upload(byte[] localFile, string remoteFilePath, string ftpServerIP, string loginName, string loginPassword)
        {
            //创建ftp的文件夹
            MakeDirectoryOfFile(remoteFilePath, ftpServerIP, loginName, loginPassword);

            string uri = "ftp://" + ftpServerIP + "/" + remoteFilePath;
            FtpWebRequest reqFTP = (FtpWebRequest)WebRequest.Create(new Uri(uri));
            reqFTP.Credentials = new NetworkCredential(loginName, loginPassword);
            reqFTP.KeepAlive = false; // 在一个命令之后被执行 默认为true，连接不会被关闭
            reqFTP.Method = WebRequestMethods.Ftp.UploadFile;
            reqFTP.UseBinary = true; // 指定数据传输类型
            reqFTP.ContentLength = localFile.Length;  // 上传文件时通知服务器文件的大小

            int buffLength = 2048;
            byte[] buff = new byte[buffLength];

            Stream fs = new MemoryStream(localFile);
            Stream strm = null;
            try
            {
                strm = reqFTP.GetRequestStream();// 把上传的文件写入流
                int contentLen = fs.Read(buff, 0, buffLength);
                while (contentLen != 0)  // 流内容没有结束
                {
                    strm.Write(buff, 0, contentLen);    // 把内容从file stream 写入 upload stream
                    contentLen = fs.Read(buff, 0, buffLength);
                }
            }
            catch (Exception ex)
            {
                reqFTP.Abort();
                LogHelper.Error(typeof(FTPHelper), "FilePath:" + remoteFilePath, ex);
                return false;
            }
            finally
            {
                if (strm != null) strm.Close();
                fs.Close();
            }
            return true;
        }


        /// <summary>
        /// 从FTP服务器上下载文件
        /// </summary>
        /// <param name="localFilePath">本地路径和文件名</param>
        /// <param name="remoteFilePath">远程服务器文件路径和名称</param>
        /// <returns></returns>
        public bool Download(string localFilePath, string remoteFilePath)
        {
            return Download(localFilePath, remoteFilePath, remoteIP, loginUser, loginPassword);
        }
        /// <summary>
        /// 从FTP服务器上下载文件
        /// </summary>
        /// <param name="localFilePath">本地路径和文件名</param>
        /// <param name="remoteFilePath">远程服务器文件路径和名称</param>
        /// <param name="ftpServerIP">FTP服务器IP地址</param>
        /// <param name="loginName">FTP 服务器登录名</param>
        /// <param name="loginPassword">FTP 服务器登录密码</param>
        /// <returns>下载是否成功</returns>
        public bool Download(string localFilePath, string remoteFilePath, string ftpServerIP, string loginName, string loginPassword)
        {
            //GetFtpFileSize(remoteFilePath, ftpServerIP, loginName, loginPassword);
            FtpWebRequest reqFTP = (FtpWebRequest)WebRequest.Create(new Uri("ftp://" + ftpServerIP + "/" + remoteFilePath));
            reqFTP.Method = WebRequestMethods.Ftp.DownloadFile;
            reqFTP.UseBinary = true;
            reqFTP.Credentials = new NetworkCredential(loginName, loginPassword);
            FileStream outputStream = new FileStream(localFilePath, FileMode.Create);
            FtpWebResponse response = null;
            Stream ftpStream = null;
            try
            {
                response = (FtpWebResponse)reqFTP.GetResponse();
                ftpStream = response.GetResponseStream();
                int bufferSize = 2048;
                byte[] buffer = new byte[bufferSize];
                if (ftpStream != null)
                {
                    int readCount = ftpStream.Read(buffer, 0, bufferSize);
                    while (readCount > 0)
                    {
                        outputStream.Write(buffer, 0, readCount);
                        readCount = ftpStream.Read(buffer, 0, bufferSize);
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.Error(typeof(FTPHelper), "FilePath:" + remoteFilePath, ex);
                return false;
            }
            finally
            {
                if (ftpStream != null) ftpStream.Close();
                outputStream.Close();
                if (response != null) response.Close();
            }
            return true;
        }

        /// <summary>
        /// 从FTP服务器上下载文件
        /// </summary>
        /// <param name="remoteFilePath">远程服务器文件路径和名称</param>
        /// <returns></returns>
        public byte[] Download(string remoteFilePath)
        {
            return Download(remoteFilePath, remoteIP, loginUser, loginPassword);
        }
        /// <summary>
        /// 从FTP服务器上下载文件
        /// </summary>
        /// <param name="remoteFilePath">远程服务器文件路径和名称</param>
        /// <param name="ftpServerIP">FTP服务器IP地址</param>
        /// <param name="loginName">FTP 服务器登录名</param>
        /// <param name="loginPassword">FTP 服务器登录密码</param>
        /// <returns>下载是否成功</returns>
        public byte[] Download(string remoteFilePath, string ftpServerIP, string loginName, string loginPassword)
        {
            int lenth = GetFtpFileSize(remoteFilePath, ftpServerIP, loginName, loginPassword);
            FtpWebRequest reqFTP = (FtpWebRequest)WebRequest.Create(new Uri("ftp://" + ftpServerIP + "/" + remoteFilePath));
            reqFTP.Method = WebRequestMethods.Ftp.DownloadFile;
            reqFTP.UseBinary = true;
            reqFTP.Credentials = new NetworkCredential(loginName, loginPassword);
            FtpWebResponse response = null;
            Stream ftpStream = null;
            byte[] fileBytes;
            try
            {
                response = (FtpWebResponse)reqFTP.GetResponse();
                ftpStream = response.GetResponseStream();

                fileBytes = new byte[lenth];
                if (ftpStream != null) ftpStream.Read(fileBytes, 0, lenth);
                //int bufferSize = 2048;
                //int readCount;
                //long completedDataSize = 0;
                //byte[] buffer = new byte[bufferSize];
                //readCount = ftpStream.Read(buffer, 0, bufferSize);
                //while (readCount > 0)
                //{
                //    completedDataSize += readCount;
                //    readCount = ftpStream.Read(buffer, 0, bufferSize);
                //}

            }
            catch (Exception ex)
            {
                reqFTP.Abort();
                LogHelper.Error(typeof(FTPHelper), "FilePath:" + remoteFilePath, ex);
                return null;
            }
            finally
            {
                if (ftpStream != null) ftpStream.Close();
                if (response != null) response.Close();
            }
            return fileBytes;
        }

        #endregion

        /// <summary>
        /// 删除FTP服务器文件
        /// </summary>
        /// <param name="remoteFilePath">删除文件的FTP路径和名称（相对FTP根目录）</param>
        /// <returns></returns>
        public bool Delete(string remoteFilePath)
        {
            return Delete(remoteFilePath, remoteIP, loginUser, loginPassword);
        }
        /// <summary>
        /// 删除FTP服务器文件
        /// </summary>
        /// <param name="remoteFilePath">删除文件的FTP路径和名称（相对FTP根目录）</param>
        /// <param name="ftpServerIP">FTP服务器IP地址</param>
        /// <param name="loginName">FTP 服务器登录名</param>
        /// <param name="loginPassword">FTP 服务器登录密码</param>
        /// <returns>上传是否成功</returns>
        public bool Delete(string remoteFilePath, string ftpServerIP, string loginName, string loginPassword)
        {
            string uri = "ftp://" + ftpServerIP + "/" + remoteFilePath;
            FtpWebRequest reqFTP = (FtpWebRequest)WebRequest.Create(new Uri(uri));
            reqFTP.Credentials = new NetworkCredential(loginName, loginPassword);  // ftp用户名和密码
            reqFTP.KeepAlive = false; // 在一个命令之后被执行 默认为true，连接不会被关闭
            reqFTP.Method = WebRequestMethods.Ftp.DeleteFile; // 指定执行什么命令
            FtpWebResponse response = null;
            try
            {
                response = (FtpWebResponse)reqFTP.GetResponse();
            }
            catch (Exception ex)
            {
                reqFTP.Abort();
                LogHelper.Error(typeof(FTPHelper), "FilePath:" + remoteFilePath, ex);
                return false;
            }
            finally
            {
                if (response != null) response.Close();
            }
            return true;
        }

        /// <summary>
        /// 删除FTP服务器文件
        /// </summary>
        /// <param name="remoteFilePath">删除文件的FTP路径和名称（相对FTP根目录）</param>
        /// <returns></returns>
        public bool fileCheckExist(string remoteFilePath)
        {
            return fileCheckExist(remoteFilePath, remoteIP, loginUser, loginPassword);
        }
        /// <summary>
        /// 文件存在检查
        /// </summary>
        /// <param name="remoteFilePath">删除文件的FTP路径和名称（相对FTP根目录）</param>
        /// <param name="ftpServerIP">FTP服务器IP地址</param>
        /// <param name="loginName">FTP 服务器登录名</param>
        /// <param name="loginPassword">FTP 服务器登录密码</param>
        /// <returns></returns>
        public bool fileCheckExist(string remoteFilePath, string ftpServerIP, string loginName, string loginPassword)
        {
            string uri = "ftp://" + ftpServerIP + "/" + remoteFilePath;
            FtpWebRequest reqFTP = (FtpWebRequest)WebRequest.Create(new Uri(uri));
            reqFTP.Credentials = new NetworkCredential(loginName, loginPassword);
            reqFTP.Method = WebRequestMethods.Ftp.ListDirectory;
            reqFTP.KeepAlive = false;

            string fileName = remoteFilePath.Substring(remoteFilePath.LastIndexOf('/') + 1);

            WebResponse webResponse = null;
            StreamReader reader = null;
            bool success = false;
            try
            {
                webResponse = reqFTP.GetResponse();
                reader = new StreamReader(webResponse.GetResponseStream());
                string line = reader.ReadLine();
                while (line != null)
                {
                    if (line == fileName)
                    {
                        success = true;
                        break;
                    }
                    line = reader.ReadLine();
                }
            }
            catch (Exception ex)
            {
                reqFTP.Abort();
                LogHelper.Error(typeof(FTPHelper), "FilePath:" + remoteFilePath, ex);
                success = false;
            }
            finally
            {
                if (reader != null) reader.Close();
                if (webResponse != null) webResponse.Close();
                reqFTP.Abort();
            }
            return success;
        }

        /// <summary>
        /// 获取FTP服务器上指定文件的大小
        /// </summary>
        /// <param name="remoteFilePath">FTP服务器上的文件名和路径</param>
        /// <returns></returns>
        public int GetFtpFileSize(string remoteFilePath)
        {
            return GetFtpFileSize(remoteFilePath, remoteIP, loginUser, loginPassword);
        }
        /// <summary>
        /// 获取FTP服务器上指定文件的大小
        /// </summary>
        /// <param name="remoteFilePath">FTP服务器上的文件名和路径</param>
        /// <param name="ftpServerIP">FTP IP地址</param>
        /// <param name="ftpUserID">FTP 登录名</param>
        /// <param name="ftpPassword">FTP 登录密码</param>
        /// <returns>对应FTP上文件的大小（字节Byte）</returns>
        public int GetFtpFileSize(string remoteFilePath, string ftpServerIP, string ftpUserID, string ftpPassword)
        {
            FtpWebRequest reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + ftpServerIP + "/" + remoteFilePath));
            reqFTP.Credentials = new NetworkCredential(ftpUserID, ftpPassword);
            reqFTP.Method = WebRequestMethods.Ftp.GetFileSize;
            reqFTP.UseBinary = true;

            int fileSize = 0;
            FtpWebResponse response = null;
            Stream ftpStream = null;
            try
            {
                response = (FtpWebResponse)reqFTP.GetResponse();
                ftpStream = response.GetResponseStream();
                fileSize = (int)response.ContentLength;
            }
            catch (Exception ex)
            {
                reqFTP.Abort();
                LogHelper.Error(typeof(FTPHelper), "FilePath:" + remoteFilePath, ex);
                throw ex;
            }
            finally
            {
                if (ftpStream != null) ftpStream.Close();
                if (response != null) response.Close();
                reqFTP.Abort();
            }
            return fileSize;
        }

        #region ftp上创建文件夹

        /// <summary>
        /// 在FTP服务器上创建文件夹
        /// </summary>
        /// <param name="remotePath">创建文件夹路径</param>
        /// <param name="ftpServerIP">FTP服务器IP地址</param>
        /// <param name="loginName">FTP 服务器登录名</param>
        /// <param name="loginPassword">FTP 服务器登录密码</param>
        /// <returns>是否创建成功</returns>
        public bool MakeDirectory(string remotePath, string ftpServerIP, string loginName, string loginPassword)
        {
            FtpWebRequest reqFTP;
            reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + ftpServerIP + "/" + remotePath));
            reqFTP.Method = WebRequestMethods.Ftp.MakeDirectory;
            reqFTP.UseBinary = true;
            reqFTP.Credentials = new NetworkCredential(loginName, loginPassword);
            try
            {
                FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
                response.Close();
            }
            catch (Exception ex)
            {
                reqFTP.Abort();
                LogHelper.Error(typeof(FTPHelper), "FilePath:" + remotePath, ex);
                return false;
            }
            reqFTP.Abort();
            return true;
        }
        /// <summary>
        /// 在FTP服务器上创建文件夹
        /// </summary>
        /// <param name="remotePath">创建文件夹路径</param>
        /// <returns>是否创建成功</returns>
        public bool MakeDirectory(string remotePath)
        {
            return MakeDirectory(remotePath, this.remoteIP, this.loginUser, this.loginPassword);
        }

        /// <summary>
        /// 根据文件路径创建文件夹
        /// </summary>
        /// <param name="remoteFilePath">文件及路径名</param>
        /// <param name="ftpServerIP">FTP服务器IP地址</param>
        /// <param name="loginName">FTP 服务器登录名</param>
        /// <param name="loginPassword">FTP 服务器登录密码</param>
        /// <returns>是否创建成功</returns>
        public bool MakeDirectoryOfFile(string remoteFilePath, string ftpServerIP, string loginName, string loginPassword)
        {
            string[] directorys;
            if (remoteFilePath.IndexOf('/') > 0)
                directorys = remoteFilePath.Split('/'); //数组最后一个为文件名
            else
                directorys = remoteFilePath.Split('\\');
            string currentDirectory = "";
            for (int index = 0; index < directorys.Length - 1; index++)
            {
                currentDirectory += directorys[index] + "/";
                this.MakeDirectory(currentDirectory, ftpServerIP, loginName, loginPassword);
            }
            return true;
        }
        /// <summary>
        /// 根据文件路径创建文件夹
        /// </summary>
        /// <param name="remoteFilePath">文件及路径名</param>
        /// <returns>是否创建成功</returns>
        public bool MakeDirectoryOfFile(string remoteFilePath)
        {
            return MakeDirectoryOfFile(remoteFilePath, this.remoteIP, this.loginUser, this.loginPassword);
        }

        #endregion
    }
}
