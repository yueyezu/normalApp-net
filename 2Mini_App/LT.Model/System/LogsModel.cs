using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class LogsModel : BaseSysLogModel
    {
        /// <summary>
        /// IP地址
        /// </summary>
        [DisplayName("IP地址")]
        public string F_IPAddress { get; set; }

        /// <summary>
        /// IP城市
        /// </summary>
        [DisplayName("IP城市")]
        public string F_IPCity { get; set; }
    }
}
