/**
* Title: 16进制字符串数字的操作类。
* Author: yueye
* Date: 2018/1/15 13:33:46
* Desp: 一般涉及到一些业务的操作类，好多采用16进制的形式进行操作，这里对传输字符串的转化进行封装。
*/

using System;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace LT.Code
{
    public class HexHelper
    {
        /// <summary>
        /// 格式化字符串，将不完整的16进制字符串 进行前边补0，转化为可转化的16进制
        /// </summary>
        /// <param name="str">获取的字符串</param>
        /// <returns>格式化后的字符串</returns>
        public static string FormatHexStrPre(string str)
        {
            str = str.Trim();

            bool isHex = Regex.IsMatch(str, "^[0-9A-Fa-f]+$");
            if (!isHex)
                throw new Exception("字符串中含有非16进制的字符,无法进行转化！");

            int len = str.Length; //当前字符串长度

            if ((len % 2) == 0) return str;

            str = "0" + str;
            return str;
        }

        /// <summary>
        /// 格式化字符串，将不完整的16进制字符串 进行后边补0，转化为可转化的16进制
        /// </summary>
        /// <param name="str">获取的字符串</param>
        /// <returns>格式化后的字符串</returns>
        public static string FormatHexStrAfter(string str)
        {
            str = str.Trim();

            bool isHex = Regex.IsMatch(str, "^[0-9A-Fa-f]+$");
            if (!isHex)
                throw new Exception("字符串中含有非16进制的字符,无法进行转化！");

            int len = str.Length; //当前字符串长度
            if ((len % 2) == 0) return str;

            str += "0";

            return str;
        }

        /// <summary>
        /// 检测字符串是否是16进制的字符串
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool CheckIsHexStr(string str)
        {
            bool isHex = Regex.IsMatch(str, "^[0-9A-Fa-f]+$");
            if (!isHex) return false;

            int len = str.Length; //当前字符串长度
            return ((len % 4) == 0);
        }

        /// <summary>
        /// string to byteArray
        /// </summary>
        /// <returns>转换后的byte类型</returns>
        public static byte[] HexStringToByteArray(string str)
        {
            if (!CheckIsHexStr(str))
            {
                throw new Exception("字符串不是正确的16进制字符串,无法进行转化！");
            }

            str = str.Replace(" ", "");
            byte[] buffer = new byte[str.Length / 2];
            for (int i = 0; i < str.Length; i += 2)
                buffer[i / 2] = Convert.ToByte(str.Substring(i, 2), 16);
            return buffer;
        }
        /// <summary>
        ///  byteArray to string
        /// </summary>
        /// <returns>转换后的string类型</returns>
        public static string ByteArrayToHexString(byte[] data)
        {
            StringBuilder sb = new StringBuilder(data.Length * 3);
            foreach (byte b in data)
            {
                sb.Append(Convert.ToString(b, 16).PadLeft(2, '0'));
            }
            return sb.ToString().ToUpper();
        }

        /// <summary>
        /// 将字符转化为16进制的字符串
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        public static string ByteToHexString(byte b)
        {
            string tempStr = Convert.ToString(b, 16).PadLeft(2, '0');
            return tempStr.ToUpper();
        }

        /// <summary>
        /// 作用：将字符串内容转化为16进制数据编码，其逆过程是Decode
        /// 参数说明：
        /// strEncode 需要转化的原始字符串
        /// 转换的过程是直接把字符转换成Unicode字符,比如数字"3"-->0033,汉字"我"-->U+6211
        /// 函数decode的过程是encode的逆过程.
        /// </summary>
        /// <param name="strEncode"></param>
        /// <returns></returns>
        public static string EncodeHex(string strEncode)
        {
            string strReturn = "";//  存储转换后的编码
            foreach (short shortx in strEncode.ToCharArray())
            {
                strReturn += shortx.ToString("X4");
            }
            return strReturn;
        }

        /// <summary>
        /// 作用：将字符串内容转化为16进制数据编码，其逆过程是Decode
        /// 参数说明：
        /// strEncode 需要转化的原始字符串,全是字母
        /// 转换的过程是直接把字符转换成ASCII码,比如数字"3"-->33
        /// 函数decodeE的过程是encodeE的逆过程.
        /// </summary>
        /// <param name="strEncode"></param>
        /// <returns></returns>
        public static string EncodeHexE(string strEncode)
        {
            string strReturn = "";//  存储转换后的编码
            foreach (short shortx in strEncode.ToCharArray())
            {
                strReturn += shortx.ToString("X2");
            }
            return strReturn;
        }

        /// <summary>
        /// 作用：将16进制数据编码转化为字符串，是Encode的逆过程
        /// </summary>
        /// <param name="strDecode"></param>
        /// <returns></returns>
        public static string DecodeHex(string strDecode)
        {
            string sResult = "";
            for (int i = 0; i < strDecode.Length / 4; i++)
            {
                sResult += (char)short.Parse(strDecode.Substring(i * 4, 4), NumberStyles.HexNumber);
            }
            return sResult;
        }

        /// <summary>
        /// 作用：将16进制数据编码转化为字符串，是Encode的逆过程
        /// </summary>
        /// <param name="strDecode"></param>
        /// <returns></returns>
        public static string DecodeHexE(string strDecode)
        {
            string sResult = "";
            for (int i = 0; i < strDecode.Length / 2; i++)
            {
                sResult += (char)short.Parse(strDecode.Substring(i * 2, 2), NumberStyles.HexNumber);
            }
            return sResult;
        }

        /// <summary>
        /// 从汉字转换到16进制
        /// </summary>
        /// <param name="s"></param>
        /// <param name="charset">编码,如"utf-8","gb2312"</param>
        /// <param name="fenge">是否每字符用逗号分隔</param>
        /// <returns></returns>
        public static string ToHex(string s, string charset, bool fenge)
        {
            if ((s.Length % 2) != 0)
            {
                s += " ";//空格
                //throw new ArgumentException("s is not valid chinese string!");
            }
            var chs = Encoding.GetEncoding(charset);
            byte[] bytes = chs.GetBytes(s);
            string str = "";
            for (int i = 0; i < bytes.Length; i++)
            {
                str += string.Format("{0:X}", bytes[i]);
                if (fenge && (i != bytes.Length - 1))
                {
                    str += string.Format("{0}", ",");
                }
            }
            return str.ToLower();
        }

        ///<summary>
        /// 从16进制转换成汉字
        /// </summary>
        /// <param name="hex"></param>
        /// <param name="charset">编码,如"utf-8","gb2312"</param>
        /// <returns></returns>
        public static string UnHex(string hex, string charset)
        {
            if (hex == null)
                throw new ArgumentNullException("hex");
            hex = hex.Replace(",", "");
            hex = hex.Replace("\n", "");
            hex = hex.Replace("\\", "");
            hex = hex.Replace(" ", "");
            if (hex.Length % 2 != 0)
            {
                hex += "20";//空格
            }
            // 需要将 hex 转换成 byte 数组。 
            byte[] bytes = new byte[hex.Length / 2];

            for (int i = 0; i < bytes.Length; i++)
            {
                try
                {
                    // 每两个字符是一个 byte。 
                    bytes[i] = byte.Parse(hex.Substring(i * 2, 2), NumberStyles.HexNumber);
                }
                catch
                {
                    // Rethrow an exception with custom message. 
                    throw new ArgumentException("hex is not a valid hex number!", "hex");
                }
            }
            Encoding chs = Encoding.GetEncoding(charset);
            return chs.GetString(bytes);
        }
    }
}
