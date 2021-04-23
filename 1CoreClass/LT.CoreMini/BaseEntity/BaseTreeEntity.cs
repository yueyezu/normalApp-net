/**
* Title: 树状结构的基类
* Author: yueye
* Date: 2018/2/7 14:12:22
* Desp:
*/

using System;
using LT.Code;

namespace LT.Core
{
    public abstract class BaseTreeEntity<TEntity> : BaseEntity<TEntity>
    {
        public abstract string F_Name { get; set; }
        public abstract string F_ParentId { get; set; }
        public abstract string F_Layers { get; set; }

        /// <summary>
        /// 如果该实例继承了创建权限，则支持创建方法。否则会报异常。
        /// </summary>
        public override void Create()
        {
            var entity = this as ICreateAuth;
            entity.F_Id = Utility.GuId();
            var LoginInfo = OperatorProvider.Provider.GetCurrent();
            if (LoginInfo != null)
            {
                entity.F_CreateUserId = LoginInfo.UserId;
            }
            entity.F_CreateTime = DateTime.Now;
        }
        /// <summary>
        /// 如果该实例继承了修改权限，则支持修改方法。否则会报异常。
        /// </summary>
        public override void Modify(string fId)
        {
            var entity = this as IModifyAuth;
            entity.F_Id = fId;
            var LoginInfo = OperatorProvider.Provider.GetCurrent();
            if (LoginInfo != null)
            {
                entity.F_LastModifyUserId = LoginInfo.UserId;
            }
            entity.F_LastModifyTime = DateTime.Now;
        }
        /// <summary>
        /// 如果该实例继承了删除权限，则支持删除方法。否则会报异常。
        /// </summary>
        public override void Remove()
        {
            var entity = this as IDeleteAuth;
            var LoginInfo = OperatorProvider.Provider.GetCurrent();
            if (LoginInfo != null)
            {
                entity.F_DeleteUserId = LoginInfo.UserId;
            }
            entity.F_DeleteTime = DateTime.Now;
            entity.F_DeleteFlag = 1;
        }
    }
}
