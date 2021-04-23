using LT.Core;
using System;
using System.ComponentModel;

namespace LT.Model.System
{
    public class ConfigsModel : BaseEntity<ConfigsModel>, IModifyAuth
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public override string F_Id { get; set; }

        /// <summary>
        /// 配置组名称
        /// </summary>
        [DisplayName("配置组名称")]
        public string F_Group { get; set; }

        /// <summary>
        /// 配置的名称
        /// </summary>
        [DisplayName("配置的名称")]
        public string F_Name { get; set; }

        /// <summary>
        /// 配置的key值
        /// </summary>
        [DisplayName("配置的key值")]
        public string F_Key { get; set; }

        /// <summary>
        /// 配置Value
        /// </summary>
        [DisplayName("配置Value")]
        public string F_Value { get; set; }

        /// <summary>
        /// 配置Value类型
        /// </summary>
        [DisplayName("配置Value类型")]
        public string F_ValueType { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [DisplayName("描述")]
        public string F_Description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [DisplayName("备注")]
        public string F_Remark { get; set; }

        /// <summary>
        /// 排序码
        /// </summary>
        [DisplayName("排序码")]
        public int? F_SortNum { get; set; }

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
    }
}
