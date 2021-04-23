/**
* Title: Int、Double、Decimal类型的扩展方法
* Author: other
* Date: long long ago
* Desp: 
*/

using System;
using System.Threading;

namespace LT.Code
{
    public static partial class Ext
    {
        #region Int

        /// <summary>
        /// 转换为整型
        /// </summary>
        /// <param name="data">数据</param>
        public static int ToInt(this object data)
        {
            if (data == null)
                return 0;
            int result;
            var success = int.TryParse(data.ToString(), out result);
            if (success)
                return result;
            try
            {
                return Convert.ToInt32(ToDouble(data, 0));
            }
            catch (Exception)
            {
                return 0;
            }
        }

        /// <summary>
        /// 转换为可空整型
        /// </summary>
        /// <param name="data">数据</param>
        public static int? ToIntOrNull(this object data)
        {
            if (data == null)
                return null;
            int result;
            bool isValid = int.TryParse(data.ToString(), out result);
            if (isValid)
                return result;
            return null;
        }

        /// <summary>
        /// 获取格式化字符串
        /// </summary>
        /// <param name="number">数值</param>
        /// <param name="defaultValue">空值显示的默认文本</param>
        public static string ToStringExt(this int number, string defaultValue = "")
        {
            if (number == 0)
                return defaultValue;
            return number.ToString();
        }

        /// <summary>
        /// 获取格式化字符串
        /// </summary>
        /// <param name="number">数值</param>
        /// <param name="defaultValue">空值显示的默认文本</param>
        public static string ToStringExt(this int? number, string defaultValue = "")
        {
            return ToStringExt(number.SafeValue(), defaultValue);
        }

        #endregion

        #region Double

        /// <summary>
        /// 转换为双精度浮点数
        /// </summary>
        /// <param name="data">数据</param>
        public static double ToDouble(this object data)
        {
            if (data == null)
                return 0;
            double result;
            return double.TryParse(data.ToString(), out result) ? result : 0;
        }

        /// <summary>
        /// 转换为双精度浮点数,并按指定的小数位4舍5入
        /// </summary>
        /// <param name="data">数据</param>
        /// <param name="digits">小数位数</param>
        public static double ToDouble(this object data, int digits)
        {
            return Math.Round(ToDouble(data), digits);
        }

        /// <summary>
        /// 转换为可空双精度浮点数
        /// </summary>
        /// <param name="data">数据</param>
        public static double? ToDoubleOrNull(this object data)
        {
            if (data == null)
                return null;
            double result;
            bool isValid = double.TryParse(data.ToString(), out result);
            if (isValid)
                return result;
            return null;
        }

        /// <summary>
        /// 转换为可空双精度浮点数
        /// </summary>
        /// <param name="data">数据</param>
        /// <param name="digits">小数位数</param>
        public static double? ToDoubleOrNull(this object data, int digits)
        {
            var result = ToDoubleOrNull(data);
            if (result == null)
                return null;
            return Math.Round(result.Value, digits);
        }

        /// <summary>
        /// 获取格式化字符串
        /// </summary>
        /// <param name="number">数值</param>
        /// <param name="defaultValue">空值显示的默认文本</param>
        public static string ToStringExt(this double number, string defaultValue = "")
        {
            if (number == 0)
                return defaultValue;
            return string.Format("{0:0.##}", number);
        }

        /// <summary>
        /// 获取格式化字符串
        /// </summary>
        /// <param name="number">数值</param>
        /// <param name="defaultValue">空值显示的默认文本</param>
        public static string ToStringExt(this double? number, string defaultValue = "")
        {
            return ToStringExt(number.SafeValue(), defaultValue);
        }

        /// <summary>
        /// 获取数字的小数的位数
        /// </summary>
        /// <param name="num">数字</param>
        /// <returns></returns>
        public static int DigitsLen(this double num)
        {
            string temp = num.ToString();
            return temp.Length - (temp.IndexOf('.') + 1);
        }

        #endregion

        #region Decimal

        /// <summary>
        /// 转换为高精度浮点数
        /// </summary>
        /// <param name="data">数据</param>
        public static decimal ToDecimal(this object data)
        {
            if (data == null)
                return 0;
            decimal result;
            return decimal.TryParse(data.ToString(), out result) ? result : 0;
        }

        /// <summary>
        /// 转换为高精度浮点数,并按指定的小数位4舍5入
        /// </summary>
        /// <param name="data">数据</param>
        /// <param name="digits">小数位数</param>
        public static decimal ToDecimal(this object data, int digits)
        {
            return Math.Round(ToDecimal(data), digits);
        }

        /// <summary>
        /// 转换为可空高精度浮点数
        /// </summary>
        /// <param name="data">数据</param>
        public static decimal? ToDecimalOrNull(this object data)
        {
            if (data == null)
                return null;
            decimal result;
            bool isValid = decimal.TryParse(data.ToString(), out result);
            if (isValid)
                return result;
            return null;
        }

        /// <summary>
        /// 转换为可空高精度浮点数,并按指定的小数位4舍5入
        /// </summary>
        /// <param name="data">数据</param>
        /// <param name="digits">小数位数</param>
        public static decimal? ToDecimalOrNull(this object data, int digits)
        {
            var result = ToDecimalOrNull(data);
            if (result == null)
                return null;
            return Math.Round(result.Value, digits);
        }

        /// <summary>
        /// 获取格式化字符串
        /// </summary>
        /// <param name="number">数值</param>
        /// <param name="defaultValue">空值显示的默认文本</param>
        public static string ToStringExt(this decimal number, string defaultValue = "")
        {
            if (number == 0)
                return defaultValue;
            return string.Format("{0:0.##}", number);
        }
        /// <summary>
        /// 获取格式化字符串
        /// </summary>
        /// <param name="number">数值</param>
        /// <param name="defaultValue">空值显示的默认文本</param>
        public static string ToStringExt(this decimal? number, string defaultValue = "")
        {
            return ToStringExt(number.SafeValue(), defaultValue);
        }

        /// <summary>
        /// 获取数字的小数的位数
        /// </summary>
        /// <param name="num">数字</param>
        /// <returns></returns>
        public static int DigitsLen(this decimal num)
        {
            string temp = num.ToString();
            return temp.Length - (temp.IndexOf('.') + 1);
        }

        #endregion

        #region Format RMB

        /// <summary>
        /// 获取格式化字符串,带￥
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatRmb(this int number)
        {
            return string.Format("￥{0}", number);
        }
        /// <summary>
        /// 获取格式化字符串,带￥
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatRmb(this int? number)
        {
            return string.Format("￥{0}", number.SafeValue());
        }

        /// <summary>
        /// 获取格式化字符串,带￥
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatRmb(this double number)
        {
            if (number == 0)
                return "￥0";
            return string.Format("￥{0:0.##}", number);
        }
        /// <summary>
        /// 获取格式化字符串,带￥
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatRmb(this double? number)
        {
            return FormatRmb(number.SafeValue());
        }

        /// <summary>
        /// 获取格式化字符串,带￥
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatRmb(this decimal number)
        {
            if (number == 0)
                return "￥0";
            return string.Format("￥{0:0.##}", number);
        }
        /// <summary>
        /// 获取格式化字符串,带￥
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatRmb(this decimal? number)
        {
            return FormatRmb(number.SafeValue());
        }

        #endregion

        #region Format Percent

        /// <summary>
        /// 获取格式化字符串,带%
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatPercent(this decimal number)
        {
            if (number == 0)
                return string.Empty;
            return string.Format("{0:0.##}%", number);
        }
        /// <summary>
        /// 获取格式化字符串,带%
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatPercent(this decimal? number)
        {
            return FormatPercent(number.SafeValue());
        }

        /// <summary>
        /// 获取格式化字符串,带%
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatPercent(this double number)
        {
            if (number == 0)
                return string.Empty;
            return string.Format("{0:0.##}%", number);
        }
        /// <summary>
        /// 获取格式化字符串,带%
        /// </summary>
        /// <param name="number">数值</param>
        public static string FormatPercent(this double? number)
        {
            return FormatPercent(number.SafeValue());
        }

        #endregion

        #region function 产生随机数

        /// <summary>
        /// 获取简单的随机数
        /// </summary>
        /// <param name="min"></param>
        /// <param name="max"></param>
        /// <returns></returns>
        public static int GetRandom(int min, int max)
        {
            Random ran = new Random();
            int num = ran.Next(min, max);
            return num;
        }

        /// <summary>
        /// 获取简单的随机数,参数为随机数位数
        /// </summary>
        /// <param name="num">随机数位数</param>
        /// <returns></returns>
        public static int GetRandom(int num)
        {
            Random ran = new Random();
            int min = Convert.ToInt32(Math.Pow(10, num - 1));
            int max = Convert.ToInt32(Math.Pow(10, num)) - 1;
            return ran.Next(min, max);
        }

        /// <summary>
        /// 获取两数之间的随机数
        /// </summary>
        /// <param name="min">随机数最小值</param>
        /// <param name="max">随机数最大值</param>
        /// <param name="type"> 值可以为:proc(适用于同时多个线程同时调用随机数)
        /// time(适用于统一进程，需要短时间内获取多个随机值) </param>
        /// <param name="isDouble">获取的是否是double类型的随机数</param>
        /// <returns></returns>
        public static double GetRandom(double min, double max, string type, bool isDouble = false)
        {
            int seed = DateTime.Now.Millisecond;
            switch (type)
            {
                case "proc":
                    seed += Thread.CurrentThread.ManagedThreadId;
                    break;
                case "time":
                    seed += new Guid().GetHashCode();
                    break;
                default:
                    break;
            }
            return GetRandom(min, max, seed, isDouble);
        }

        /// <summary>
        /// 生成随机数，传入生成的种子内容
        /// </summary>
        /// <param name="min">随机数最小值</param>
        /// <param name="max">随机数最大值</param>
        /// <param name="seed">生成随机数的种子</param>
        /// <param name="isDouble">获取的是否是double类型的随机数</param>
        /// <returns></returns>
        public static double GetRandom(double min, double max, int seed, bool isDouble = false)
        {
            Random ran = new Random(seed);
            double randnum = 0;
            if (isDouble)
            {
                int len = Math.Max(min.DigitsLen(), max.DigitsLen());
                int times = Convert.ToInt32(Math.Pow(10, len));
                int tempInt = Convert.ToInt32((max - min) * times);
                double tempRun = ran.Next(0, tempInt);
                randnum = tempRun / times;
                randnum += min;
            }
            else
            {
                randnum = ran.Next((int)min, (int)max);
            }
            return randnum;
        }

        #endregion
    }
}
