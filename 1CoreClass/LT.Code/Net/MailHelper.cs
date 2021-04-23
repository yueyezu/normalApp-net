/**
* Title: 邮件发送的类，包括CC、附件
* Author: yueye
* Date: 2018-09-18
* Desp: 
*/

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Mail;

namespace LT.Code
{
    /// <summary>
    /// SendMail 的摘要说明
    /// </summary>
    public class MailHelper
    {
        private string fromName;
        private string fromPwd;
        private string fromDisplayName;
        private string host;
        private int prot;

        #region 初始化方法

        /// <summary>
        /// 发送邮件对象初始化
        /// </summary>
        /// <param name="fromName">发送邮箱名称</param>
        /// <param name="fromPwd">发送密码</param>
        /// <param name="fromDisplayName">显示名称</param>
        /// <param name="host">服务器地址</param>
        /// <param name="port">服务器断开号</param>
        public MailHelper(string fromName, string fromPwd, string fromDisplayName, string host, int port)
        {
            this.fromDisplayName = fromDisplayName;
            this.fromName = fromName;
            this.fromPwd = fromPwd;
            this.host = host;
            prot = port;
        }

        /// <summary>
        /// 根据邮箱发送字符串，初始化对象
        /// 字符串形式：host=smtp.qq.com;port=25;fromName=12345@qq.com;fromPwd=12312;displayName=asd
        /// </summary>
        /// <param name="fromString"></param>
        public MailHelper(string fromString)
        {
            Hashtable fromSets = GetConnStrs(fromString);
            host = fromSets["host"].ToString();
            if (fromSets.ContainsKey("port"))
            {
                prot = (int)fromSets["port"];
            }
            fromName = fromSets["fromName"].ToString();
            fromPwd = fromSets["fromPwd"].ToString();

            if (fromSets.ContainsKey("displayName"))
            {
                fromDisplayName = fromSets["displayName"].ToString();
            }
        }

        /// <summary>
        /// 对字符串进行拆分
        /// 字符串形式：host=smtp.qq.com;port=25;fromName=12345@qq.com;fromPwd=12312;displayName=asd
        /// </summary>
        /// <param name="connStr"></param>
        private Hashtable GetConnStrs(string connStr)
        {
            Hashtable hash = new Hashtable();
            string[] tempStrs = connStr.Split(';');
            foreach (string tempStr in tempStrs)
            {
                string[] temp = tempStr.Split('=');
                hash.Add(temp[0].Trim(), temp[1].Trim());
            }

            return hash;
        }

        #endregion

        /// <summary>
        /// 发送邮件，给单个人
        /// </summary>
        /// <param name="toMail">发送的邮箱</param>
        /// <param name="displayName">显示名称</param>
        /// <param name="subject">标题</param>
        /// <param name="content">内容</param>
        /// <returns></returns>
        public bool Send(string toMail, string displayName, string subject, string content)
        {
            Dictionary<string, string> toMails = new Dictionary<string, string>();
            toMails.Add(toMail, displayName);

            return Send(toMails, subject, content);
        }

        /// <summary>
        /// 发送邮件
        /// </summary>
        /// <param name="toMails">发送的邮箱，key为邮箱名，value为显示名</param>
        /// <param name="subject">邮件标题</param>
        /// <param name="content">邮件内容</param>
        public bool Send(Dictionary<string, string> toMails, string subject, string content)
        {
            bool result = false;
            MailMessage mail = new MailMessage();
            string displatName = string.IsNullOrEmpty(fromDisplayName) ? null : fromDisplayName;
            mail.From = new MailAddress(fromName, displatName); //邮件的发件人
            foreach (KeyValuePair<string, string> keyValuePair in toMails)
            {
                displatName = string.IsNullOrEmpty(keyValuePair.Value) ? null : keyValuePair.Value;
                mail.To.Add(new MailAddress(keyValuePair.Key, displatName));
            }
            mail.Subject = subject;
            mail.Body = content;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.Normal;
            mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess;

            return Send(mail);
        }

        /// <summary>
        /// 发送邮件，带有抄送，带有附件
        /// </summary>
        /// <param name="toMails">发送的邮箱，key为邮箱名，value为显示名</param>
        /// <param name="subject">邮件标题</param>
        /// <param name="content">邮件内容</param>
        /// <param name="ccMails">抄送人</param>
        /// <param name="files">附件路径，本地物理路径</param>
        public bool Send(Dictionary<string, string> toMails, string subject, string content, Dictionary<string, string> ccMails, List<string> files)
        {
            MailMessage mail = new MailMessage();
            string displatName = string.IsNullOrEmpty(fromDisplayName) ? null : fromDisplayName;
            mail.From = new MailAddress(fromName, displatName); //邮件的发件人
            foreach (KeyValuePair<string, string> keyValuePair in toMails)  //收件人
            {
                displatName = string.IsNullOrEmpty(keyValuePair.Value) ? null : keyValuePair.Value;
                mail.To.Add(new MailAddress(keyValuePair.Key, displatName));
            }
            if (ccMails != null && ccMails.Count > 0)
            {
                foreach (KeyValuePair<string, string> keyValuePair in ccMails)   //抄送人
                {
                    displatName = string.IsNullOrEmpty(keyValuePair.Value) ? null : keyValuePair.Value;
                    mail.CC.Add(new MailAddress(keyValuePair.Key, displatName));
                }
            }
            mail.Subject = subject;
            mail.Body = content;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            if (files != null && files.Count > 0)
            {
                foreach (string filePath in files)  //附件
                {
                    mail.Attachments.Add(new Attachment(filePath));
                }
            }
            mail.Priority = MailPriority.Normal;
            mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess;

            return Send(mail);
        }

        /// <summary>
        /// 发送邮件
        /// </summary>
        /// <param name="mail"></param>
        public bool Send(MailMessage mail)
        {
            SmtpClient client = new SmtpClient();
            client.Host = host;
            if (prot != 0)
            {
                client.Port = prot;
            }
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential(fromName, fromPwd);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;

            try
            {
                client.Send(mail);
            }
            catch (Exception e)
            {
                throw e;
            }
            return true;
        }
    }
}