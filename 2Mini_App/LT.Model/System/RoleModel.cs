using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class RoleModel : BaseEntity<RoleModel>, ICreateAuth, IModifyAuth, IDeleteAuth
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public override string F_Id { get; set; }

        /// <summary>
        /// 编号
        /// </summary>
        [DisplayName("编号")]
        public string F_Code { get; set; }

        /// <summary>
        /// 名称
        /// </summary>
        [DisplayName("名称")]
        public string F_Name { get; set; }

        /// <summary>
        /// 分类：1、角色，2、岗位
        /// </summary>
        [DisplayName("分类：1、角色，2、岗位")]
        public int? F_Type { get; set; }

        /// <summary>
        /// 允许删除
        /// </summary>
        [DisplayName("允许删除")]
        public int? F_EnableDelete { get; set; }

        /// <summary>
        /// 排序码
        /// </summary>
        [DisplayName("排序码")]
        public int? F_SortNum { get; set; }

        /// <summary>
        /// 有效标志
        /// </summary>
        [DisplayName("有效标志")]
        public int? F_EnabledFlag { get; set; }

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
        /// 删除标志
        /// </summary>
        [DisplayName("删除标志")]
        public int? F_DeleteFlag { get; set; }

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
