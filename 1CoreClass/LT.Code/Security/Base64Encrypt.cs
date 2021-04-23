/**
* Title: 采用Base64加密算法加密解密
* Author: other
* Date: long long ago
* Desp: Base64的转化以及相对应的加密解密方式
*/

using System;
using System.Collections.Generic;
using System.Text;

namespace LT.Code
{
    /// <summary>
    /// 基于Base64的加密编码辅助类，
    /// 可以设置不同的密码表来获取不同的编码与解码
    /// </summary>
    public class Base64Encrypt
    {
        /// <summary>
        /// 构造函数，初始化编码表
        /// </summary>
        public Base64Encrypt()
        {
            InitDict();
        }

        /// <summary>
        /// 获取具有标准的Base64密码表的加密类
        /// </summary>
        /// <returns></returns>
        public static Base64Encrypt GetStandardBase64()
        {
            Base64Encrypt b64 = new Base64Encrypt();
            b64.Pad = "=";
            b64.CodeTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            return b64;
        }

        #region base64加密解密

        protected static Base64Encrypt Sb64 = new Base64Encrypt();

        /// <summary>
        /// 使用默认的密码表加密字符串
        /// </summary>
        /// <param name="input">待加密字符串</param>
        /// <returns></returns>
        public static string Encrypt(string input)
        {
            return Sb64.Encode(input);
        }

        /// <summary>
        /// 使用默认的密码表解密字符串
        /// </summary>
        /// <param name="input">待解密字符串</param>
        /// <returns></returns>
        public static string Decrypt(string input)
        {
            return Sb64.Decode(input);
        }

        #endregion

        #region 采用base64的加密方式，采用自定义字典进行加密

        protected string MCodeTable = @"ABCDEFGHIJKLMNOPQRSTUVWXYZbacdefghijklmnopqrstu_wxyz0123456789*-";

        /// <summary>
        /// 密码表
        /// </summary>
        public string CodeTable
        {
            get { return MCodeTable; }
            set
            {
                if (value == null)
                {
                    throw new Exception("密码表不能为null");
                }
                else if (value.Length < 64)
                {
                    throw new Exception("密码表长度必须至少为64");
                }
                else
                {
                    //检测输入的字符串是否有重复
                    for (int i = 0; i < value.Length; i++)
                    {
                        if (value.LastIndexOf(value[i]) > i)
                        {
                            throw new Exception("密码表中含有重复字符：" + value[i]);
                        }
                    }
                    //检查字符串是否包含补码字符
                    if (value.IndexOf(MPad, StringComparison.Ordinal) > -1)
                    {
                        throw new Exception("密码表中包含了补码字符：" + MPad);
                    }

                    MCodeTable = value;
                    InitDict();
                }
            }
        }

        protected string MPad = "v";

        /// <summary>
        /// 补码
        /// </summary>
        public string Pad
        {
            get { return MPad; }
            set
            {
                if (value == null)
                {
                    throw new Exception("密码表的补码不能为null");
                }
                else if (value.Length != 1)
                {
                    throw new Exception("密码表的补码长度必须为1");
                }
                else
                {
                    //检查字符串是否包含补码字符
                    if (MCodeTable.IndexOf(value, StringComparison.Ordinal) > -1)
                    {
                        throw new Exception("密码表中包含了补码字符：" + value);
                    }

                    MPad = value;
                    InitDict();
                }
            }
        }

        protected Dictionary<int, char> Mt1 = new Dictionary<int, char>();
        protected Dictionary<char, int> Mt2 = new Dictionary<char, int>();

        /// <summary>
        /// 返回编码后的字符串
        /// </summary>
        /// <param name="source">原字符串</param>
        /// <returns></returns>
        public string Encode(string source)
        {
            if (string.IsNullOrEmpty(source))
            {
                return "";
            }

            StringBuilder sb = new StringBuilder();
            byte[] tmp = Encoding.UTF8.GetBytes(source);
            int remain = tmp.Length % 3;
            int patch = 3 - remain;
            if (remain != 0)
            {
                Array.Resize(ref tmp, tmp.Length + patch);
            }
            int cnt = (int)Math.Ceiling(tmp.Length * 1.0 / 3);
            for (int i = 0; i < cnt; i++)
            {
                sb.Append(EncodeUnit(tmp[i * 3], tmp[i * 3 + 1], tmp[i * 3 + 2]));
            }
            if (remain != 0)
            {
                sb.Remove(sb.Length - patch, patch);
                for (int i = 0; i < patch; i++)
                {
                    sb.Append(MPad);
                }
            }
            return sb.ToString();
        }

        /// <summary>
        /// 对于单个字符加密
        /// </summary>
        /// <param name="unit"></param>
        /// <returns></returns>
        protected string EncodeUnit(params byte[] unit)
        {
            int[] obj = new int[4];
            obj[0] = (unit[0] & 0xfc) >> 2;
            obj[1] = ((unit[0] & 0x03) << 4) + ((unit[1] & 0xf0) >> 4);
            obj[2] = ((unit[1] & 0x0f) << 2) + ((unit[2] & 0xc0) >> 6);
            obj[3] = unit[2] & 0x3f;
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < obj.Length; i++)
            {
                sb.Append(Mt1[obj[i]]);
            }
            return sb.ToString();
        }

        /// <summary>
        /// 获得解码字符串
        /// </summary>
        /// <param name="source">原字符串</param>
        /// <returns></returns>
        public string Decode(string source)
        {
            if (source == null || source == "")
            {
                return "";
            }
            else
            {
                List<byte> list = new List<byte>();
                char[] tmp = source.ToCharArray();
                int remain = tmp.Length % 4;
                if (remain != 0)
                {
                    Array.Resize(ref tmp, tmp.Length - remain);
                }
                int patch = source.IndexOf(MPad, StringComparison.Ordinal);
                if (patch != -1)
                {
                    patch = source.Length - patch;
                }
                int cnt = tmp.Length / 4;
                for (int i = 0; i < cnt; i++)
                {
                    DecodeUnit(list, tmp[i * 4], tmp[i * 4 + 1], tmp[i * 4 + 2], tmp[i * 4 + 3]);
                }
                for (int i = 0; i < patch; i++)
                {
                    list.RemoveAt(list.Count - 1);
                }
                return Encoding.UTF8.GetString(list.ToArray());
            }
        }

        /// <summary>
        /// 对于单个字符解密
        /// </summary>
        /// <param name="byteArr"></param>
        /// <param name="chArray"></param>
        /// <returns></returns>
        protected void DecodeUnit(List<byte> byteArr, params char[] chArray)
        {
            int[] res = new int[3];
            byte[] unit = new byte[chArray.Length];
            for (int i = 0; i < chArray.Length; i++)
            {
                unit[i] = (byte)Mt2[chArray[i]];
            }
            res[0] = (unit[0] << 2) + ((unit[1] & 0x30) >> 4);
            res[1] = ((unit[1] & 0xf) << 4) + ((unit[2] & 0x3c) >> 2);
            res[2] = ((unit[2] & 0x3) << 6) + unit[3];
            for (int i = 0; i < res.Length; i++)
            {
                byteArr.Add((byte)res[i]);
            }
        }

        #endregion

        /// <summary>
        /// 初始化双向哈希字典
        /// </summary>
        protected void InitDict()
        {
            Mt1.Clear();
            Mt2.Clear();
            Mt2.Add(MPad[0], -1);
            for (int i = 0; i < MCodeTable.Length; i++)
            {
                Mt1.Add(i, MCodeTable[i]);
                Mt2.Add(MCodeTable[i], i);
            }
        }
    }
}

