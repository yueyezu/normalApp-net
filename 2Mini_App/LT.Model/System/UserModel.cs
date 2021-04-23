using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class UserModel : BaseEntity<UserModel>, ICreateAuth, IModifyAuth, IDeleteAuth
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public override string F_Id { get; set; }

        /// <summary>
        /// 用户帐号
        /// </summary>
        [DisplayName("用户帐号")]
        public string F_Account { get; set; }

        /// <summary>
        /// 姓名
        /// </summary>
        [DisplayName("姓名")]
        public string F_RealName { get; set; }

        /// <summary>
        /// 呢称
        /// </summary>
        [DisplayName("呢称")]
        public string F_NickName { get; set; }

        /// <summary>
        /// 头像
        /// </summary>
        [DisplayName("头像")]
        public string F_HeadIcon { get; set; }

        /// <summary>
        /// 性别
        /// </summary>
        [DisplayName("性别")]
        public string F_Sex { get; set; }

        /// <summary>
        /// 微信
        /// </summary>
        [DisplayName("微信")]
        public string F_WeChat { get; set; }

        /// <summary>
        /// 电话
        /// </summary>
        [DisplayName("电话")]
        public string F_Phone { get; set; }

        /// <summary>
        /// 用户邮件
        /// </summary>
        [DisplayName("用户邮件")]
        public string F_Email { get; set; }

        /// <summary>
        /// 生日
        /// </summary>
        [DisplayName("生日")]
        public DateTime? F_Birthday { get; set; }

        /// <summary>
        /// 组织主键
        /// </summary>
        [DisplayName("组织主键")]
        public string F_OrganizeId { get; set; }

        /// <summary>
        /// 部门主键
        /// </summary>
        [DisplayName("部门主键")]
        public string F_DepartmentId { get; set; }

        /// <summary>
        /// 岗位主键
        /// </summary>
        [DisplayName("岗位主键")]
        public string F_RoleId { get; set; }

        /// <summary>
        /// 是否管理员
        /// </summary>
        [DisplayName("是否管理员")]
        public int? F_IsAdmin { get; set; }

        /// <summary>
        /// 允许删除
        /// </summary>
        [DisplayName("允许删除")]
        public int? F_EnableDelete { get; set; }

        /// <summary>
        /// 删除标志
        /// </summary>
        [DisplayName("删除标志")]
        public int? F_DeleteFlag { get; set; }

        /// <summary>
        /// 有效标志
        /// </summary>
        [DisplayName("有效标志")]
        public int? F_EnabledFlag { get; set; }

        /// <summary>
        /// 排序码
        /// </summary>
        [DisplayName("排序码")]
        public int? F_SortNum { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [DisplayName("备注")]
        public string F_Remark { get; set; }

        /// <summary>
        /// 创建人
        /// </summary>
        [DisplayName("创建人")]
        public string F_CreateUserId { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DisplayName("创建时间")]
        public DateTime? F_CreateTime { get; set; }

        /// <summary>
        /// 修改人
        /// </summary>
        [DisplayName("修改人")]
        public string F_LastModifyUserId { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        [DisplayName("修改时间")]
        public DateTime? F_LastModifyTime { get; set; }

        /// <summary>
        /// 删除人
        /// </summary>
        [DisplayName("删除人")]
        public string F_DeleteUserId { get; set; }

        /// <summary>
        /// 删除时间
        /// </summary>
        [DisplayName("删除时间")]
        public DateTime? F_DeleteTime { get; set; }
    }
}
