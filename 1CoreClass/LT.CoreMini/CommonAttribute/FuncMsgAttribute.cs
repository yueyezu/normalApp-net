/**
* Title: 功能的附件属性的属性类，主要是为了在其后的功能中使用时设置用
* Author: yueye
* Date: 2018/3/28 15:37:06
* Desp: 包括该功能：所在的模块，对应的数据库表名以及其他
*/

using System;

namespace LT.Core
{
    [AttributeUsage(AttributeTargets.Class)]
    public class FuncMsgAttribute : Attribute
    {
        public string TableName { get; set; }

        public string ModuleName { get; set; }

        public string FuncName { get; set; }

        public string Other { get; set; }

        /// <summary>
        /// 方法属性设置
        /// </summary>
        /// <param name="tableName">表名信息</param>
        public FuncMsgAttribute(string tableName)
        {
            if (!string.IsNullOrEmpty(tableName))
            {
                this.TableName = tableName;
            }
        }

        /// <summary>
        /// 方法属性设置，模块以及功能名称设置
        /// </summary>
        /// <param name="moduleName"></param>
        /// <param name="funcName"></param>
        public FuncMsgAttribute(string moduleName, string funcName)
        {
            if (!string.IsNullOrEmpty(moduleName))
            {
                this.ModuleName = moduleName;
            }
            if (!string.IsNullOrEmpty(funcName))
            {
                this.FuncName = funcName;
            }
        }

        public string GetModuleFuncStr()
        {
            return this.ModuleName + ">" + this.FuncName;

        }
    }
}
