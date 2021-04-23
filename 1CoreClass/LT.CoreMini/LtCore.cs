/**
* Title: 核心程序用到的类，统一放到该类中即可。
* Author: yueye
* Date: 2018/1/11 21:02:00
* Desp: 对于一些公共类进行存放的类，具体用到在进行补充，暂先预留
*/

using System;
using LT.Code;

namespace LT.Core
{
    public class LtCore
    {
        private Log logger = LogFactory.GetLogger(typeof(LtCore));
        /// <summary>
        /// 系统初始化的状态,如果初始化成功则为true
        /// </summary>
        public static bool initState = true;

        /// <summary>
        /// 当前对象
        /// </summary>
        public static LtCore Core
        {
            get { return new LtCore(); }
        }

        #region 用户密码的操作

        /// <summary>
        /// 获取用户密码加密的密钥
        /// </summary>
        /// <returns></returns>
        public string GetSecretkey()
        {
            return MD5Encrypt.GetMD5_16(Utility.CreateNo());
        }

        /// <summary>
        /// 获取用户的数据库存储的密码,密文
        /// 这里如果用户的密码不录入，则认为是默认密码
        /// </summary>
        /// <param name="secretKey">加密的密钥</param>
        /// <param name="password">密码明文</param>
        /// <returns>加密后的密码密文</returns>
        public string GetDbPassword(string secretKey, string password = null)
        {
            if (password == null)
            {
                password = Configs.GetSetting("defaultPassword");
                password = MD5Encrypt.GetMD5_32(password);
            }
            string dbPassword =
                MD5Encrypt.GetMD5_32(DESEncrypt.Encrypt(password.ToLower(), secretKey).ToLower()).ToLower();
            return dbPassword;
        }

        #endregion

        /// <summary>
        /// 系统启动时，初始化的一些操作
        /// </summary>
        /// <param name="loadConfig">加载系统配置的委托类</param>
        /// <returns></returns>
        public bool SysInit(DelegateLoadConfigs loadConfig = null)
        {
            try
            {
                Configs.LoadOtherConfig = loadConfig; //绑定加载数据库的配置信息的委托方法
                //加载所有的配置文件加载到内存，以便于后续程序使用
                Configs.LoadAllConfigs();

                //初始化licence的信息到系统
                string licencePath = FileHelper.GetFullPath("Config\\Licence.lic");
                Licence.Target.GetLicenceModel(licencePath);
            }
            catch (Exception ex)
            {
                logger.Error("系统初始化异常。", ex);
                logger.Info("系统初始化失败");
                initState = false;
                return false;
            }

            return true;
        }
    }
}
