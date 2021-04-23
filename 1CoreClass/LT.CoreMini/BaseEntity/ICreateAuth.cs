/**
* Title: 创建的权限。
* Author: yueye
* Date: 2017-12-13
* Desp: 所有的实体类具有新建权限的都可以继承改类，用于确定该实体创建必须的字段。
*/
using System;

namespace LT.Core
{
    public interface ICreateAuth
    {
        /// <summary>
        /// 实体ID
        /// </summary>
        string F_Id { get; set; }
        /// <summary>
        /// 实体创建的用户ID
        /// </summary>
        string F_CreateUserId { get; set; }
        /// <summary>
        /// 实体创建的时间
        /// </summary>
        DateTime? F_CreateTime { get; set; }
    }
}