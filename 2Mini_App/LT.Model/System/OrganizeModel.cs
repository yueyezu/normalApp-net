using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class OrganizeModel : BaseTreeEntity<OrganizeModel>, ICreateAuth, IModifyAuth, IDeleteAuth
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public override string F_Id { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        [DisplayName("名称")]
        public override string F_Name { get; set; }

        /// <summary>
        /// 父级
        /// </summary>
        [DisplayName("父级")]
        public override string F_ParentId { get; set; }

        /// <summary>
        /// 层次：#编码#|#编码#
        /// </summary>
        [DisplayName("层次：#编码#|#编码#")]
        public override string F_Layers { get; set; }

        /// <summary>
        /// 分类： 1、机构，2、部门
        /// </summary>
        [DisplayName("分类： 1、机构，2、部门")]
        public int? F_Type { get; set; }

        /// <summary>
        /// 编号
        /// </summary>
        [DisplayName("编号")]
        public string F_Code { get; set; }

     
        /// <summary>
        /// 简称
        /// </summary>
        [DisplayName("简称")]
        public string F_ShortName { get; set; }

        /// <summary>
        /// 负责人
        /// </summary>
        [DisplayName("负责人")]
        public string F_ManagerId { get; set; }

        /// <summary>
        /// 电话
        /// </summary>
        [DisplayName("电话")]
        public string F_Phone { get; set; }

        /// <summary>
        /// 联系地址
        /// </summary>
        [DisplayName("联系地址")]
        public string F_Address { get; set; }

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
        /// 删除标志
        /// </summary>
        [DisplayName("删除标志")]
        public int? F_DeleteFlag { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [DisplayName("描述")]
        public string F_Description { get; set; }

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

        /// <summary>
        /// 预留字段1
        /// </summary>
        [DisplayName("预留字段1")]
        public int? F_Field1 { get; set; }

        /// <summary>
        /// 预留字段2
        /// </summary>
        [DisplayName("预留字段2")]
        public string F_Field2 { get; set; }

        /// <summary>
        /// 预留字段3
        /// </summary>
        [DisplayName("预留字段3")]
        public string F_Field3 { get; set; }

        /// <summary>
        /// 预留字段4
        /// </summary>
        [DisplayName("预留字段4")]
        public DateTime? F_Field4 { get; set; }

    }
}
