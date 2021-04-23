/**
* Title: Ini文件的操作类
* Author: yueye
* Date: 2017/12/12 14:37:11
* Desp: Ini文件的内容格式如下：
 *   [Section1 Name]
 *   KeyName1=value1 
 *   KeyName2=value2 
*/

using System.IO;
using System.Runtime.InteropServices;
using System.Text;

namespace LT.Code
{
    public class IniHelper
    {
        [DllImport("kernel32")]
        private static extern int GetPrivateProfileString(string section, string key, string def, StringBuilder retVal, int size, string filePath);

        [DllImport("kernel32")]
        private static extern long WritePrivateProfileString(string section, string key, string val, string filePath);

        /// <summary>
        /// 读取INI
        /// </summary>
        /// <param name="section">[******]名</param>
        /// <param name="key"></param>
        /// <param name="filePath">路径</param>
        /// <returns></returns>
        public static string GetIniValue(string section, string key, string filePath)
        {
            if (!File.Exists(filePath))
            {
                return null;
            }
            StringBuilder result = new StringBuilder(1024);
            GetPrivateProfileString(section, key, "读取错误！", result, 1024, filePath);
            return result.ToString();
        }

        /// <summary>
        /// 写INI文件
        /// </summary>
        /// <param name="section">分组节点</param>
        /// <param name="key">关键字</param>
        /// <param name="value">值</param>
        /// <param name="filePath">文件的路径</param>
        public static bool WriteIniValue(string section, string key, string value, string filePath)
        {
            if (!File.Exists(filePath))
            {
                return false;
            }
            if (WritePrivateProfileString(section, key, value, filePath) == 0)
            {
                return false;
            }
            return true;
        }
    }
}
