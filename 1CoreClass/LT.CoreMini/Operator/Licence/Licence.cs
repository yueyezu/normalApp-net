/**
* Title:
* Author: yueye
* Date: 2018/1/15 16:38:38
* Desp:
*/

using System;
using System.IO;
using LT.Code;

namespace LT.Core
{
    public class Licence
    {
        private static LicenceModel licenceObj = null;
        private static string mCode = "";

        /// <summary>
        /// 获取当前licence的单例
        /// </summary>
        /// <returns></returns>
        public static Licence Target
        {
            get { return new Licence(); }
        }

        #region 授权认证相关的处理

        /// <summary>
        /// 对授权情况进行检测，并进行判定。
        /// </summary>
        /// <returns></returns>
        public string PageCheckLicence()
        {
            if (string.IsNullOrEmpty(mCode))    //认证之前对系统的机器码进行获取
            {
                mCode = CreateMCode(licenceObj.LicenceType);
            }

            if (licenceObj.MCode != mCode)
            {
                return "授权验证失败,机器码验证错误!";
            }
            if (!licenceObj.AllData)
            {
                if (DateTime.Compare(DateTime.Now, licenceObj.Date) > 0)
                {
                    return "授权已经过期，到期时间：" + licenceObj.Date.ToString("yyyy-MM-dd");
                }
            }

            return "true";
        }

        /// <summary>
        /// 登录时对授权的校验，主要是提示授权即将到期，登录用户过多等。
        /// 其中对于授权到期的认证也会存在。
        /// </summary>
        /// <returns></returns>
        public bool LoginCheckLicence(out string msg)
        {
            //1、 验证授权文件无误
            if (licenceObj == null)
            {
                msg = "授权码丢失或授权文件解析失败。";
                return false;
            }
            //2、 验证是否到期或者机器码不对,如果未到期，且机器正确，则往下执行
            msg = PageCheckLicence();
            if (msg != "true")
            {
                return false;
            }
            //3、 验证用户数量是否一致？
            if (!licenceObj.AllUser)
            {
                if (OperatorProvider.GetAllOnlineUser() > licenceObj.UserNum)
                {
                    msg = "当前登录用户过多";
                    return false;
                }
            }
            //4、 验证授权即将到期
            if (!licenceObj.AllData)
            {
                if (DateTime.Compare(DateTime.Now.AddDays(15), licenceObj.Date) > 0)
                {
                    msg = "授权即将到期，到期时间：" + licenceObj.Date.ToString("yyyy-MM-dd");
                    return true;
                }
            }
            msg = "true";
            return true;
        }

        #endregion

        #region 机器码生成相关操作

        /// <summary>
        /// 根据机器的IP与Mac地址信息生成机器码
        /// 根据不同的授权类型传入不同的值即可。
        /// </summary>
        /// <param name="ipStr">Ip的字符串</param>
        /// <param name="macStr">Mac地址的字符串</param>
        /// <param name="lisenceType">授权类型</param>
        /// <returns></returns>
        public string CreateMCode(string ipStr, string macStr, LicenseTypeEnum lisenceType)
        {
            //根据不同的授权类型，进行不同的判定
            switch (lisenceType)
            {
                case LicenseTypeEnum.Ip:
                    macStr = "notwhitmac";
                    break;
                case LicenseTypeEnum.Mac:
                    ipStr = "notwhitip";
                    break;
                default:
                    ipStr = ipStr ?? "notwhitip"; ;
                    macStr = macStr ?? "notwhitmac";
                    break;
            }

            string mCode = "";
            mCode = DESEncrypt.Encrypt(macStr, ipStr);
            mCode = MD5Encrypt.GetMD5_16(mCode);
            mCode = Base64Encrypt.Encrypt(mCode);
            return mCode;
        }

        /// <summary>
        /// 生成本机的机器码
        /// </summary>
        /// <param name="lisenceType">授权类型</param>
        /// <returns></returns>
        public string CreateMCode(LicenseTypeEnum lisenceType)
        {
            string ipStr = SystemHelper.GetLanIp();
            string macStr = SystemHelper.GetMacByWMI();
            return CreateMCode(ipStr, macStr, lisenceType);
        }

        #endregion

        #region 解析授权文件的操作

        /// <summary>
        /// 解析授权文件获取到授权信息
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public LicenceModel GetLicenceModel(string filePath)
        {
            if (!FileHelper.IsExistFile(filePath))
            {
                throw new CustomException("未找到授权文件!");
            }

            licenceObj = new LicenceModel();
            using (FileStream filestrem = new FileStream(filePath, FileMode.Open))
            {
                using (StreamReader reader = new StreamReader(filestrem))
                {
                    string typeStr = AESEncrypt.Decrypt(reader.ReadLine());
                    licenceObj.LicenceType = (LicenseTypeEnum)Enum.Parse(typeof(LicenseTypeEnum), typeStr, true);
                    string keyStr = reader.ReadLine();
                    licenceObj.PublicKey = AESEncrypt.Decrypt(keyStr);
                    licenceObj.Licence = reader.ReadLine();
                }
            }

            string licenceStr = Base64Encrypt.Decrypt(licenceObj.Licence);
            string oStr = RSAEncryptExt.DecryptString(licenceStr, licenceObj.PublicKey);

            string[] tempStrs = oStr.Split('&');
            licenceObj.MCode = tempStrs[0];

            string[] dateStrs = tempStrs[1].Split('|');
            licenceObj.AllData = dateStrs[0] == "true";
            licenceObj.Date = Ext.UnixTimeToTime(dateStrs[1]);
            string[] userNumStrs = tempStrs[2].Split('|');
            licenceObj.AllUser = userNumStrs[0] == "true";
            licenceObj.UserNum = Convert.ToInt32(userNumStrs[1]);

            return licenceObj;
        }

        #endregion
    }
}
