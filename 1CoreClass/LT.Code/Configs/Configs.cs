/**
* Title: 配置文件操作
* Author: yueye
* Date: 2017/12/12 16:22:09
* Desp: 对于系统的配置文件数据进行操作。
*/

using System.Collections.Generic;
using System.Configuration;

namespace LT.Code
{
    /// <summary>
    /// 加载其他类型的配置项的委托类型定义
    /// </summary>
    /// <param name="settings"></param>
    public delegate void DelegateLoadConfigs(IDictionary<string, string> settings);

    public class Configs
    {
        public static DelegateLoadConfigs LoadOtherConfig = null;

        #region AppSetting配置的管理

        #region 内存中配置管理

        /// <summary>
        /// 获取所有配置的缓存变量。
        /// </summary>
        private static IDictionary<string, string> appSettings = new Dictionary<string, string>();

        /// <summary>
        /// 获取当前配置的值
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static string GetSetting(string key)
        {
            lock (appSettings)
            {
                if (appSettings.ContainsKey(key))
                {
                    return appSettings[key];
                }
            }
            return "";
        }

        /// <summary>
        /// 加载所有的appSetting下的配置项内容
        /// </summary>
        public static void LoadAllConfigs()
        {
            lock (appSettings)
            {
                appSettings.Clear();
                string[] allkey = ConfigurationManager.AppSettings.AllKeys;
                foreach (string key in allkey)
                {
                    appSettings.Add(key, ConfigurationManager.AppSettings.Get(key));
                }

                if (GetSettingByKey("GetDbConfig") == "true")
                {
                    //提供一个加载其他配置项的委托
                    if (LoadOtherConfig != null)
                    {
                        LoadOtherConfig(appSettings);
                    }
                }
            }
        }

        #endregion

        /// <summary>
        /// 根据Key取Value值，直接在配置中获取
        /// </summary>
        /// <param name="key"></param>
        public static string GetSettingByKey(string key)
        {
            string settingValue = ConfigurationManager.AppSettings[key];
            if (string.IsNullOrEmpty(settingValue))
            {
                return "";
            }
            return settingValue.Trim();
        }

        /// <summary>
        /// 根据Key修改Value
        /// </summary>
        /// <param name="key">要修改的Key</param>
        /// <param name="value">要修改为的值</param>
        public static void SetSettingValue(string key, string value)
        {
            Configuration cfg = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            cfg.AppSettings.Settings[key].Value = value;
            cfg.Save();

            //System.Xml.XmlDocument xDoc = new System.Xml.XmlDocument();
            //xDoc.Load(HttpContext.Current.Server.MapPath("~/Configs/system.config"));
            //System.Xml.XmlNode xNode;
            //System.Xml.XmlElement xElem1;
            //System.Xml.XmlElement xElem2;
            //xNode = xDoc.SelectSingleNode("//appSettings");

            //xElem1 = (System.Xml.XmlElement)xNode.SelectSingleNode("//add[@key='" + key + "']");
            //if (xElem1 != null) xElem1.SetAttribute("value", value);
            //else
            //{
            //    xElem2 = xDoc.CreateElement("add");
            //    xElem2.SetAttribute("key", key);
            //    xElem2.SetAttribute("value", value);
            //    xNode.AppendChild(xElem2);
            //}
            //xDoc.Save(HttpContext.Current.Server.MapPath("~/Configs/system.config"));
        }

        #endregion

    }
}
