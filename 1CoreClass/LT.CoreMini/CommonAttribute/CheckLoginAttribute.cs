/**
* Title: 用户是否要进行验证的属性指定
* Author: yueye
* Date: 2018/1/10 9:31:29
* Desp:主要是对于用户登录以及全局登录信息的验证。
*/

using System;
using System.Collections.Generic;
using System.Linq;

namespace LT.Core
{
    [AttributeUsage(AttributeTargets.Class)]
    public class CheckLoginAttribute : Attribute
    {
        /// <summary>
        /// 类中不需要进行权限验证的方法进行指定
        /// </summary>
        public List<string> IgnoreFunction = new List<string>();
        /// <summary>
        /// 定义该类不需要权限验证
        /// </summary>
        public bool IsCheck = true;

        /// <summary>
        /// 登录验证属性指定
        /// </summary>
        /// <param name="isCheck">是否进行登录验证，默认为true，即进行登录验证</param>
        /// <param name="ignoreFun">指定该类中不进行登录验证的方法列表</param>
        public CheckLoginAttribute(bool isCheck = true, params string[] ignoreFun)
        {
            IgnoreFunction = ignoreFun.ToList();
            IsCheck = isCheck;
        }
    }
}
