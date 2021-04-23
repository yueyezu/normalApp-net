/**
* Title: 实体对象的基类
* Author: yueye
* Date: 2017-12-13
* Desp: 通过基类定义了实体类的插入、修改、删除相关的操作。前提是实体集成了相应的权限接口。
*/
using System;
using LT.Code;

namespace LT.Core
{
    public abstract class BaseEntity<TEntity>
    {
        /// <summary>
        /// 实体ID
        /// </summary>
        public abstract string F_Id { get; set; }

        /// <summary>
        /// 如果该实例继承了创建权限，则支持创建方法。否则会报异常。
        /// </summary>
        public virtual void Create()
        {
            var entity = this as ICreateAuth;
            entity.F_Id = Utility.GuId();
            var loginInfo = OperatorProvider.Provider.GetCurrent();
            if (loginInfo != null)
            {
                entity.F_CreateUserId = loginInfo.UserId;
            }
            entity.F_CreateTime = DateTime.Now;
        }
        /// <summary>
        /// 如果该实例继承了修改权限，则支持修改方法。否则会报异常。
        /// </summary>
        public virtual void Modify(string fId)
        {
            var entity = this as IModifyAuth;
            entity.F_Id = fId;
            var loginInfo = OperatorProvider.Provider.GetCurrent();
            if (loginInfo != null)
            {
                entity.F_LastModifyUserId = loginInfo.UserId;
            }
            entity.F_LastModifyTime = DateTime.Now;
        }
        /// <summary>
        /// 如果该实例继承了删除权限，则支持删除方法。否则会报异常。
        /// </summary>
        public virtual void Remove()
        {
            var entity = this as IDeleteAuth;
            var loginInfo = OperatorProvider.Provider.GetCurrent();
            if (loginInfo != null)
            {
                entity.F_DeleteUserId = loginInfo.UserId;
            }
            entity.F_DeleteTime = DateTime.Now;
            entity.F_DeleteFlag = 1;
        }

        /// <summary>
        /// 获取全局唯一标识符guid
        /// </summary>
        /// <returns></returns>
        public string NewGuid()
        {
            return Utility.GuId();
        }
    }
}
