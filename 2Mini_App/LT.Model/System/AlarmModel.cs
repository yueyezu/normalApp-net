
using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class AlarmModel 
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public string F_Id { get; set; }

        /// <summary>
        /// 报警源类型
        /// </summary>
        [DisplayName("报警源类型")]
        public string F_SourceType { get; set; }

        /// <summary>
        /// 报警源编号
        /// </summary>
        [DisplayName("报警源编号")]
        public string F_SourceNo { get; set; }

        /// <summary>
        /// 报警类型
        /// </summary>
        [DisplayName("报警类型")]
        public int? F_AlarmType { get; set; }

        /// <summary>
        /// 报警原因
        /// </summary>
        [DisplayName("报警原因")]
        public string F_Reason { get; set; }

        /// <summary>
        /// 报警时间
        /// </summary>
        [DisplayName("报警时间")]
        public DateTime? F_Time { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [DisplayName("备注")]
        public string F_Remark { get; set; }
    }
}
