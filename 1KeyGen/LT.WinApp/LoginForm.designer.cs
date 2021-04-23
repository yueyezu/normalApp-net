namespace LT.WinApp
{
    partial class LoginForm
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LoginForm));
            this.styleManager1 = new DevComponents.DotNetBar.StyleManager();
            this.lblName = new DevComponents.DotNetBar.LabelX();
            this.lblPassword = new DevComponents.DotNetBar.LabelX();
            this.txtUPwd = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.btnEnter = new DevComponents.DotNetBar.ButtonX();
            this.btnExc = new DevComponents.DotNetBar.ButtonX();
            this.cbxUName = new DevComponents.DotNetBar.Controls.ComboBoxEx();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.panel1 = new System.Windows.Forms.Panel();
            this.hlbReTestWebConn = new System.Windows.Forms.LinkLabel();
            this.lblTestWebStatus = new DevComponents.DotNetBar.LabelX();
            this.lblTestWeb = new DevComponents.DotNetBar.LabelX();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // styleManager1
            // 
            this.styleManager1.ManagerColorTint = System.Drawing.Color.Gray;
            this.styleManager1.ManagerStyle = DevComponents.DotNetBar.eStyle.Office2007Blue;
            // 
            // lblName
            // 
            this.lblName.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.lblName.BackgroundStyle.Class = "";
            this.lblName.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblName.ForeColor = System.Drawing.Color.Black;
            this.lblName.Location = new System.Drawing.Point(98, 118);
            this.lblName.Name = "lblName";
            this.lblName.SingleLineColor = System.Drawing.SystemColors.ControlText;
            this.lblName.Size = new System.Drawing.Size(73, 26);
            this.lblName.TabIndex = 2;
            this.lblName.Text = "用户名:";
            // 
            // lblPassword
            // 
            this.lblPassword.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.lblPassword.BackgroundStyle.Class = "";
            this.lblPassword.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblPassword.ForeColor = System.Drawing.Color.Black;
            this.lblPassword.Location = new System.Drawing.Point(98, 154);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(73, 26);
            this.lblPassword.TabIndex = 3;
            this.lblPassword.Text = "密   码:";
            // 
            // txtUPwd
            // 
            // 
            // 
            // 
            this.txtUPwd.Border.Class = "TextBoxBorder";
            this.txtUPwd.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtUPwd.Location = new System.Drawing.Point(200, 153);
            this.txtUPwd.Name = "txtUPwd";
            this.txtUPwd.PasswordChar = '*';
            this.txtUPwd.Size = new System.Drawing.Size(150, 29);
            this.txtUPwd.TabIndex = 5;
            // 
            // btnEnter
            // 
            this.btnEnter.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnEnter.BackColor = System.Drawing.Color.Maroon;
            this.btnEnter.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnEnter.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground;
            this.btnEnter.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnEnter.Location = new System.Drawing.Point(109, 215);
            this.btnEnter.Name = "btnEnter";
            this.btnEnter.Size = new System.Drawing.Size(82, 34);
            this.btnEnter.TabIndex = 12;
            this.btnEnter.Text = "登录";
            this.btnEnter.Click += new System.EventHandler(this.btnEnter_Click);
            // 
            // btnExc
            // 
            this.btnExc.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnExc.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground;
            this.btnExc.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnExc.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnExc.Location = new System.Drawing.Point(251, 215);
            this.btnExc.Name = "btnExc";
            this.btnExc.Size = new System.Drawing.Size(82, 34);
            this.btnExc.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnExc.TabIndex = 13;
            this.btnExc.Text = "取消";
            this.btnExc.Click += new System.EventHandler(this.btnExc_Click);
            // 
            // cbxUName
            // 
            this.cbxUName.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbxUName.FocusHighlightColor = System.Drawing.Color.White;
            this.cbxUName.FocusHighlightEnabled = true;
            this.cbxUName.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.cbxUName.FormattingEnabled = true;
            this.cbxUName.ItemHeight = 23;
            this.cbxUName.Location = new System.Drawing.Point(200, 117);
            this.cbxUName.Name = "cbxUName";
            this.cbxUName.Size = new System.Drawing.Size(150, 29);
            this.cbxUName.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.cbxUName.TabIndex = 4;
            this.cbxUName.SelectedIndexChanged += new System.EventHandler(this.cbxUName_SelectedIndexChanged);
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // labelX1
            // 
            this.labelX1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.labelX1.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX1.BackgroundStyle.Class = "";
            this.labelX1.Font = new System.Drawing.Font("微软雅黑", 23F, System.Drawing.FontStyle.Bold);
            this.labelX1.ForeColor = System.Drawing.Color.MidnightBlue;
            this.labelX1.Location = new System.Drawing.Point(98, 30);
            this.labelX1.Name = "labelX1";
            this.labelX1.Size = new System.Drawing.Size(269, 47);
            this.labelX1.TabIndex = 14;
            this.labelX1.Text = "授权认证生成系统";
            this.labelX1.TextAlignment = System.Drawing.StringAlignment.Center;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(194)))), ((int)(((byte)(217)))), ((int)(((byte)(247)))));
            this.panel1.Controls.Add(this.hlbReTestWebConn);
            this.panel1.Controls.Add(this.lblTestWebStatus);
            this.panel1.Controls.Add(this.lblTestWeb);
            this.panel1.Location = new System.Drawing.Point(-2, 296);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(472, 27);
            this.panel1.TabIndex = 15;
            // 
            // hlbReTestWebConn
            // 
            this.hlbReTestWebConn.AutoSize = true;
            this.hlbReTestWebConn.Location = new System.Drawing.Point(174, 9);
            this.hlbReTestWebConn.Name = "hlbReTestWebConn";
            this.hlbReTestWebConn.Size = new System.Drawing.Size(53, 12);
            this.hlbReTestWebConn.TabIndex = 18;
            this.hlbReTestWebConn.TabStop = true;
            this.hlbReTestWebConn.Text = "重新检测";
            this.hlbReTestWebConn.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.hlbReTestWebConn_LinkClicked);
            // 
            // lblTestWebStatus
            // 
            this.lblTestWebStatus.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            // 
            // 
            // 
            this.lblTestWebStatus.BackgroundStyle.Class = "";
            this.lblTestWebStatus.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblTestWebStatus.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblTestWebStatus.Location = new System.Drawing.Point(77, 3);
            this.lblTestWebStatus.Name = "lblTestWebStatus";
            this.lblTestWebStatus.Size = new System.Drawing.Size(156, 24);
            this.lblTestWebStatus.TabIndex = 17;
            this.lblTestWebStatus.Text = "服务器连接成功！";
            // 
            // lblTestWeb
            // 
            this.lblTestWeb.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            // 
            // 
            // 
            this.lblTestWeb.BackgroundStyle.Class = "";
            this.lblTestWeb.ForeColor = System.Drawing.Color.DarkGreen;
            this.lblTestWeb.Location = new System.Drawing.Point(10, 3);
            this.lblTestWeb.Name = "lblTestWeb";
            this.lblTestWeb.Size = new System.Drawing.Size(74, 24);
            this.lblTestWeb.TabIndex = 16;
            this.lblTestWeb.Text = "连接状态：";
            // 
            // LoginForm
            // 
            this.AcceptButton = this.btnEnter;
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Inherit;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.CancelButton = this.btnExc;
            this.ClientSize = new System.Drawing.Size(466, 322);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.labelX1);
            this.Controls.Add(this.cbxUName);
            this.Controls.Add(this.btnExc);
            this.Controls.Add(this.btnEnter);
            this.Controls.Add(this.txtUPwd);
            this.Controls.Add(this.lblPassword);
            this.Controls.Add(this.lblName);
            this.ForeColor = System.Drawing.Color.Black;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "LoginForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "登录窗口";
            this.Load += new System.EventHandler(this.LoginForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.StyleManager styleManager1;
        private DevComponents.DotNetBar.LabelX lblName;
        private DevComponents.DotNetBar.LabelX lblPassword;
        private DevComponents.DotNetBar.Controls.TextBoxX txtUPwd;
        private DevComponents.DotNetBar.ButtonX btnEnter;
        private DevComponents.DotNetBar.ButtonX btnExc;
        private DevComponents.DotNetBar.Controls.ComboBoxEx cbxUName;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private DevComponents.DotNetBar.LabelX labelX1;
        private System.Windows.Forms.Panel panel1;
        private DevComponents.DotNetBar.LabelX lblTestWebStatus;
        private DevComponents.DotNetBar.LabelX lblTestWeb;
        private System.Windows.Forms.LinkLabel hlbReTestWebConn;
    }
}

