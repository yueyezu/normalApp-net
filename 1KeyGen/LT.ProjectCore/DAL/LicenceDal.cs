/**
* Title:
* Author: yueye
* Date: 2018/1/16 10:21:08
* Desp:
*/

using System;
using System.Data;
using System.Data.SQLite;

namespace LT.ProjectCore.DAL
{
    public class LicenceDal
    {
        private SqliteHelper sqliteHelper = DbFactory.Instance.GetDbHelper();

        /// <summary>
        /// 将生成的授权信息存储到数据库中
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool AddLicence(LicenceModel model)
        {
            string sql = @"INSERT INTO licences (LicenceType, Ip, Mac, MCode, Date, AllData, UserNum, AllUser, PublicKey, PrivateKey, Licence)
 VALUES (@LicenceType,@Ip,@Mac,@MCode,@Date,@AllData,@UserNum,@AllUser,@PublicKey,@PrivateKey,@Licence)";

            SQLiteParameter[] parameters =
            {
                new SQLiteParameter("@LicenceType", DbType.String){ Value=model.LicenceType },
                new SQLiteParameter("@Ip", DbType.String){ Value=model.Ip },
                new SQLiteParameter("@Mac", DbType.String){ Value=model.Mac },
                new SQLiteParameter("@MCode", DbType.String){ Value=model.MCode },
                new SQLiteParameter("@Date", DbType.DateTime){ Value=model.Date },
                new SQLiteParameter("@AllData", DbType.Int32){ Value=model.AllData },
                new SQLiteParameter("@UserNum", DbType.Int32){ Value=model.UserNum },
                new SQLiteParameter("@AllUser", DbType.Int32){ Value=model.AllUser },
                new SQLiteParameter("@PublicKey", DbType.String){ Value=model.PublicKey },
                new SQLiteParameter("@PrivateKey", DbType.String){ Value=model.PrivateKey },
                new SQLiteParameter("@Licence", DbType.String){ Value=model.Licence },
            };

            try
            {
                int result = sqliteHelper.ExecuteNonQuery(sql, parameters);
                return result == 1;
            }
            catch (Exception)
            {
                return true;
            }
        }
    }
}
