/**
* Title:日志记录的接口，如果是记录日志的类，则必须要集成该接口
* Author: yueye
* Date: 2018/3/16 14:35:32
* Desp:继承该类且实现其方法后，系统执行的业务日志会自动调用并写入。
*/

using System.Collections.Generic;

namespace LT.Core
{
    /// <summary>
    /// 添加系统日志功能开放接口
    /// </summary>
    public interface ISysLog
    {
        /// <summary>
        /// 日志保存的方式,包括：db，file；默认为db.
        /// </summary>
        string LogSaveType { get; }

        /// <summary>
        /// 添加日志的接口，集成该类必须要重写该方法
        /// </summary>
        /// <param name="sysLogModel">要记录的日志信息</param>
        /// <returns></returns>
        bool AddSysLog(BaseSysLogModel sysLogModel);

        /// <summary>
        /// 批量添加日志的方法
        /// </summary>
        /// <param name="sysLogList">批量添加日志的方法</param>
        /// <returns></returns>
        bool AddSysLog(List<BaseSysLogModel> sysLogList);
    }
}
