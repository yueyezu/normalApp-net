/**
* Title: 系统配置管理操作
* Author: zhangzhao
* Date: 2018/03/25
* Desp:
*/

using LT.Core;
using LT.DAL.System;
using LT.Model.System;
using System.Collections.Generic;

namespace LT.BLL.System
{
    public class ConfigsBll : BaseBll
    {
        private ConfigsDal configsDal = new ConfigsDal();

        /// <summary>
        /// 获取配置列表信息
        /// </summary>
        /// <returns></returns>
        public List<ConfigsModel> FindList()
        {
            return configsDal.FindList();
        }

        /// <summary>
        /// 修改系统配置
        /// </summary>
        /// <param name="changeObjs">修改的内容</param>
        /// <returns></returns>
        public bool SubmitForm(List<ConfigsModel> changeObjs)
        {
            foreach (ConfigsModel item in changeObjs)
            {
                item.Modify(item.F_Id);
            }
            return configsDal.SubmitForm(changeObjs);
        }


        /// <summary>
        /// 加载数据库中的配置信息,到Config类
        /// </summary>
        /// <param name="settings">系统已有的配置项，这里作为委托类进行开发</param>
        public static void LoadDbConfig(IDictionary<string, string> settings)
        {
            List<ConfigsModel> dbConfigs = new ConfigsDal().FindList();

            foreach (ConfigsModel dbConfig in dbConfigs)
            {
                //如果在文件与数据库中都配置相同的编码的项，则以数据库中配置的为准
                if (settings.ContainsKey(dbConfig.F_Key))
                {
                    settings[dbConfig.F_Key] = dbConfig.F_Value;
                }
                else
                {
                    settings.Add(dbConfig.F_Key, dbConfig.F_Name);
                }
            }
        }
    }
}
