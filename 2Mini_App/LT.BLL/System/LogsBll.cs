/**
* Title: 日志的处理方法
* Author: zhangzhao
* Date: 2018/3/20
* Desp:
*/

using LT.Core;
using LT.DAL.System;
using LT.Model.System;
using System.Collections.Generic;

namespace LT.BLL.System
{
    public class LogsBll : BaseBll, ISysLog
    {
        private LogsDal logsDal = new LogsDal();

        #region ISysLog方法的实现，主要在于日志的输入

        public string LogSaveType
        {
            get { return "db"; }
        }

        /// <summary>
        /// 将日志写入到数据库的方法
        /// </summary>
        /// <param name="sysLogModel">系统传过来的日志信息</param>
        /// <returns></returns>
        public bool AddSysLog(BaseSysLogModel sysLogModel)
        {
            LogsModel model = sysLogModel.Copy<LogsModel>();

            var loginInfo = OperatorProvider.Provider.GetCurrent();
            if (loginInfo != null)
            {
                model.F_IPAddress = loginInfo.LoginIpAddress;
                model.F_IPCity = loginInfo.LoginIpAddressName;
            }

            return logsDal.AddForm(model);
        }

        /// <summary>
        /// 批量日志写入到数据库的方法
        /// </summary>
        /// <param name="sysLogList">系统传过来的日志列表</param>
        /// <returns></returns>
        public bool AddSysLog(List<BaseSysLogModel> sysLogList)
        {
            List<LogsModel> modelList = new List<LogsModel>();
            var loginInfo = OperatorProvider.Provider.GetCurrent();

            foreach (BaseSysLogModel sysLogModel in sysLogList)
            {
                LogsModel model = sysLogModel.Copy<LogsModel>();
                if (loginInfo != null)
                {
                    model.F_IPAddress = loginInfo.LoginIpAddress;
                    model.F_IPCity = loginInfo.LoginIpAddressName;
                }

                modelList.Add(model);
            }

            return logsDal.AddFormList(modelList);
        }

        #endregion

        /// <summary>
        /// 获取日志列表信息
        /// </summary>
        /// <param name="queryParam">查询条件</param>
        /// <param name="pagination">分页信息</param>
        /// <returns></returns>
        public List<LogsModel> FindPageList(Dictionary<string, string> queryParam, Pagination pagination)
        {
            return logsDal.FindPageList(queryParam, pagination);
        }

        /// <summary>
        /// 根据Id数组集合删除数据表中的数据
        /// </summary>
        /// <param name="fIds"></param>
        /// <returns></returns>
        public bool DeleteForms(string fIds)
        {
            return logsDal.DeleteForms(fIds);
        }

        /// <summary>
        /// 清空日志表中所有数据
        /// </summary>
        /// <returns></returns>
        public bool ClearLogs()
        {
            return logsDal.ClearLogs();
        }

        /// <summary>
        /// 获取日志表单信息
        /// </summary>
        /// <param name="fIds">日志id</param>
        /// <returns></returns>
        public LogsModel FindForm(string fIds)
        {
            return logsDal.FindForm(fIds);
        }
    }
}
