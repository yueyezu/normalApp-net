using System;
using System.Drawing;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using LT.Code;
using LT.ProjectCore;

namespace LT.WinApp
{
    public partial class LoginForm : Office2007Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 登录界面加载事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void LoginForm_Load(object sender, EventArgs e)
        {
            TestWebConn();

            if (cbxUName.Text == "")
                cbxUName.Focus();
            else if (txtUPwd.Text == "")
                txtUPwd.Focus();
            else
                btnEnter.Focus();
        }

        /// <summary>
        /// 重新检测服务器连接情况
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void hlbReTestWebConn_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            TestWebConn();
        }

        /// <summary>
        /// 点击登录按钮的事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnEnter_Click(object sender, EventArgs e)
        {
            string uName = cbxUName.Text.Trim();
            if (uName == "")
            {
                UICommon.ShowWarningMsg("请选择用户名！");
                return;
            }
            string uPwd = txtUPwd.Text.Trim();
            if (uPwd == "")
            {
                UICommon.ShowWarningMsg("密码不能为空！");
                return;
            }
            // uPwd = Utility.PwdEncrypt(uPwd);
            try
            {

                this.DialogResult = DialogResult.OK;
            }
            catch (Exception ex)
            {

            }
        }

        private void btnExc_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void cbxUName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        /**************************** 界面之外操作 *********************************/

        /// <summary>
        /// 检测网络是否联通
        /// </summary>
        public void TestWebConn()
        {
            if (NetHelper.IsConn(Configs.GetSetting("ServerIp")))
            {
                lblTestWebStatus.Text = "服务器连接成功！";
                lblTestWebStatus.ForeColor = Color.LawnGreen;
                hlbReTestWebConn.Visible = false;
            }
            else
            {
                lblTestWebStatus.Text = "服务器连接失败！";
                lblTestWebStatus.ForeColor = Color.Red;
                hlbReTestWebConn.Visible = true;
            }
        }
    }
}
