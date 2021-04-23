/**
* Title: 网络信息检测以及获取的类
* Author: yueye
* Date: 2017/12/12 14:32:43
* Desp: 对于服务器的Ip获取以及对Ip判断之类的功能，当进行接口请求时，可以开个检测是否网络连接的线程。
*/

using System;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Text;
using System.Web;
using Newtonsoft.Json.Linq;

namespace LT.Code
{
    /// <summary>
    /// 网络操作
    /// </summary>
    public class NetHelper
    {
        /// <summary>
        /// 获取Web客户端的Ip
        /// </summary>
        public static string GetClientIp()
        {
            var ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"]
                ?? HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            foreach (var hostAddress in Dns.GetHostAddresses(ip))
            {
                if (hostAddress.AddressFamily == AddressFamily.InterNetwork)
                    return hostAddress.ToString();
            }
            return string.Empty;
        }

        /// <summary>
        /// 获取Web客户端主机名
        /// </summary>
        public static string GetClientHostName()
        {
            if (!HttpContext.Current.Request.IsLocal)
                return string.Empty;
            var ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"]
                ?? HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            var result = Dns.GetHostEntry(IPAddress.Parse(ip)).HostName;
            if (result == "localhost.localdomain")
                result = Dns.GetHostName();
            return result;
        }

        /// <summary>
        /// 获取外网的IP地址
        /// </summary>
        /// <returns></returns>
        public static string GetPublicIp()
        {
            string strUrl = "http://www.ip138.com/ip2city.asp"; //获得IP的网址了
            Uri uri = new Uri(strUrl);
            WebRequest wr = WebRequest.Create(uri);
            System.IO.Stream s = wr.GetResponse().GetResponseStream();
            System.IO.StreamReader sr = new System.IO.StreamReader(s, Encoding.Default);
            string all = sr.ReadToEnd(); //读取网站的数据
            string ip = all.Substring("[", "]");
            return ip;
        }

        /// <summary>
        /// 获取IP地址所在城市
        /// </summary>
        /// <param name="ip"></param>
        /// <returns></returns>
        public static string GetLocation(string ip)
        {
            //检测如果是无效的IP地址时，直接不进行获取
            if (!Validate.IsValidIP(ip))
            {
                return "";
            }

            string res;
            #region 使用taobao的ip获取接口实现
            try
            {
                string url = "http://ip.taobao.com/service/getIpInfo.php?ip=" + ip;
                //{"code":0,"data":{"ip":"218.192.3.42","country":"中国","area":"",
                //"region":"广东","city":"广州","county":"XX","isp":"教育网","country_id":"CN",
                //"area_id":"","region_id":"440000","city_id":"440100","county_id":"xx","isp_id":"100027"}}
                res = RequestHelper.HttpGet(url);

                JObject tempResult = (JObject)res.ToObject();
                if (tempResult["code"].ToString() == "0")
                {
                    res = tempResult["data"]["region"] + " " + tempResult["data"]["city"];
                }
                else
                {
                    res = "";
                }
            }
            catch
            {
                res = "";
            }

            #endregion
            if (!string.IsNullOrEmpty(res))
            {
                return res;
            }
            #region 调用新浪的接口实现
            try
            {
                string url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=" + ip;
                //{"ret":1,"start":-1,"end":-1,"country":"\u4e2d\u56fd","province":"\u5e7f\u4e1c",
                //"city":"\u5e7f\u5dde","district":"","isp":"","type":"","desc":""}
                res = RequestHelper.HttpGet(url, Encoding.GetEncoding("GBK"));
                JObject tempResult = (JObject)res.ToObject();
                if (tempResult["ret"].ToString() == "1")
                {
                    res = tempResult["province"] + " " + tempResult["city"];
                }
                else
                {
                    res = "";
                }
            }
            catch
            {
                res = "";
            }

            #endregion
            if (!string.IsNullOrEmpty(res))
            {
                return res;
            }
            #region 聚合数据的接口，免费版，500次/天,暂时不用

            //try
            //{
            //    string url = "http://apis.juhe.cn/ip/ip2addr?ip=" + ip + "&dtype=json&key=b39857e36bee7a305d55cdb113a9d725";
            //    //{"resultcode":"200","reason":"Return Successd!",
            //    //"result":{"area":"江苏省苏州市","location":"电信"}}
            //    res = RequestHelp.HttpGet(url);
            //    JObject tempResult = (JObject)res.ToObject();
            //    if (tempResult["resultcode"].ToString() == "200")
            //    {
            //        res = tempResult["result"]["area"].ToString();
            //    }
            //    else
            //    {
            //        res = "";
            //    }
            //}
            //catch
            //{
            //    res = "";
            //}

            #endregion
            if (!string.IsNullOrEmpty(res))
            {
                return res;
            }
            #region 百度爬虫方式获取

            try
            {
                string url = "https://sp0.baidu.com/8aQDcjqpAAV3otqbppnN2DJv/api.php?query=" + ip + "&resource_id=6006&ie=utf8&oe=gbk&format=json";
                //{"status":"0","t":"","set_cache_time":"","data":[{"location":"广东省广州市 教育网", 
                //"titlecont":"IP地址查询", "origip":"218.192.3.42", "origipquery":"218.192.3.42", 
                //"showlamp":"1", "showLikeShare":1, "shareImage":1, "ExtendedLocation":"", "OriginQuery":"218.192.3.42", 
                //"tplt":"ip", "resourceid":"6006", "fetchkey":"218.192.3.42", "appinfo":"", "role_id":0, "disp_type":0}]}
                res = RequestHelper.HttpGet(url, Encoding.GetEncoding("GBK"));

                JObject tempResult = (JObject)res.ToObject();
                if (tempResult["status"].ToString() == "0")
                {
                    res = tempResult["data"]["location"].ToString();
                }
                else
                {
                    res = "";
                }
            }
            catch
            {
                res = "";
            }

            #endregion

            return res;
        }

        /// <summary>
        /// 获取浏览器信息Browser
        /// </summary>
        public static string Browser
        {
            get
            {
                if (HttpContext.Current == null)
                    return string.Empty;
                var browser = HttpContext.Current.Request.Browser;
                return string.Format("{0} {1}", browser.Browser, browser.Version);
            }
        }

        #region 判断IP地址是否在范围内

        /// <summary>
        /// ip是否在ip空间内
        /// </summary>
        /// <param name="ip"></param>
        /// <param name="beginIp">开始IP地址</param>
        /// <param name="endIp">结束IP地址</param>
        /// <returns></returns>
        public static Boolean IpExistsInRange(String ip, String beginIp, string endIp)
        {
            ip = ip.Trim();
            beginIp = beginIp.Trim();
            endIp = endIp.Trim();

            //验证IP地址是否合法
            try
            {
                IPAddress.Parse(ip);
                IPAddress.Parse(beginIp);
                IPAddress.Parse(endIp);
            }
            catch (Exception)
            {
                throw new ApplicationException("IP地址无效");
            }

            return GetIp2Long(beginIp) <= GetIp2Long(ip) && GetIp2Long(ip) <= GetIp2Long(endIp);
        }

        /// <summary>
        /// IP地址转化为long型数据
        /// </summary>
        /// <param name="ip"></param>
        /// <returns></returns>
        public static long GetIp2Long(String ip)
        {
            ip = ip.Trim();
            String[] ips = ip.Split('.');
            long ip2Long = 0L;
            for (int i = 0; i < 4; ++i)
            {
                ip2Long = ip2Long << 8 | Int64.Parse(ips[i]);
            }
            return ip2Long;
        }

        #endregion

        #region 网络连接检测

        /// <summary>
        /// 用于检测到指定Ip的网络是否联通
        /// </summary>
        /// <param name="ip">判断的Ip</param>
        /// <returns></returns>
        public static bool IsConn(string ip)
        {
            var ping = new Ping();
            try
            {
                var res = ping.Send(ip);
                return res != null && res.Status == IPStatus.Success;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// 检测网络连接状态,0-无连接,1-连接多次无响应,2-网络正常
        /// </summary>
        /// <param name="ip">网络检测IP地址</param>
        public static int ConnState(string ip)
        {
            int state = 0;
            if (!SystemHelper.LocalConnectionStatus())
            {
                state = 0;
            }
            else if (!SystemHelper.Ping(ip))
            {
                state = 1;
            }
            else
            {
                state = 3;
            }
            return state;
        }

        #endregion

    }
}
