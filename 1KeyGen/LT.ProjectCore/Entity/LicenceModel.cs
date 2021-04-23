/**
* Title: 授权认证的数据类型
* Author: yueye
* Date: 2018/1/15 16:57:22
* Desp:
*/

using System;

namespace LT.ProjectCore
{
    public enum LicenseTypeEnum
    {
        Ip, Mac, IpMac
    }

    public class LicenceModel
    {
        /// <summary>
        /// 授权类型:Ip,Mac,Ipmac
        /// </summary>
        public LicenseTypeEnum LicenceType { get; set; }

        /// <summary>
        /// Ip地址
        /// </summary>
        public string Ip { get; set; }

        /// <summary>
        /// Mac地址
        /// </summary>
        public string Mac { get; set; }

        /// <summary>
        /// 机器码
        /// </summary>
        public string MCode { get; set; }

        /// <summary>
        /// 到期时间
        /// </summary>
        public DateTime Date { get; set; }

        /// <summary>
        /// 不限制时间
        /// </summary>
        public bool AllData { get; set; }

        /// <summary>
        /// 用户数量
        /// </summary>
        public int UserNum { get; set; }

        /// <summary>
        /// 不限制用户数
        /// </summary>
        public bool AllUser { get; set; }

        /// <summary>
        /// 加密的公钥，需要写入到Lisence
        /// </summary>
        public string PublicKey { get; set; }

        /// <summary>
        /// 加密的私钥，保留本地
        /// </summary>
        public string PrivateKey { get; set; }

        /// <summary>
        /// 授权认证的内容
        /// </summary>
        public string Licence { get; set; }
    }
}
