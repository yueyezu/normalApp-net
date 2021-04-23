/**
* Title: 系统框架记录日志的实体类
* Author: yueye
* Date: 2018/3/28 9:14:54
* Desp: 后续需要实现日志记录的都需要集成该类，或者直接使用该类。
*/

using System;
using System.ComponentModel;
using System.Text;

namespace LT.Core
{
    /// <summary>
    /// 日志记录的枚举类型，看情况会不会用到再说
    /// </summary>
    public enum LogOptType { Add = 1, Edit = 2, Delete = 3, Other = 9 }

    /// <summary>
    /// 日志记录类的基类，这里主要是框架中使用
    /// </summary>
    [Serializable]
    public class BaseSysLogModel : BaseEntity<BaseSysLogModel>, ICreateAuth
    {
        /// <summary>
        /// 主键
        /// </summary>
        [DisplayName("主键")]
        public override string F_Id { get; set; }

        /// <summary>
        /// 系统
        /// </summary>
        [DisplayName("系统")]
        public string F_System { get; set; }

        /// <summary>
        /// 功能模块
        /// </summary>
        [DisplayName("功能模块")]
        public string F_Module { get; set; }

        /// <summary>
        /// 操作类型
        /// </summary>
        [DisplayName("操作类型")]
        public string F_OptType { get; set; }

        /// <summary>
        /// 操作说明
        /// </summary>
        [DisplayName("操作说明")]
        public string F_OptContent { get; set; }

        /// <summary>
        /// 用户主键
        /// </summary>
        [DisplayName("用户主键")]
        public string F_CreateUserId { get; set; }

        /// <summary>
        /// 时间
        /// </summary>
        [DisplayName("时间")]
        public DateTime? F_CreateTime { get; set; }

        /// <summary>
        /// 提供一个可以扩展信息的口，以防止该设定的内容不够使用时用于传输信息。
        /// </summary>
        public object F_OtherMsg { get; set; }

        /// <summary>
        /// 如果该实例继承了创建权限，则支持创建方法。否则会报异常。
        /// </summary>
        public override void Create()
        {
            var entity = this as ICreateAuth;
            entity.F_Id = NewGuid();
            if (string.IsNullOrEmpty(entity.F_CreateUserId))
            {
                var loginInfo = OperatorProvider.Provider.GetCurrent();

                //TODO yueye 这里考虑设定一个默认的用户，可以对未指明身份的日志进行记录。
                entity.F_CreateUserId = loginInfo != null ? loginInfo.UserId : "otherUser";
            }
            if (entity.F_CreateTime == null)
            {
                entity.F_CreateTime = DateTime.Now;
            }
        }

        /// <summary>
        /// 浅克隆的方法，可被继承
        /// </summary>
        /// <returns></returns>
        public T Copy<T>() where T : BaseSysLogModel, new()
        {
            T newLogModel = new T();
            newLogModel.F_Id = this.F_Id;
            newLogModel.F_System = this.F_System;
            newLogModel.F_Module = this.F_Module;
            newLogModel.F_OptType = this.F_OptType;
            newLogModel.F_OptContent = this.F_OptContent;
            newLogModel.F_CreateUserId = this.F_CreateUserId;
            newLogModel.F_CreateTime = this.F_CreateTime;
            newLogModel.F_OtherMsg = this.F_OtherMsg;

            return newLogModel;
        }

        /// <summary>
        /// 重写转化为字符串的方法，用于在记录文本型日志时使用到
        /// 格式为： 说明:信息;
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("；系统：" + this.F_System);
            builder.Append("；功能模块：" + this.F_Module);
            builder.Append("；操作类型：" + this.F_OptType);
            builder.Append("；操作说明：" + this.F_OptContent);
            builder.Append("；操作人：" + this.F_CreateUserId);
            builder.Append("；时间：" + this.F_CreateTime);

            return builder.ToString();
        }
    }
}
