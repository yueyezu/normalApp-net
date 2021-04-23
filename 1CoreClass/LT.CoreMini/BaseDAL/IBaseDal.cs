/**
* Title: 数据处理层的接口
* Author: yueye
* Date: 2017/12/13 17:12:22
* Desp: 后续慢慢完善
*/

using System.Collections.Generic;
using System.Data.Common;

namespace LT.Core
{
    interface IBaseDal
    {
        T ReaderToModel<T>(DbDataReader reader) where T : new();

        Dictionary<string, object> ReaderToDictionary(DbDataReader reader);
    }
}
