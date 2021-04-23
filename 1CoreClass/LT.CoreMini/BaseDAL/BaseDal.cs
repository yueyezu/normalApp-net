/**
* Title: 数据处理层的基类
* Author: yueye
* Date: 2017/12/13 17:12:22
* Desp: 后续慢慢完善
*/

using System;
using System.Collections.Generic;
using System.Data.Common;

namespace LT.Core
{
    public class BaseDal : IBaseDal
    {
        /// <summary>
        /// 数据操作类实例
        /// </summary>
        protected IDbHelper DbHelper = DbFactory.GetDbHelper();

        #region DataReader To Object

        /// <summary>
        /// 为指定对象分配参数
        /// </summary>
        /// <typeparam name="T">待赋值的类型</typeparam>
        /// <returns></returns>
        /// <returns></returns>
        public T ReaderToModel<T>(DbDataReader reader) where T : new()
        {
            Type t = typeof(T);
            var fields = t.GetProperties(); //获取当前输入的实体类的所有字段信息

            T entity = new T(); //实例化该对象

            string val = string.Empty; //过度用的值
            object obj = null;
            foreach (var field in fields)
            {
                int ordinal;
                try
                {
                    ordinal = reader.GetOrdinal(field.Name); //如果找不到该列的查询，则会直接抛出异常，该列跳过即可。

                    val = reader[ordinal].ToString();
                    //非泛型
                    if (!field.PropertyType.IsGenericType)
                        obj = string.IsNullOrEmpty(val) ? null : Convert.ChangeType(val, field.PropertyType);
                    else //泛型Nullable<>
                    {
                        Type genericTypeDefinition = field.PropertyType.GetGenericTypeDefinition();
                        if (genericTypeDefinition == typeof(Nullable<>))
                        {
                            obj = string.IsNullOrEmpty(val)
                                ? null
                                : Convert.ChangeType(val, Nullable.GetUnderlyingType(field.PropertyType));
                        }
                    }
                    field.SetValue(entity, obj, null);
                }
                catch (Exception)
                {
                    continue;
                }
            }

            return entity;
        }

        /// <summary>
        /// 将DataReader转化为Dictionary对象，对于后续使用时，可以减少实体类的创建。
        /// 
        /// 当然这里更推荐的方法是在原有实体类的基础上对于多余字段进行扩展。
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
        public Dictionary<string, object> ReaderToDictionary(DbDataReader reader)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            for (int i = 0; i < reader.FieldCount; i++)
            {
                string fileName = reader.GetName(i);

                if (DBNull.Value.Equals(reader[i]))
                {
                    dic.Add(fileName, "");
                }
                else
                {
                    Type t = reader.GetFieldType(i);
                    if (t == null)
                        dic.Add(fileName, reader[i]);
                    else
                        dic.Add(fileName, Convert.ChangeType(reader[i], t));
                }
            }

            return dic;
        }

        #endregion
    }
}
