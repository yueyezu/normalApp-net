/**
* Title: 登录用户缓存信息。
* Author: yueye
* Date: 2017-12-13
* Desp: 登录用户缓存用户的登录信息，包括用户的基本信息以及登录信息等。
*/

using System;

namespace LT.Core
{
    public class OperatorModel
    {
        #region 登录用户的相关信息

        /// <summary>
        /// 用户ID
        /// </summary>
        public string UserId { get; set; }

        /// <summary>
        /// 用户帐号
        /// </summary>
        public string UserCode { get; set; }

        /// <summary>
        /// 用户名称
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 用户的头像信息。
        /// </summary>
        public string UserPhoto { get; set; } //用户头像信息保存到这里

        /// <summary>
        /// 当前用户的公司信息
        /// </summary>
        public string CompanyId { get; set; }

        /// <summary>
        /// 当前用户的部门信息
        /// </summary>
        public string DepartmentId { get; set; }

        /// <summary>
        /// 当前用户的角色ID,如果有多个角色采用逗号分隔开
        /// 目前为怎么用到，后边用到了再考虑赋值
        /// </summary>
        public string RoleId { get; set; }

        /// <summary>
        /// 是否是管理员权限，管理员权限用户对于部分权限不进行限制。
        /// </summary>
        public bool IsSystem { get; set; }

        #endregion

        /// <summary>
        /// 登录的Ip地址
        /// </summary>
        public string LoginIpAddress { get; set; }
        /// <summary>
        /// Ip地址所在城市
        /// </summary>
        public string LoginIpAddressName { get; set; }

        //TODO 后边可补充登录机器名称之类信息，如果可以获取到的话
        /// <summary>
        /// 登录标记,这里存储为用户登录表的Id
        /// </summary>
        public string LoginToken { get; set; }
        /// <summary>
        /// 登录时间
        /// </summary>
        public DateTime? LoginTime { get; set; }

        /// <summary>
        /// 是否为默认密码
        /// </summary>
        public bool IsDefaultPwd { get; set; }
    }
}
