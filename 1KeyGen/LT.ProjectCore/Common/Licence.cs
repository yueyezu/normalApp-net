/**
* Title:
* Author: yueye
* Date: 2018/1/15 16:38:38
* Desp:
*/

using System;
using System.IO;
using LT.Code;

namespace LT.ProjectCore
{
    public class Licence
    {

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

        #region 认证码生成

        /// <summary>
        /// 生成认证码内容
        /// </summary>
        /// <returns></returns>
        public string CreateLicence(LicenceModel model)
        {
            string datePart = model.AllData.ToString().ToLower() + "|" + Ext.GetUnixTime(model.Date);
            string userNumPart = model.AllUser.ToString().ToLower() + "|" + model.UserNum;
            string oStr = model.MCode + "&" + datePart + "&" + userNumPart;
            string licenceStr = RSAEncryptExt.EncryptString(oStr, model.PrivateKey);
            licenceStr = Base64Encrypt.Encrypt(licenceStr);
            return licenceStr;
        }

        /// <summary>
        /// 根据文件路径，创建Lisence文件
        /// </summary>
        /// <param name="model">授权的所有信息</param>
        /// <param name="savePath">授权文件保存的路径</param>
        /// <returns></returns>
        public string CreateLicsenceFile(LicenceModel model, string savePath)
        {
            FileHelper.CreateDirectory(savePath);
            string fileName = savePath + "\\Licence.lic";

            using (FileStream files = new FileStream(fileName, FileMode.OpenOrCreate))
            {
                using (StreamWriter writer = new StreamWriter(files))
                {
                    writer.WriteLine(AESEncrypt.Encrypt(model.LicenceType.ToString()));
                    writer.WriteLine(AESEncrypt.Encrypt(model.PublicKey));
                    writer.WriteLine(model.Licence);
                }
            }

            return savePath;
        }

        #endregion

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
            LicenceModel model = new LicenceModel();
            using (FileStream filestrem = new FileStream(filePath, FileMode.Open))
            {
                using (StreamReader reader = new StreamReader(filestrem))
                {
                    string typeStr = AESEncrypt.Decrypt(reader.ReadLine());
                    model.LicenceType = (LicenseTypeEnum)Enum.Parse(typeof(LicenseTypeEnum), typeStr, true);
                    string keyStr = reader.ReadLine();
                    model.PublicKey = AESEncrypt.Decrypt(keyStr);
                    model.Licence = reader.ReadLine();
                }
            }

            string licenceStr = Base64Encrypt.Decrypt(model.Licence);
            string oStr = RSAEncryptExt.DecryptString(licenceStr, model.PublicKey);

            string[] tempStrs = oStr.Split('&');
            model.MCode = tempStrs[0];

            if (model.MCode != CreateMCode(model.LicenceType))
            {
                throw new CustomException("授权验证失败,机器码验证错误!");
            }

            string[] dateStrs = tempStrs[1].Split('|');
            model.AllData = dateStrs[0] == "true";
            model.Date = Ext.UnixTimeToTime(dateStrs[1]);
            string[] userNumStrs = tempStrs[2].Split('|');
            model.AllUser = userNumStrs[0] == "true";
            model.UserNum = Convert.ToInt32(userNumStrs[1]);

            return model;
        }
    }
}
