using System;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using LT.Code;
using LT.ProjectCore;
using LT.ProjectCore.DAL;

namespace LT.WinApp
{
    public partial class MainForm : Office2007Form
    {
        /// <summary>
        /// 主界面
        /// </summary>
        /// <param name="args"></param>
        public MainForm(string[] args)
        {
            InitializeComponent();
            //此时为通过浏览器直接打开的程序，使用传过来的参数对用户的信息进行获取
            //该块的功能可以暂时不开发
        }
        public MainForm()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 窗体加载时事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void MainForm_Load(object sender, EventArgs e)
        {
            //cbxLicenceType.Items.Add(new ListItem("ips", "ipstr"));
            cbxLicenceType.SelectedIndex = 0;
        }

        #region 菜单栏面板操作

        private string CurrentShowPnl = "pnlQuery";

        /// <summary>
        /// 点击菜单来中，调用切换tab时触发的事件
        /// 该功能调用的条件是：菜单选项的tag存储的名称与控件的name一致
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void MenuItemChangeTab(object sender, EventArgs e)
        {
            string needShowTabName = "";
            //根据对象的不同类型进行转化 获取tag值
            if (sender is ToolStripMenuItem)
            {
                ToolStripMenuItem menuItem = sender as ToolStripMenuItem;
                needShowTabName = menuItem.Tag.ToString();
            }
            if (sender is ButtonX)
            {
                ButtonX menuItem = sender as ButtonX;
                needShowTabName = menuItem.Tag.ToString();
            }

            if (CurrentShowPnl != needShowTabName)
            {
                //隐藏掉现在显示的功能面板
                Control[] controlsColose = this.Controls.Find(CurrentShowPnl, false);
                if (controlsColose.Length > 0)
                {
                    controlsColose[0].Visible = false;
                }

                //显示需要切换到的功能面板
                switch (needShowTabName)
                {
                    case "OraginTab":
                        //pnlQuery.Visible = true;
                        //menuReturn.Visible = false;
                        //CurrentShowPnl = "pnlQuery";

                        break;
                }
            }
        }

        #endregion

        Licence licence = new Licence();
        LicenceModel currentModel = new LicenceModel();

        /// <summary>
        /// 点击选择生成保存路径的参数
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSavePath_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog dialog = new FolderBrowserDialog();
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                lblSavePath.Text = dialog.SelectedPath;
            }
        }

        /// <summary>
        /// 创建机器码
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCreateMCode_Click(object sender, EventArgs e)
        {
            string typeStr = cbxLicenceType.SelectedItem.ToString();
            LicenseTypeEnum licenseType = (LicenseTypeEnum)Enum.Parse(typeof(LicenseTypeEnum), typeStr);
            string ip = txtIp.Text;
            string mac = txtMac.Text;

            if (licenseType == LicenseTypeEnum.Ip && ip == "")
            {
                UICommon.ShowWarningMsg("Ip类型的授权，必须录入Ip信息。");
                return;
            }

            if (licenseType == LicenseTypeEnum.Mac && mac == "")
            {
                UICommon.ShowWarningMsg("Mac类型的授权，必须录入Mac信息。");
                return;
            }

            if (licenseType == LicenseTypeEnum.IpMac && (ip == "" || mac == ""))
            {
                UICommon.ShowWarningMsg("IpMac类型的授权，必须录入Mac信息和Ip信息。");
                return;
            }

            currentModel.LicenceType = licenseType;
            currentModel.Ip = ip;
            currentModel.Mac = mac;

            try
            {
                currentModel.MCode = licence.CreateMCode(ip, mac, licenseType);
            }
            catch (Exception)
            {
                throw;
            }


            txtMCode.Text = currentModel.MCode;
        }

        /// <summary>
        /// 创建文件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCreate_Click(object sender, EventArgs e)
        {
            currentModel.Date = txtDate.Value;
            currentModel.UserNum = txtUserNum.Value;
            currentModel.AllUser = chkAllUser.Checked;
            currentModel.AllData = chkAllData.Checked;
            string savePath = lblSavePath.Text;

            try
            {
                //生成RSA加密的密钥信息
                RSAEncryptExt.RSAKey keyPair = RSAEncryptExt.GetRASKey();
                currentModel.PublicKey = keyPair.PublicKey;
                currentModel.PrivateKey = keyPair.PrivateKey;

                currentModel.Licence = licence.CreateLicence(currentModel);
                licence.CreateLicsenceFile(currentModel, savePath);

                LicenceDal dal = new LicenceDal();
                dal.AddLicence(currentModel);
            }
            catch (Exception)
            {
                throw;
            }

            UICommon.ShowSuccessMsg("生成完成。");
            System.Diagnostics.Process.Start(savePath);
        }

        /// <summary>
        /// 进行重新授权，即对于已经存储的密码进行重新生成。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnReCreate_Click(object sender, EventArgs e)
        {
            string filePath = lblSavePath.Text + "\\Licence.lic";

            try
            {
                LicenceModel model = licence.GetLicenceModel(filePath);
                string showStr = model.ToJson();
                UICommon.ShowSuccessMsg(showStr);
            }
            catch (Exception ex)
            {
                UICommon.ShowErrorMsg(ex.Message);
            }
        }
    }
}
