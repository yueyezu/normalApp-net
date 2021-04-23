using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class DbBackupModel : BaseEntity<DbBackupModel>, ICreateAuth, IDeleteAuth
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public override string F_Id { get; set; }

        /// <summary>
        /// 数据库名称
        /// </summary>
        [DisplayName("数据库名称")]
        public string F_DbName { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [DisplayName("文件名称")]
        public string F_FileName { get; set; }

        /// <summary>
        /// 文件大小
        /// </summary>
        [DisplayName("文件大小")]
        public double? F_FileSize { get; set; }

        /// <summary>
        /// 文件路径
        /// </summary>
        [DisplayName("文件路径")]
        public string F_FilePath { get; set; }

        /// <summary>
        /// 备份时间
        /// </summary>
        [DisplayName("备份时间")]
        public DateTime? F_BackupTime { get; set; }

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
