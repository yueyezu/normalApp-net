using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace LT.ProjectCore
{
    public class UICommon
    {
        #region 输出信息

        /// <summary>
        /// 输出错误提示
        /// </summary>
        /// <param name="msg"></param>
        public static void ShowErrorMsg(string msg)
        {
            MessageBox.Show(msg, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        /// <summary>
        /// 输出警报提示
        /// </summary>
        /// <param name="msg"></param>
        public static void ShowWarningMsg(string msg)
        {
            MessageBox.Show(msg, "警告", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        /// <summary>
        /// 输出成功的提示信息
        /// </summary>
        /// <param name="msg"></param>
        public static void ShowSuccessMsg(string msg)
        {
            MessageBox.Show(msg, "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        /// <summary>
        /// 输出确认信息
        /// </summary>
        /// <param name="msg"></param>
        /// <returns></returns>
        public static bool ShowPromptMsg(string msg)
        {
            DialogResult result = MessageBox.Show(msg, "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {
                return true;
            }
            return false;
        }

        #endregion

        #region 修改窗口样式，使之不再alt+tab中出现

        [DllImport("user32.dll")]
        private static extern Int32 GetWindowLong(IntPtr hwnd, Int32 index);

        [DllImport("user32.dll")]
        private static extern Int32 SetWindowLong(IntPtr hwnd, Int32 index, Int32 newValue);

        private const int GWL_EXSTYLE = (-20);

        /// <summary>
        /// 添加窗体的样式，使之在alt+tab中不出现
        /// </summary>
        /// <param name="hwnd"></param>
        /// <param name="val"></param>
        private static void AddWindowExStyle(IntPtr hwnd, Int32 val)
        {
            int oldValue = GetWindowLong(hwnd, GWL_EXSTYLE);
            if (oldValue == 0)
            {
                throw new Win32Exception();
            }
            if (0 == SetWindowLong(hwnd, GWL_EXSTYLE, oldValue | val))
            {
                throw new Win32Exception();
            }
        }
        private static int WS_EX_TOOLWINDOW = 0x00000080;
        /// <summary>
        /// 将调整窗口进行封装下
        /// </summary>
        /// <param name="form"></param>
        public static void SetFormToolWindowStyle(Form form)
        {
            AddWindowExStyle(form.Handle, WS_EX_TOOLWINDOW);
        }

        #endregion

        /// <summary>
        /// 用于检测当前代码环境是否是在开发环境下
        /// </summary>
        /// <returns></returns>
        public static bool IsDesignMode()
        {
            bool returnFlag = false;
#if DEBUG
            if (LicenseManager.UsageMode == LicenseUsageMode.Designtime)
            {
                returnFlag = true;
            }
            else if (Process.GetCurrentProcess().ProcessName == "devenv")
            {
                returnFlag = true;
            }
#endif

            return returnFlag;
        }
    }
}
