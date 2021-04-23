/**
* Title: 验证码生成类
* Author: other
* Date: long long ago
* Desp: 
*/

using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Security.AccessControl;

namespace LT.Code
{
    public class VerifyCode
    {
        #region 生成验证码的属性设置

        private int codeW = 80;
        public int CodeWidth
        {
            set { codeW = value; }
        }

        private int codeH = 30;
        public int CodeHeight
        {
            set { codeH = value; }
        }

        int fontSize = 16;
        public int CodeFont
        {
            set { fontSize = value; }
        }

        private string chkCode = string.Empty;
        /// <summary>
        /// 在外部可以获取到生成的验证码信息，如果有session的话，直接在session中获取也可。
        /// </summary>
        public string Code
        {
            get { return chkCode; }
        }
        #endregion

        /// <summary>
        /// 获取当前对象
        /// </summary>
        public static VerifyCode Verify
        {
            get { return new VerifyCode(); }
        }

        /// <summary>
        /// 根据指定的编码生成验证码
        /// </summary>
        /// <param name="code">计划生成验证码的信息
        /// 推荐为：[0-9、a-z、A-Z]
        /// </param>
        /// <returns></returns>
        public byte[] GetVerifyCode(string code)
        {
            chkCode = code;
            return GetVerifyCode();
        }
        /// <summary>
        /// 生成验证码图片，将验证码图片的二进制流进行输出
        /// </summary>
        /// <returns></returns>
        public byte[] GetVerifyCode()
        {
            //颜色列表，用于验证码、噪线、噪点 
            Color[] color = { Color.Black, Color.Red, Color.Blue, Color.Green, Color.Orange, Color.Brown, Color.Brown, Color.DarkBlue };
            //字体列表，用于验证码 
            string[] font = { "Times New Roman" };
            Random rnd = new Random();
            if (string.IsNullOrEmpty(chkCode))
            {
                //验证码的字符集，去掉了一些容易混淆的字符 
                char[] character = { '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'd', 'e', 'f', 'h', 'k', 'm', 'n', 'r', 'x', 'y', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'W', 'X', 'Y' };
                //生成验证码字符串 
                for (int i = 0; i < 4; i++)
                {
                    chkCode += character[rnd.Next(character.Length)];
                }
            }
            //写入Session、验证码加密
            WebHelper.WriteSession("LT_session_verifycode", MD5Encrypt.GetMD5_16(chkCode.ToLower()));
            //创建画布
            Bitmap bmp = new Bitmap(codeW, codeH);
            Graphics g = Graphics.FromImage(bmp);
            g.Clear(Color.White);
            //画噪线 
            for (int i = 0; i < 3; i++)
            {
                int x1 = rnd.Next(codeW);
                int y1 = rnd.Next(codeH);
                int x2 = rnd.Next(codeW);
                int y2 = rnd.Next(codeH);
                Color clr = color[rnd.Next(color.Length)];
                g.DrawLine(new Pen(clr), x1, y1, x2, y2);
            }
            //画验证码字符串 
            for (int i = 0; i < chkCode.Length; i++)
            {
                string fnt = font[rnd.Next(font.Length)];
                Font ft = new Font(fnt, fontSize);
                Color clr = color[rnd.Next(color.Length)];
                g.DrawString(chkCode[i].ToString(), ft, new SolidBrush(clr), (float)i * 18, (float)0);
            }
            //将验证码图片写入内存流，并将其以 "image/Png" 格式输出 
            MemoryStream ms = new MemoryStream();
            try
            {
                bmp.Save(ms, ImageFormat.Png);
                return ms.ToArray();
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                g.Dispose();
                bmp.Dispose();
            }
        }

        /// <summary>
        /// 判断当前录入的验证码与生成的验证码是否一致
        /// </summary>
        /// <param name="code">录入的验证码</param>
        /// <returns>如果一致返回true，否则返回false</returns>
        public bool CheckVerifyCode(string code)
        {
            string nowverify = WebHelper.GetSession("LT_session_verifycode");
            if (!nowverify.Equals(MD5Encrypt.GetMD5_16(code.ToLower())))
            {
                return false;
            }
            return true;
        }
    }
}
