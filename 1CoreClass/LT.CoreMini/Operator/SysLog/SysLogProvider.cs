/**
* Title: 系统日志操作功能的提供类，负责日志输出的转接。
* Author: yueye
* Date: 2018/3/28 10:00:22
* Desp: 根据系统实现情况以及系统的配置进行调度，并写入日志。
 * 该类中对于ISysLog接口的所有继承类都进行了调用，需要输出日志，只需要在输出地方重写ISysLog接口即可。
 * 在要输出日志的地方可以直接调用该类进行日志的输出。
*/

using System;
using System.Collections.Generic;
using System.Linq;
using LT.Code;

namespace LT.Core
{
    public class SysLogProvider
    {
        /// <summary>
        /// 日志输出的类
        /// </summary>
        private Log MyLog
        {
            get { return LogFactory.GetLogger(this.GetType().ToString()); }
        }

        #region 单例模式

        /// <summary>
        /// 私有的构造函数
        /// </summary>
        private SysLogProvider()
        {
            InitAllSysLog();
        }
        /// <summary>
        /// 私有的实体类，即该实例的单例
        /// </summary>
        private static SysLogProvider _instance = null;
        /// <summary>
        /// 线程锁变量，必须为static类型的
        /// </summary>
        private static readonly object LockHelper = new object();
        /// <summary>
        /// 对外开放的获取单例的方法,双重验证锁，以防止高并发
        /// </summary>
        /// <returns></returns>
        public static SysLogProvider GetInstance()
        {
            if (null == _instance)
            {
                lock (LockHelper)
                {
                    if (null == _instance)
                    {
                        _instance = new SysLogProvider();
                    }
                }
            }
            return _instance;
        }

        #endregion

        /// <summary>
        /// 存放所有的集成日志输出类的类，用于日志输出日志使用。
        /// key：存储的方式， value： 该存储方式的处理类的实现类
        /// </summary>
        private Dictionary<string, List<ISysLog>> allSysLog = new Dictionary<string, List<ISysLog>>();

        /// <summary>
        /// 初始化当前系统中所有日志输出的类
        /// </summary>
        private void InitAllSysLog()
        {
            //获取所有的实现ISysLog接口的类
            List<Type> allClass = Utility.GetAllSubClass(typeof(ISysLog)).ToList();

            //设置一个缓存变量，以减少修改时线程堵塞的时间
            Dictionary<string, List<ISysLog>> tempAllSysLog = new Dictionary<string, List<ISysLog>>();
            foreach (Type type in allClass)
            {
                ISysLog tempSyslog = (ISysLog)Utility.GetInstanceByType(type);
                string logType = tempSyslog.LogSaveType;
                if (string.IsNullOrEmpty(logType))
                {
                    logType = "db";
                }

                if (tempAllSysLog.ContainsKey(logType))
                {
                    tempAllSysLog[logType].Add(tempSyslog);
                }
                else
                {
                    List<ISysLog> tempLogs = new List<ISysLog>();
                    tempLogs.Add(tempSyslog);
                    tempAllSysLog.Add(logType, tempLogs);
                }
            }

            lock (allSysLog)   //防止进行修改时有在使用的地方
            {
                //在加入之前，先清空所有存放的信息，这里主要是考虑到后续可能用到更新的操作
                allSysLog.Clear();
                allSysLog = tempAllSysLog;
            }
        }

        /// <summary>
        /// 日志输出的方法
        /// </summary>
        /// <returns></returns>
        public void WirteSysLog(BaseSysLogModel sysLogModel)
        {
            //1、完善日志要输出的实例,主要是id,用户，时间信息，只有当前系统的日志才会进行处理。
            if (sysLogModel.F_System.Equals(Configs.GetSetting("systemFlag")))
            {
                sysLogModel.Create();
            }

            //2、获取配置的输出方式
            string logTypeConfig = Configs.GetSetting("logSaveType");
            string[] logTypeArray = logTypeConfig.Split(',');

            //3、根据不同类型进行输出操作
            string logOutputMsg = "";
            foreach (string logTypeStr in logTypeArray)
            {
                lock (allSysLog)
                {
                    if (allSysLog.ContainsKey(logTypeStr))
                    {
                        List<ISysLog> sysLogList = allSysLog[logTypeStr];
                        foreach (ISysLog sysLog in sysLogList)
                        {
                            if (!sysLog.AddSysLog(sysLogModel))
                            {
                                //如果输出失败了，则记录输出错误的类，然后最终输出到错误日志。
                                logOutputMsg += sysLog.GetType().FullName + ",";
                            }
                        }
                    }
                }
            }

            //4、记录输出错误的日志
            if (!string.IsNullOrEmpty(logOutputMsg))
            {
                MyLog.Error("日志输出出现错误，方法为：" + logOutputMsg + "；日志内容为：" + sysLogModel.ToString());
            }
        }

        /// <summary>
        /// 日志输出的方法
        /// </summary>
        /// <param name="sysLogModelList">要输出的日志的列表</param>
        /// <param name="systemFlag">输出日志的系统的标识，限定该输出的所有日志都是来自同一个系统。</param>
        /// <returns></returns>
        public void WirteSysLog(List<BaseSysLogModel> sysLogModelList, string systemFlag)
        {
            //1、完善日志要输出的实例,主要是id,用户，时间信息，只有当前系统的日志才会进行处理。
            if (systemFlag.Equals(Configs.GetSetting("systemFlag")))
            {
                foreach (var sysLogModel in sysLogModelList)
                {
                    sysLogModel.Create();
                }
            }

            //2、获取配置的输出方式
            string logTypeConfig = Configs.GetSetting("logSaveType");
            string[] logTypeArray = logTypeConfig.Split(',');

            //3、根据不同类型进行输出操作
            string logOutputMsg = "";
            foreach (string logTypeStr in logTypeArray)
            {
                lock (allSysLog)
                {
                    if (allSysLog.ContainsKey(logTypeStr))
                    {
                        List<ISysLog> sysLogList = allSysLog[logTypeStr];
                        foreach (ISysLog sysLog in sysLogList)
                        {
                            if (!sysLog.AddSysLog(sysLogModelList))
                            {
                                //如果输出失败了，则记录输出错误的类，然后最终输出到错误日志。
                                logOutputMsg += sysLog.GetType().FullName + ",";
                            }
                        }
                    }
                }
            }

            //4、记录输出错误的日志
            if (!string.IsNullOrEmpty(logOutputMsg))
            {
                string listLogMsg = "";
                foreach (var sysLogModel in sysLogModelList)
                {
                    listLogMsg += sysLogModel.ToString() + "&|&";
                }

                MyLog.Error("批量日志输出出现错误，方法为：" + logOutputMsg + "；日志列表内容为：" + listLogMsg);
            }
        }
    }
}
