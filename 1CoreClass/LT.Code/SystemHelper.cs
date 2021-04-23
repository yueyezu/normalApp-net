/**
* Title: 系统信息的帮助类
* Author: yueye
* Date: 2017/12/12 14:32:43
* Desp: 对于当前操作系统的信息的获取、相关系统层面的操作的方法到的类
*/

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Management;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Runtime.InteropServices;

namespace LT.Code
{
    public class SystemHelper
    {
        /// <summary>
        /// 获取当前系统的位数（32/64）
        /// </summary>
        /// <returns>32 or 64</returns>
        public static string GetOsPlatform()
        {
            try
            {
                string addressWidth = String.Empty;
                ConnectionOptions mConnOption = new ConnectionOptions();
                ManagementScope mMs = new ManagementScope("\\\\localhost", mConnOption);
                ObjectQuery mQuery = new ObjectQuery("select AddressWidth from Win32_Processor");
                ManagementObjectSearcher mSearcher = new ManagementObjectSearcher(mMs, mQuery);
                ManagementObjectCollection mObjectCollection = mSearcher.Get();
                foreach (var o in mObjectCollection)
                {
                    var mObject = (ManagementObject)o;
                    addressWidth = mObject["AddressWidth"].ToString();
                }
                return addressWidth;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return String.Empty;
            }
        }


        #region 获取网络参数Ip,Host

        /// <summary>
        /// 获取局域网IP
        /// </summary>
        public static string GetLanIp()
        {
            foreach (var hostAddress in Dns.GetHostAddresses(Dns.GetHostName()))
            {
                if (hostAddress.AddressFamily == AddressFamily.InterNetwork)
                    return hostAddress.ToString();
            }
            return string.Empty;
        }

        /// <summary>
        /// 获取主机名
        /// </summary>
        public static string GetLanHostName()
        {
            return Dns.GetHostName();
        }

        #endregion

        #region 获取mac地址

        /// <summary>
        /// 返回描述本地计算机上的网络接口的对象(网络接口也称为网络适配器)。
        /// </summary>
        /// <returns></returns>
        public static NetworkInterface[] NetCardInfo()
        {
            return NetworkInterface.GetAllNetworkInterfaces();
        }

        ///<summary>
        /// 通过NetworkInterface读取网卡Mac
        ///</summary>
        ///<returns></returns>
        public static List<string> GetMacByNetworkInterface()
        {
            List<string> macs = new List<string>();
            NetworkInterface[] interfaces = NetworkInterface.GetAllNetworkInterfaces();
            foreach (NetworkInterface ni in interfaces)
            {
                macs.Add(ni.GetPhysicalAddress().ToString());
            }
            return macs;
        }

        /// <summary>
        /// 获得当前机器的活动中Mac地址，若无联网则返回空""
        /// 需在项目引用中添加 System.Management
        /// </summary>
        /// <returns>mac地址，例如：00-00-00-00-00-00</returns>
        public static string GetMacByWMI()
        {
            try
            {
                string mac = "";
                ManagementClass mc = new ManagementClass("Win32_NetworkAdapterConfiguration");
                ManagementObjectCollection moc = mc.GetInstances();
                foreach (ManagementObject mo in moc)
                    if ((bool)mo["IPEnabled"] == true)
                    {
                        mac = mo["MacAddress"].ToString();
                        break;
                    }
                moc = null;
                mc = null;
                return mac.Trim().Replace(':', '-');
            }
            catch (Exception e)
            {
                return "error:" + e.Message;
            }
        }

        #endregion

        #region Cmd操作

        /// <summary>
        /// 执行Cmd命令
        /// </summary>
        /// <param name="command">要执行的命令</param>
        public static bool StartCmd(String command)
        {
            try
            {
                ProcessStartInfo startInfo = new ProcessStartInfo
                {
                    FileName = "cmd.exe",
                    Arguments = "/C " + command,
                    UseShellExecute = false,
                    RedirectStandardInput = false,
                    RedirectStandardOutput = true,
                    CreateNoWindow = true
                };

                Process process = new Process { StartInfo = startInfo }; //创建进程对象
                bool flag = process.Start();
                process.WaitForExit(); //必须有这句，没有的话，可能还没有执行完就进行下面的操作，导致出错。
                return flag;
            }
            catch (Exception e)
            {
                LogHelper.Error(typeof(Utility), e);
                return false;
            }
        }

        /// <summary>
        /// 执行共享文件命令
        /// </summary>
        /// <param name="path">地址</param>
        /// <param name="userName">用户名</param>
        /// <param name="passWord">密码</param>
        /// <returns></returns>
        public static bool StartCmd(string path, string userName, string passWord)
        {
            bool flag = false;
            Process proc = new Process();
            try
            {
                proc.StartInfo.FileName = "cmd.exe";
                proc.StartInfo.UseShellExecute = false;
                proc.StartInfo.RedirectStandardInput = true;
                proc.StartInfo.RedirectStandardOutput = true;
                proc.StartInfo.RedirectStandardError = true;
                proc.StartInfo.CreateNoWindow = true;
                proc.Start();
                string dosLine = "net use " + path + " " + passWord + " /user:" + userName;
                proc.StandardInput.WriteLine(dosLine);
                proc.StandardInput.WriteLine("exit");
                while (!proc.HasExited)
                {
                    proc.WaitForExit(1000);
                }
                string errormsg = proc.StandardError.ReadToEnd();
                proc.StandardError.Close();
                if (string.IsNullOrEmpty(errormsg))
                {
                    flag = true;
                }
                else
                {
                    throw new Exception(errormsg);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                proc.Close();
                proc.Dispose();
            }
            return flag;
        }

        #endregion

        #region 进程操作

        /// <summary>
        /// 根据进程的名称，关闭进程
        /// </summary>
        /// <param name="name">进程的名称</param>
        public static void KillProcessExists(string name)
        {
            Process[] processes = Process.GetProcessesByName(name);
            foreach (Process p in processes)
            {
                p.Kill();
                p.Close();
            }
        }

        #endregion

        #region ping操作

        /// <summary>
        /// Ping命令检测网络是否畅通
        /// </summary>
        /// <param name="ip">需要Ping的Ip地址</param>
        /// <returns></returns>
        public static bool Ping(string ip)
        {
            bool isconn = true;
            Ping ping = new Ping();
            try
            {
                var pr = ping.Send(ip);

                if (pr != null && pr.Status != IPStatus.Success)
                {
                    isconn = false;
                }
            }
            catch
            {
                isconn = false;
            }
            return isconn;
        }

        /// <summary>
        /// 测试与指定服务器是否正常连接
        /// </summary>
        /// <param name="strIp"></param>
        /// <returns></returns>
        public static string CmdPing(string strIp)
        {
            Process p = new Process();
            p.StartInfo.FileName = "cmd.exe";
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardInput = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.CreateNoWindow = true;
            string pingrst;
            p.Start();
            p.StandardInput.WriteLine("ping -n 1 " + strIp);
            p.StandardInput.WriteLine("exit");
            string strRst = p.StandardOutput.ReadToEnd();
            if (strRst.IndexOf("(0% loss)") != -1)
                pingrst = "连接成功";
            else if (strRst.IndexOf("Destination host unreachable.") != -1)
                pingrst = "无法到达目的主机";
            else if (strRst.IndexOf("Request timed out.") != -1)
                pingrst = "超时";
            else if (strRst.IndexOf("Unknown host") != -1)
                pingrst = "无法解析主机";
            else
                pingrst = strRst;
            p.Close();
            return pingrst;
        }

        #endregion

        #region 获取本地连接状态

        private const int InternetConnectionModem = 1;
        private const int InternetConnectionLan = 2;

        [DllImport("winInet.dll")]
        private static extern bool InternetGetConnectedState(ref int dwFlag, int dwReserved);

        /// <summary>
        /// 判断本地的连接状态
        /// </summary>
        /// <returns></returns>
        public static bool LocalConnectionStatus()
        {
            Int32 dwFlag = new Int32();
            if (!InternetGetConnectedState(ref dwFlag, 0))
            {
                return false;
            }
            else
            {
                if ((dwFlag & InternetConnectionModem) != 0)
                {
                    return true;
                }
                else if ((dwFlag & InternetConnectionLan) != 0)
                {
                    return true;
                }
            }
            return false;
        }

        #endregion
    }
}
