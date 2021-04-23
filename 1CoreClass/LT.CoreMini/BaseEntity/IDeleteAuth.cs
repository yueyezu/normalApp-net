/**
* Title: 删除的权限。（逻辑删除，如果物理删除，直接删除即可，不需要定义这些字段）
* Author: yueye
* Date: 2017-12-13
* Desp: 所有的实体类具有逻辑删除权限的都可以继承改类，用于确定该实体删除必须的字段。
*/
using System;

namespace LT.Core
{
    public interface IDeleteAuth
    {
        /// <summary>
        /// 实体ID
        /// </summary>
        string F_Id { get; set; }
        /// <summary>
        /// 删除标记,1标示已经删除，0标示未删除
        /// </summary>
        int? F_DeleteFlag { get; set; }
        /// <summary>
        /// 删除的用户ID
        /// </summary>
        string F_DeleteUserId { get; set; }
        /// <summary>
        /// 删除的时间
        /// </summary>
        DateTime? F_DeleteTime { get; set; }
    }
}