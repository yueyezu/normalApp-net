namespace LT.WinApp
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.menuReturn = new System.Windows.Forms.ToolStripMenuItem();
            this.关于ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItemHelp = new System.Windows.Forms.ToolStripMenuItem();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.lblSavePath = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.btnReCreate = new DevComponents.DotNetBar.ButtonX();
            this.cbxLicenceType = new DevComponents.DotNetBar.Controls.ComboBoxEx();
            this.comboItem5 = new DevComponents.Editors.ComboItem();
            this.comboItem6 = new DevComponents.Editors.ComboItem();
            this.comboItem7 = new DevComponents.Editors.ComboItem();
            this.btnCreateMCode = new DevComponents.DotNetBar.ButtonX();
            this.labelX8 = new DevComponents.DotNetBar.LabelX();
            this.btnSavePath = new DevComponents.DotNetBar.ButtonX();
            this.btnCreate = new DevComponents.DotNetBar.ButtonX();
            this.txtDate = new DevComponents.Editors.DateTimeAdv.DateTimeInput();
            this.txtUserNum = new DevComponents.Editors.IntegerInput();
            this.chkAllData = new DevComponents.DotNetBar.Controls.CheckBoxX();
            this.chkAllUser = new DevComponents.DotNetBar.Controls.CheckBoxX();
            this.labelX5 = new DevComponents.DotNetBar.LabelX();
            this.labelX4 = new DevComponents.DotNetBar.LabelX();
            this.txtMCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX6 = new DevComponents.DotNetBar.LabelX();
            this.txtMac = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX3 = new DevComponents.DotNetBar.LabelX();
            this.txtIp = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX2 = new DevComponents.DotNetBar.LabelX();
            this.buttonX2 = new DevComponents.DotNetBar.ButtonX();
            this.gridLicence = new DevComponents.DotNetBar.Controls.DataGridViewX();
            this.授权类型 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.机器码 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.用户数 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.到期时间 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.授权内容 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtQueryMCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX7 = new DevComponents.DotNetBar.LabelX();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtDate)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtUserNum)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridLicence)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.Color.Azure;
            this.menuStrip1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(800, 24);
            this.menuStrip1.TabIndex = 3;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // menuReturn
            // 
            this.menuReturn.Name = "menuReturn";
            this.menuReturn.Size = new System.Drawing.Size(53, 24);
            this.menuReturn.Tag = "pnlQuery";
            this.menuReturn.Text = "主页";
            this.menuReturn.Visible = false;
            this.menuReturn.Click += new System.EventHandler(this.MenuItemChangeTab);
            // 
            // 关于ToolStripMenuItem
            // 
            this.关于ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemHelp});
            this.关于ToolStripMenuItem.Name = "关于ToolStripMenuItem";
            this.关于ToolStripMenuItem.Size = new System.Drawing.Size(53, 24);
            this.关于ToolStripMenuItem.Text = "关于";
            // 
            // MenuItemHelp
            // 
            this.MenuItemHelp.Name = "MenuItemHelp";
            this.MenuItemHelp.Size = new System.Drawing.Size(94, 22);
            this.MenuItemHelp.Text = "帮助";
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 24);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.AutoScroll = true;
            this.splitContainer1.Panel1.Controls.Add(this.labelX1);
            this.splitContainer1.Panel1.Controls.Add(this.lblSavePath);
            this.splitContainer1.Panel1.Controls.Add(this.btnReCreate);
            this.splitContainer1.Panel1.Controls.Add(this.cbxLicenceType);
            this.splitContainer1.Panel1.Controls.Add(this.btnCreateMCode);
            this.splitContainer1.Panel1.Controls.Add(this.labelX8);
            this.splitContainer1.Panel1.Controls.Add(this.btnSavePath);
            this.splitContainer1.Panel1.Controls.Add(this.btnCreate);
            this.splitContainer1.Panel1.Controls.Add(this.txtDate);
            this.splitContainer1.Panel1.Controls.Add(this.txtUserNum);
            this.splitContainer1.Panel1.Controls.Add(this.chkAllData);
            this.splitContainer1.Panel1.Controls.Add(this.chkAllUser);
            this.splitContainer1.Panel1.Controls.Add(this.labelX5);
            this.splitContainer1.Panel1.Controls.Add(this.labelX4);
            this.splitContainer1.Panel1.Controls.Add(this.txtMCode);
            this.splitContainer1.Panel1.Controls.Add(this.labelX6);
            this.splitContainer1.Panel1.Controls.Add(this.txtMac);
            this.splitContainer1.Panel1.Controls.Add(this.labelX3);
            this.splitContainer1.Panel1.Controls.Add(this.txtIp);
            this.splitContainer1.Panel1.Controls.Add(this.labelX2);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.buttonX2);
            this.splitContainer1.Panel2.Controls.Add(this.gridLicence);
            this.splitContainer1.Panel2.Controls.Add(this.txtQueryMCode);
            this.splitContainer1.Panel2.Controls.Add(this.labelX7);
            this.splitContainer1.Size = new System.Drawing.Size(800, 506);
            this.splitContainer1.SplitterDistance = 266;
            this.splitContainer1.TabIndex = 4;
            // 
            // labelX1
            // 
            this.labelX1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.labelX1.BackColor = System.Drawing.Color.LightCyan;
            // 
            // 
            // 
            this.labelX1.BackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground;
            this.labelX1.BackgroundStyle.Class = "";
            this.labelX1.Location = new System.Drawing.Point(3, 4);
            this.labelX1.Name = "labelX1";
            this.labelX1.Size = new System.Drawing.Size(260, 21);
            this.labelX1.TabIndex = 8;
            this.labelX1.Text = "授权码生成";
            // 
            // lblSavePath
            // 
            // 
            // 
            // 
            this.lblSavePath.Border.Class = "TextBoxBorder";
            this.lblSavePath.Enabled = false;
            this.lblSavePath.Location = new System.Drawing.Point(23, 371);
            this.lblSavePath.MaxLength = 1000;
            this.lblSavePath.Multiline = true;
            this.lblSavePath.Name = "lblSavePath";
            this.lblSavePath.Size = new System.Drawing.Size(221, 45);
            this.lblSavePath.TabIndex = 7;
            // 
            // btnReCreate
            // 
            this.btnReCreate.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnReCreate.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnReCreate.Location = new System.Drawing.Point(122, 434);
            this.btnReCreate.Name = "btnReCreate";
            this.btnReCreate.Size = new System.Drawing.Size(75, 23);
            this.btnReCreate.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnReCreate.TabIndex = 6;
            this.btnReCreate.Text = "测试读取";
            this.btnReCreate.Click += new System.EventHandler(this.btnReCreate_Click);
            // 
            // cbxLicenceType
            // 
            this.cbxLicenceType.DisplayMember = "Text";
            this.cbxLicenceType.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbxLicenceType.FormattingEnabled = true;
            this.cbxLicenceType.ItemHeight = 15;
            this.cbxLicenceType.Items.AddRange(new object[] {
            this.comboItem5,
            this.comboItem6,
            this.comboItem7});
            this.cbxLicenceType.Location = new System.Drawing.Point(97, 65);
            this.cbxLicenceType.Name = "cbxLicenceType";
            this.cbxLicenceType.Size = new System.Drawing.Size(147, 21);
            this.cbxLicenceType.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.cbxLicenceType.TabIndex = 0;
            // 
            // comboItem5
            // 
            this.comboItem5.Text = "Ip";
            // 
            // comboItem6
            // 
            this.comboItem6.Text = "Mac";
            // 
            // comboItem7
            // 
            this.comboItem7.Text = "IpMac";
            // 
            // btnCreateMCode
            // 
            this.btnCreateMCode.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnCreateMCode.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnCreateMCode.Location = new System.Drawing.Point(169, 168);
            this.btnCreateMCode.Name = "btnCreateMCode";
            this.btnCreateMCode.Size = new System.Drawing.Size(75, 23);
            this.btnCreateMCode.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnCreateMCode.TabIndex = 6;
            this.btnCreateMCode.Text = "生成机器码";
            this.btnCreateMCode.Click += new System.EventHandler(this.btnCreateMCode_Click);
            // 
            // labelX8
            // 
            // 
            // 
            // 
            this.labelX8.BackgroundStyle.Class = "";
            this.labelX8.Location = new System.Drawing.Point(23, 65);
            this.labelX8.Name = "labelX8";
            this.labelX8.Size = new System.Drawing.Size(68, 21);
            this.labelX8.TabIndex = 1;
            this.labelX8.Text = "加密类型：";
            // 
            // btnSavePath
            // 
            this.btnSavePath.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnSavePath.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnSavePath.Location = new System.Drawing.Point(23, 341);
            this.btnSavePath.Name = "btnSavePath";
            this.btnSavePath.Size = new System.Drawing.Size(75, 23);
            this.btnSavePath.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnSavePath.TabIndex = 6;
            this.btnSavePath.Text = "存放路径";
            this.btnSavePath.Click += new System.EventHandler(this.btnSavePath_Click);
            // 
            // btnCreate
            // 
            this.btnCreate.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnCreate.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnCreate.Location = new System.Drawing.Point(23, 434);
            this.btnCreate.Name = "btnCreate";
            this.btnCreate.Size = new System.Drawing.Size(75, 23);
            this.btnCreate.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnCreate.TabIndex = 6;
            this.btnCreate.Text = "生成授权码";
            this.btnCreate.Click += new System.EventHandler(this.btnCreate_Click);
            // 
            // txtDate
            // 
            // 
            // 
            // 
            this.txtDate.BackgroundStyle.Class = "DateTimeInputBackground";
            this.txtDate.ButtonDropDown.Shortcut = DevComponents.DotNetBar.eShortcut.AltDown;
            this.txtDate.ButtonDropDown.Visible = true;
            this.txtDate.Location = new System.Drawing.Point(97, 286);
            // 
            // 
            // 
            this.txtDate.MonthCalendar.AnnuallyMarkedDates = new System.DateTime[0];
            // 
            // 
            // 
            this.txtDate.MonthCalendar.BackgroundStyle.BackColor = System.Drawing.SystemColors.Window;
            this.txtDate.MonthCalendar.BackgroundStyle.Class = "";
            this.txtDate.MonthCalendar.ClearButtonVisible = true;
            // 
            // 
            // 
            this.txtDate.MonthCalendar.CommandsBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground2;
            this.txtDate.MonthCalendar.CommandsBackgroundStyle.BackColorGradientAngle = 90;
            this.txtDate.MonthCalendar.CommandsBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground;
            this.txtDate.MonthCalendar.CommandsBackgroundStyle.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.txtDate.MonthCalendar.CommandsBackgroundStyle.BorderTopColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarDockedBorder;
            this.txtDate.MonthCalendar.CommandsBackgroundStyle.BorderTopWidth = 1;
            this.txtDate.MonthCalendar.CommandsBackgroundStyle.Class = "";
            this.txtDate.MonthCalendar.DisplayMonth = new System.DateTime(2018, 1, 1, 0, 0, 0, 0);
            this.txtDate.MonthCalendar.MarkedDates = new System.DateTime[0];
            this.txtDate.MonthCalendar.MonthlyMarkedDates = new System.DateTime[0];
            // 
            // 
            // 
            this.txtDate.MonthCalendar.NavigationBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2;
            this.txtDate.MonthCalendar.NavigationBackgroundStyle.BackColorGradientAngle = 90;
            this.txtDate.MonthCalendar.NavigationBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground;
            this.txtDate.MonthCalendar.NavigationBackgroundStyle.Class = "";
            this.txtDate.MonthCalendar.TodayButtonVisible = true;
            this.txtDate.MonthCalendar.WeeklyMarkedDays = new System.DayOfWeek[0];
            this.txtDate.Name = "txtDate";
            this.txtDate.Size = new System.Drawing.Size(147, 21);
            this.txtDate.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.txtDate.TabIndex = 5;
            // 
            // txtUserNum
            // 
            // 
            // 
            // 
            this.txtUserNum.BackgroundStyle.Class = "DateTimeInputBackground";
            this.txtUserNum.ButtonFreeText.Shortcut = DevComponents.DotNetBar.eShortcut.F2;
            this.txtUserNum.Location = new System.Drawing.Point(97, 233);
            this.txtUserNum.Name = "txtUserNum";
            this.txtUserNum.ShowUpDown = true;
            this.txtUserNum.Size = new System.Drawing.Size(147, 21);
            this.txtUserNum.TabIndex = 4;
            // 
            // chkAllData
            // 
            // 
            // 
            // 
            this.chkAllData.BackgroundStyle.Class = "";
            this.chkAllData.Location = new System.Drawing.Point(97, 314);
            this.chkAllData.Name = "chkAllData";
            this.chkAllData.Size = new System.Drawing.Size(100, 21);
            this.chkAllData.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.chkAllData.TabIndex = 3;
            this.chkAllData.Text = "不限使用时长";
            // 
            // chkAllUser
            // 
            // 
            // 
            // 
            this.chkAllUser.BackgroundStyle.Class = "";
            this.chkAllUser.Location = new System.Drawing.Point(97, 260);
            this.chkAllUser.Name = "chkAllUser";
            this.chkAllUser.Size = new System.Drawing.Size(100, 21);
            this.chkAllUser.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.chkAllUser.TabIndex = 3;
            this.chkAllUser.Text = "不限用户数";
            // 
            // labelX5
            // 
            // 
            // 
            // 
            this.labelX5.BackgroundStyle.Class = "";
            this.labelX5.Location = new System.Drawing.Point(23, 287);
            this.labelX5.Name = "labelX5";
            this.labelX5.Size = new System.Drawing.Size(68, 21);
            this.labelX5.TabIndex = 1;
            this.labelX5.Text = "到期日期：";
            // 
            // labelX4
            // 
            // 
            // 
            // 
            this.labelX4.BackgroundStyle.Class = "";
            this.labelX4.Location = new System.Drawing.Point(23, 233);
            this.labelX4.Name = "labelX4";
            this.labelX4.Size = new System.Drawing.Size(68, 21);
            this.labelX4.TabIndex = 1;
            this.labelX4.Text = "用户数：";
            // 
            // txtMCode
            // 
            // 
            // 
            // 
            this.txtMCode.Border.Class = "TextBoxBorder";
            this.txtMCode.Location = new System.Drawing.Point(97, 201);
            this.txtMCode.Name = "txtMCode";
            this.txtMCode.Size = new System.Drawing.Size(147, 21);
            this.txtMCode.TabIndex = 2;
            // 
            // labelX6
            // 
            // 
            // 
            // 
            this.labelX6.BackgroundStyle.Class = "";
            this.labelX6.Location = new System.Drawing.Point(23, 201);
            this.labelX6.Name = "labelX6";
            this.labelX6.Size = new System.Drawing.Size(68, 21);
            this.labelX6.TabIndex = 1;
            this.labelX6.Text = "机器码：";
            // 
            // txtMac
            // 
            // 
            // 
            // 
            this.txtMac.Border.Class = "TextBoxBorder";
            this.txtMac.Location = new System.Drawing.Point(97, 134);
            this.txtMac.Name = "txtMac";
            this.txtMac.Size = new System.Drawing.Size(147, 21);
            this.txtMac.TabIndex = 2;
            // 
            // labelX3
            // 
            // 
            // 
            // 
            this.labelX3.BackgroundStyle.Class = "";
            this.labelX3.Location = new System.Drawing.Point(23, 134);
            this.labelX3.Name = "labelX3";
            this.labelX3.Size = new System.Drawing.Size(68, 21);
            this.labelX3.TabIndex = 1;
            this.labelX3.Text = "Mac地址：";
            // 
            // txtIp
            // 
            // 
            // 
            // 
            this.txtIp.Border.Class = "TextBoxBorder";
            this.txtIp.Location = new System.Drawing.Point(97, 102);
            this.txtIp.Name = "txtIp";
            this.txtIp.Size = new System.Drawing.Size(147, 21);
            this.txtIp.TabIndex = 2;
            // 
            // labelX2
            // 
            // 
            // 
            // 
            this.labelX2.BackgroundStyle.Class = "";
            this.labelX2.Location = new System.Drawing.Point(23, 102);
            this.labelX2.Name = "labelX2";
            this.labelX2.Size = new System.Drawing.Size(68, 21);
            this.labelX2.TabIndex = 1;
            this.labelX2.Text = "Ip地址：";
            // 
            // buttonX2
            // 
            this.buttonX2.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.buttonX2.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.buttonX2.Location = new System.Drawing.Point(416, 16);
            this.buttonX2.Name = "buttonX2";
            this.buttonX2.Size = new System.Drawing.Size(75, 23);
            this.buttonX2.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.buttonX2.TabIndex = 1;
            this.buttonX2.Text = "检索";
            // 
            // gridLicence
            // 
            this.gridLicence.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridLicence.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.授权类型,
            this.机器码,
            this.用户数,
            this.到期时间,
            this.授权内容});
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.gridLicence.DefaultCellStyle = dataGridViewCellStyle1;
            this.gridLicence.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(215)))), ((int)(((byte)(229)))));
            this.gridLicence.Location = new System.Drawing.Point(4, 57);
            this.gridLicence.Name = "gridLicence";
            this.gridLicence.RowTemplate.Height = 23;
            this.gridLicence.Size = new System.Drawing.Size(523, 446);
            this.gridLicence.TabIndex = 0;
            // 
            // 授权类型
            // 
            this.授权类型.HeaderText = "授权类型";
            this.授权类型.Name = "授权类型";
            // 
            // 机器码
            // 
            this.机器码.HeaderText = "机器码";
            this.机器码.Name = "机器码";
            // 
            // 用户数
            // 
            this.用户数.HeaderText = "用户数";
            this.用户数.Name = "用户数";
            // 
            // 到期时间
            // 
            this.到期时间.HeaderText = "到期时间";
            this.到期时间.Name = "到期时间";
            // 
            // 授权内容
            // 
            this.授权内容.HeaderText = "授权内容";
            this.授权内容.Name = "授权内容";
            // 
            // txtQueryMCode
            // 
            // 
            // 
            // 
            this.txtQueryMCode.Border.Class = "TextBoxBorder";
            this.txtQueryMCode.Location = new System.Drawing.Point(67, 17);
            this.txtQueryMCode.Name = "txtQueryMCode";
            this.txtQueryMCode.Size = new System.Drawing.Size(133, 21);
            this.txtQueryMCode.TabIndex = 2;
            // 
            // labelX7
            // 
            // 
            // 
            // 
            this.labelX7.BackgroundStyle.Class = "";
            this.labelX7.Location = new System.Drawing.Point(10, 17);
            this.labelX7.Name = "labelX7";
            this.labelX7.Size = new System.Drawing.Size(68, 21);
            this.labelX7.TabIndex = 1;
            this.labelX7.Text = "机器码：";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(194)))), ((int)(((byte)(217)))), ((int)(((byte)(247)))));
            this.ClientSize = new System.Drawing.Size(800, 530);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "主界面";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.txtDate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtUserNum)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridLicence)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem 关于ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem MenuItemHelp;
        private System.Windows.Forms.ToolStripMenuItem menuReturn;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private DevComponents.DotNetBar.Controls.TextBoxX txtIp;
        private DevComponents.DotNetBar.LabelX labelX2;
        private DevComponents.DotNetBar.LabelX labelX5;
        private DevComponents.DotNetBar.LabelX labelX4;
        private DevComponents.DotNetBar.Controls.TextBoxX txtMac;
        private DevComponents.DotNetBar.LabelX labelX3;
        private DevComponents.DotNetBar.Controls.CheckBoxX chkAllData;
        private DevComponents.DotNetBar.Controls.CheckBoxX chkAllUser;
        private DevComponents.DotNetBar.Controls.DataGridViewX gridLicence;
        private DevComponents.Editors.IntegerInput txtUserNum;
        private DevComponents.Editors.DateTimeAdv.DateTimeInput txtDate;
        private DevComponents.DotNetBar.ButtonX btnCreate;
        private DevComponents.DotNetBar.ButtonX btnReCreate;
        private DevComponents.DotNetBar.ButtonX btnSavePath;
        private DevComponents.DotNetBar.Controls.TextBoxX lblSavePath;
        private DevComponents.DotNetBar.Controls.TextBoxX txtMCode;
        private DevComponents.DotNetBar.LabelX labelX6;
        private DevComponents.DotNetBar.ButtonX btnCreateMCode;
        private System.Windows.Forms.DataGridViewTextBoxColumn 授权类型;
        private System.Windows.Forms.DataGridViewTextBoxColumn 机器码;
        private System.Windows.Forms.DataGridViewTextBoxColumn 用户数;
        private System.Windows.Forms.DataGridViewTextBoxColumn 到期时间;
        private System.Windows.Forms.DataGridViewTextBoxColumn 授权内容;
        private DevComponents.DotNetBar.ButtonX buttonX2;
        private DevComponents.DotNetBar.Controls.ComboBoxEx cbxLicenceType;
        private DevComponents.Editors.ComboItem comboItem5;
        private DevComponents.Editors.ComboItem comboItem6;
        private DevComponents.Editors.ComboItem comboItem7;
        private DevComponents.DotNetBar.LabelX labelX8;
        private DevComponents.DotNetBar.Controls.TextBoxX txtQueryMCode;
        private DevComponents.DotNetBar.LabelX labelX7;
        private DevComponents.DotNetBar.LabelX labelX1;

    }
}