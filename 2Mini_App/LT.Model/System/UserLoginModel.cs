using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class UserLoginModel
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public string F_Id { get; set; }

        /// <summary>
        /// 用户主键
        /// </summary>
        [DisplayName("用户主键")]
        public string F_UserId { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        [DisplayName("密码")]
        public string F_Password { get; set; }

        /// <summary>
        /// 密钥
        /// </summary>
        [DisplayName("密钥")]
        public string F_Secretkey { get; set; }

        /// <summary>
        /// 最后登录时间
        /// </summary>
        [DisplayName("最后登录时间")]
        public DateTime? F_LastVisitTime { get; set; }

        /// <summary>
        /// 最后密码修改时间
        /// </summary>
        [DisplayName("最后密码修改时间")]
        public DateTime? F_ChangePassTime { get; set; }

        /// <summary>
        /// 允许多端登录
        /// </summary>
        [DisplayName("允许多端登录")]
        public int? F_MultiUserLogin { get; set; }

        /// <summary>
        /// 登录次数
        /// </summary>
        [DisplayName("登录次数")]
        public int? F_LogOnCount { get; set; }

        /// <summary>
        /// 在线状态
        /// </summary>
        [DisplayName("在线状态")]
        public int? F_LoginStatus { get; set; }

        /// <summary>
        /// 密保问题
        /// </summary>
        [DisplayName("密保问题")]
        public string F_Question { get; set; }

        /// <summary>
        /// 问题答案
        /// </summary>
        [DisplayName("问题答案")]
        public string F_Answer { get; set; }

        /// <summary>
        /// 是否限制访问
        /// </summary>
        [DisplayName("是否限制访问")]
        public int? F_EnableLogin { get; set; }

    }
}
