using System;
using System.Configuration;

namespace LT.ProjectCore
{
    public class DbFactory
    {
        private static String Constr = "";

        #region 简单的单例模式

        private static DbFactory instance = null;

        public static DbFactory Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DbFactory();
                }
                return instance;
            }
        }

        private DbFactory()
        {
            ConnectionStringSettings connSetting = ConfigurationManager.ConnectionStrings["ConnStr"];
            Constr = connSetting.ConnectionString;
        }

        #endregion

        public SqliteHelper GetDbHelper()
        {
            return SqliteHelper.GetInstance(Constr);
        }
    }
}
