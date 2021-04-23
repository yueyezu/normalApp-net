using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
    [Serializable]
    public class NewMsgModel : BaseEntity<NewMsgModel>, ICreateAuth
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public override string F_Id { get; set; }

        /// <summary>
        /// 消息类型
        /// </summary>
        [DisplayName("消息类型")]
        public string F_Type { get; set; }

        /// <summary>
        /// 消息标题
        /// </summary>
        [DisplayName("消息标题")]
        public string F_Title { get; set; }

        /// <summary>
        /// 消息描述
        /// </summary>
        [DisplayName("消息描述")]
        public string F_Content { get; set; }

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
        /// 是否已读：0、未读；1、已读
        /// </summary>
        [DisplayName("是否已读：0、未读；1、已读")]
        public int? F_IsRead { get; set; }

        /// <summary>
        /// 已读人员
        /// </summary>
        [DisplayName("已读人员")]
        public string F_ReadUserId { get; set; }

        /// <summary>
        /// 已读时间
        /// </summary>
        [DisplayName("已读时间")]
        public DateTime? F_ReadTime { get; set; }

    }
}
