using System;
using System.Threading;
using System.Windows.Forms;
using LT.ProjectCore;

namespace LT.WinApp
{
    static class Program
    {
        private static Mutex _mutex;

        /// <summary>
        /// 程序入口方法
        /// </summary>
        /// <param name="args"></param>
        [STAThread]
        static void Main(string[] args)
        {
            if (TestAlreadyRunning())
            {
                MessageBox.Show("程序已经启动！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                Application.Exit();
            }
            else
            {
                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);

                string errorMsg = "";
                if (LtCore.Core.Init(out errorMsg))
                {
                    MainForm main = new MainForm(args);
                    Application.Run(main);
                }
                else
                {
                    UICommon.ShowErrorMsg(errorMsg);
                }
            }
        }

        /// <summary>
        /// 测试程序是否已经运行
        /// </summary>
        /// <returns></returns>
        static bool TestAlreadyRunning()
        {
            string mutexName = "LTLicenseCreator";
            try
            {
                _mutex = Mutex.OpenExisting(mutexName);
                if (_mutex != null)
                {
                    return true;
                }
            }
            catch
            {
                // ignored
            }
            finally
            {
                _mutex = new Mutex(true, mutexName);
            }
            return false;
        }
    }
}
