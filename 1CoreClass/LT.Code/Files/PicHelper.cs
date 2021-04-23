/**
* Title: 图片文件操作的方法工具
* Author: yueye
* Date: 2018-09-18
* Desp:
*/
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace LT.Code
{
    public class CommonTools
    {
        #region 图片字符串和byte间转换

        /// <summary>
        /// 将string转为二进制文件(Base64方式)
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static byte[] PhotoStrToByte(string str)
        {
            return Convert.FromBase64String(str);
        }

        /// <summary>
        /// 将二进制文件转化为字符串（Base64方式）
        /// </summary>
        /// <param name="bytes"></param>
        /// <returns></returns>
        public static string PhotoByteToStr(byte[] bytes)
        {
            return Convert.ToBase64String(bytes);
        }

        /// <summary>
        /// 根据图片的二进制流，生产图片缩略图，并以Base64编码的字符串方式输出
        /// </summary>
        /// <param name="bytes"></param>
        /// <returns></returns>
        public static string PhotoByteToLiteStr(byte[] bytes)
        {

            //这里是产生缩略图的代码，如果需要使用到缩略图，解开这里就可以了
            bytes = MakeThumbnail(bytes, 400, 300);

            return Convert.ToBase64String(bytes);
        }

        #endregion

        #region 缩略图生成

        public static byte[] MakeThumbnail(byte[] sourceImg, int width, int height)
        {
            MemoryStream newStream = MakeMinPhoto(new MemoryStream(sourceImg), width, height);

            byte[] buff = new byte[newStream.Length];
            buff = newStream.ToArray();
            newStream.Close();
            newStream.Dispose();
            return buff;
        }

        /// <summary>
        /// 根据原图调整缩放图大小后再缩放，以尽量小原则
        /// </summary>
        /// <param name="sourceImg"></param>
        /// <param name="width"></param>
        /// <param name="height"></param>
        /// <returns></returns>
        public static MemoryStream MakeMinPhoto(Stream sourceImg, int width, int height)
        {
            ImageFormat imgFormate = CheckImgFormate(sourceImg);
            Image oig = new Bitmap(sourceImg);
            int tw = width, th = height;
            int ow = oig.Width, oh = oig.Height;

            if (ow < tw && oh < th)
            {
                MemoryStream tempStream = new MemoryStream();
                try
                {
                    oig.Save(tempStream, imgFormate);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    oig.Dispose();
                }
                return tempStream;
            }

            if ((double)oig.Width / (double)tw > (double)oig.Height / (double)th) //如果是宽度和要求的比例更宽，则按照宽来进行等比例缩放。
            {
                th = (int)(oh * (tw / (double)ow));
            }
            else
            {
                tw = (int)(ow * (th / (double)oh));
            }

            Image bitmap = new Bitmap(tw, th);
            Graphics g = Graphics.FromImage(bitmap);
            g.InterpolationMode = InterpolationMode.High;
            g.SmoothingMode = SmoothingMode.HighQuality;
            g.Clear(Color.Transparent);
            g.DrawImage(oig, new Rectangle(0, 0, tw, th), new Rectangle(0, 0, ow, oh), GraphicsUnit.Pixel);
            MemoryStream newStream = new MemoryStream();
            try
            {
                //bitmap.Save(newStream, ImageFormat.Jpeg);
                bitmap.Save(newStream, imgFormate);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oig.Dispose();
                bitmap.Dispose();
                g.Dispose();
            }

            return newStream;
        }

        /// <summary>
        /// 根据范围剪裁图片后再进行缩放
        /// </summary>
        /// <param name="sourceImg"></param>
        /// <param name="width"></param>
        /// <param name="height"></param>
        /// <returns></returns>
        public static MemoryStream MakeThumbnail(Stream sourceImg, int width, int height)
        {
            //判断图像格式
            ImageFormat imgFormate = CheckImgFormate(sourceImg);

            Image ig = new Bitmap(sourceImg);

            int towidth = width;
            int toheight = height;
            int x = 0;
            int y = 0;
            int ow = ig.Width;
            int oh = ig.Height;
            if ((double)ig.Width / (double)ig.Height > (double)towidth / (double)toheight)
            {
                oh = ig.Height;
                ow = ig.Height * towidth / toheight;
                y = 0;
                x = (ig.Width - ow) / 2;
            }
            else
            {
                ow = ig.Width;
                oh = ig.Width * height / towidth;
                x = 0;
                y = (ig.Height - oh) / 2;
            }
            Image bitmap = new Bitmap(towidth, toheight);
            Graphics g = Graphics.FromImage(bitmap);
            g.InterpolationMode = InterpolationMode.High;
            g.SmoothingMode = SmoothingMode.HighQuality;
            g.Clear(Color.Transparent);
            g.DrawImage(ig, new Rectangle(0, 0, towidth, toheight), new Rectangle(x, y, ow, oh), GraphicsUnit.Pixel);

            MemoryStream newStream = new MemoryStream();
            try
            {
                //bitmap.Save(newStream, ImageFormat.Jpeg);
                bitmap.Save(newStream, imgFormate);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ig.Dispose();
                bitmap.Dispose();
                g.Dispose();
            }

            return newStream;
        }

        /// <summary>
        /// 判断文件图像格式
        /// </summary>
        /// <param name="sourceImg"></param>
        /// <returns></returns>
        private static ImageFormat CheckImgFormate(Stream sourceImg)
        {
            ImageFormat imgFormate = ImageFormat.Jpeg; //默认为jpg
            byte[] temp = new byte[sourceImg.Length];
            sourceImg.Read(temp, 0, temp.Length);
            sourceImg.Seek(0, SeekOrigin.Begin);
            switch (GetTypeByStream(temp))
            {
                case "jpg":
                    imgFormate = ImageFormat.Jpeg;
                    break;
                case "png":
                    imgFormate = ImageFormat.Png;
                    break;
                case "gif":
                    imgFormate = ImageFormat.Gif;
                    break;
                case "tif":
                    imgFormate = ImageFormat.Tiff;
                    break;
                case "bmp":
                    imgFormate = ImageFormat.Bmp;
                    break;
            }
            return imgFormate;
        }

        #endregion

        /// <summary>
        /// 根据图片二进制流获取图片类型
        /// </summary>
        /// <param name="fileStream">图片的二进制流数据</param>
        /// <returns></returns>
        public static string GetTypeByStream(byte[] fileStream)
        {
            //get the begin four byte and convert to hex string
            byte[] fileTypeByte = new byte[4];
            Buffer.BlockCopy(fileStream, 0, fileTypeByte, 0, fileTypeByte.Length);

            //match with kown hex string
            string type = HexHelper.ByteArrayToHexString(fileTypeByte);

            if (type.Contains("FFD8FF"))
            {
                return "jpg";
            }
            else if (type.Contains("89504E47"))
            {
                return "png";
            }
            else if (type.Contains("47494638"))
            {
                return "gif";
            }
            else if (type.Contains("49492A00"))
            {
                return "tif";
            }
            else if (type.Contains("424D"))
            {
                return "bmp";
            }
            else
            {
                return "jpg";
            }
        }
    }
}

