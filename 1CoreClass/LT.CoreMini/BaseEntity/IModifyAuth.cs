/**
* Title: 修改的权限
* Author: yueye
* Date: 2017-12-13
* Desp: 所有的实体类具有修改权限的都可以继承改类，用于确定该实体修改必须的字段。
*/
using System;

namespace LT.Core
{
    public interface IModifyAuth
    {
        /// <summary>
        /// 实体ID
        /// </summary>
        string F_Id { get; set; }
        /// <summary>
        /// 修改用户的ID
        /// </summary>
        string F_LastModifyUserId { get; set; }
        /// <summary>
        /// 修改的时间
        /// </summary>
        DateTime? F_LastModifyTime { get; set; }
    }
}