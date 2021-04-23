using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class UserRoleModel 
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
        /// 角色编号
        /// </summary>
        [DisplayName("角色编号")]
        public string F_RoleId { get; set; }

    }
}
