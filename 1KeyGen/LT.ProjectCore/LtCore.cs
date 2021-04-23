/**
* Title: 一些需要处理的公共的方法，也可以是些工具类的方法
* Author: yueye
* Date: 2018/5/3 22:35:10
* Desp:
*/

using System;
using LT.Code;

namespace LT.ProjectCore
{
    public class LtCore
    {
        /// <summary>
        /// 当前对象
        /// </summary>
        public static LtCore Core
        {
            get { return new LtCore(); }
        }

        /// <summary>
        /// 初始化程序
        /// 获取所有的配置数据
        /// </summary>
        /// <param name="errorMsg">初始化操作中出现的错误信息</param>
        /// <returns></returns>
        public bool Init(out string errorMsg)
        {
            bool result = false;

            try
            {
                //获取所有配置信息
                Configs.LoadAllConfigs();  //加载所有的配置信息
                result = true;
                errorMsg = "";
            }
            catch (Exception ex)
            {
                LogHelper.Error("初始化系统信息错误。", ex);
                errorMsg = string.Format("系统启动失败,原因：" + ex.Message);
                result = false;
            }
            return result;
        }
    }
}
