/**
* Title: rar的压缩解压操作
* Author: other
* Date: long long ago
* Desp: 通过系统配置表找到rar安装目录，调用rar工具进行压缩解压操作。
 *  可以通过文件路径以及压缩的路径进行压缩与解压操作。
*/

using System;
using System.Diagnostics;
using Microsoft.Win32;

namespace LT.Code
{
    public class Rar
    {
        #region 私有变量
        String theRar;
        RegistryKey theReg;
        Object theObj;
        String theInfo;
        ProcessStartInfo theStartInfo;
        Process theProcess;
        #endregion

        /// <summary>
        /// 压缩
        /// </summary>
        /// <param name="zipname">要解压的文件名</param>
        /// <param name="zippath">要压缩的文件目录</param>
        /// <param name="dirpath">初始目录</param>
        public void EnZip(string zipname, string zippath, string dirpath)
        {
            try
            {
                theReg = Registry.ClassesRoot.OpenSubKey(@"Applications\WinRAR.exe\Shell\Open\Command");
                theObj = theReg.GetValue("");
                theRar = theObj.ToString();
                theReg.Close();
                theRar = theRar.Substring(1, theRar.Length - 7);
                theInfo = " a    " + zipname + "  " + zippath;
                theStartInfo = new ProcessStartInfo();
                theStartInfo.FileName = theRar;
                theStartInfo.Arguments = theInfo;
                theStartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                theStartInfo.WorkingDirectory = dirpath;
                theProcess = new Process();
                theProcess.StartInfo = theStartInfo;
                theProcess.Start();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 解压缩
        /// </summary>
        /// <param name="zipname">要解压的文件名</param>
        /// <param name="zippath">要解压的文件路径</param>
        public void DeZip(string zipname, string zippath)
        {
            try
            {
                theReg = Registry.ClassesRoot.OpenSubKey(@"Applications\WinRar.exe\Shell\Open\Command");
                theObj = theReg.GetValue("");
                theRar = theObj.ToString();
                theReg.Close();
                theRar = theRar.Substring(1, theRar.Length - 7);
                theInfo = " X " + zipname + " " + zippath;
                theStartInfo = new ProcessStartInfo();
                theStartInfo.FileName = theRar;
                theStartInfo.Arguments = theInfo;
                theStartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                theProcess = new Process();
                theProcess.StartInfo = theStartInfo;
                theProcess.Start();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
