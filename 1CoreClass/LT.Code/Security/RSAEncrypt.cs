using System;
using System.Security.Cryptography;
using System.Text;

namespace LT.Code
{
    /// <summary>
    /// �ǶԳƼ��ܡ����ܡ���֤������
    /// </summary>
    public class RSAEncrypt
    {
        /// <summary>
        /// �ǶԳƼ������ɵ�˽Կ�͹�Կ 
        /// </summary>
        /// <param name="privateKey">˽Կ</param>
        /// <param name="publicKey">��Կ</param>
        public static void GenerateRSAKey(out string privateKey, out string publicKey)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();
            privateKey = rsa.ToXmlString(true);
            publicKey = rsa.ToXmlString(false);
        }

        #region �ǶԳ����ݼ��ܣ���Կ���ܣ�

        /// <summary>
        /// �ǶԳƼ����ַ������ݣ����ؼ��ܺ������
        /// </summary>
        /// <param name="publicKey">��Կ</param>
        /// <param name="originalString">�����ܵ��ַ���</param>
        /// <returns>���ܺ������</returns>
        public static string Encrypt(string publicKey, string originalString)
        {
            byte[] PlainTextBArray;
            byte[] CypherTextBArray;
            string Result;
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();
            rsa.FromXmlString(publicKey);
            PlainTextBArray = (new UnicodeEncoding()).GetBytes(originalString);
            CypherTextBArray = rsa.Encrypt(PlainTextBArray, false);
            Result = Convert.ToBase64String(CypherTextBArray);
            return Result;
        }

        /// <summary>
        /// �ǶԳƼ����ֽ����飬���ؼ��ܺ������
        /// </summary>
        /// <param name="publicKey">��Կ</param>
        /// <param name="originalBytes">�����ܵ��ֽ�����</param>
        /// <returns>���ؼ��ܺ������</returns>
        public static string Encrypt(string publicKey, byte[] originalBytes)
        {
            byte[] CypherTextBArray;
            string Result;
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();
            rsa.FromXmlString(publicKey);
            CypherTextBArray = rsa.Encrypt(originalBytes, false);
            Result = Convert.ToBase64String(CypherTextBArray);
            return Result;
        }

        #endregion

        #region �ǶԳƽ��ܣ�˽Կ���ܣ�

        /// <summary>
        /// �ǶԳƽ����ַ��������ؽ��ܺ������
        /// </summary>
        /// <param name="privateKey">˽Կ</param>
        /// <param name="encryptedString">����������</param>
        /// <returns>���ؽ��ܺ������</returns>
        public static string Decrypt(string privateKey, string encryptedString)
        {
            byte[] PlainTextBArray;
            byte[] DypherTextBArray;
            string Result;
            System.Security.Cryptography.RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();
            rsa.FromXmlString(privateKey);
            PlainTextBArray = Convert.FromBase64String(encryptedString);
            DypherTextBArray = rsa.Decrypt(PlainTextBArray, false);
            Result = (new UnicodeEncoding()).GetString(DypherTextBArray);
            return Result;
        }

        /// <summary>
        /// �ǶԳƽ����ֽ����飬���ؽ��ܺ������
        /// </summary>
        /// <param name="privateKey">˽Կ</param>
        /// <param name="encryptedBytes">����������</param>
        /// <returns></returns>
        public static string Decrypt(string privateKey, byte[] encryptedBytes)
        {
            byte[] DypherTextBArray;
            string Result;
            System.Security.Cryptography.RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();
            rsa.FromXmlString(privateKey);
            DypherTextBArray = rsa.Decrypt(encryptedBytes, false);
            Result = (new UnicodeEncoding()).GetString(DypherTextBArray);
            return Result;
        }
        #endregion

        #region �ǶԳƼ���ǩ������֤

        /// <summary>
        /// ʹ�÷ǶԳƼ���ǩ������
        /// </summary>
        /// <param name="privateKey">˽Կ</param>
        /// <param name="originalString">�����ܵ��ַ���</param>
        /// <returns>���ܺ������</returns>
        public static string EncrypSignature(string privateKey, string originalString)
        {
            string signature;
            using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
            {
                rsa.FromXmlString(privateKey); //˽Կ
                // ���ܶ��� 
                RSAPKCS1SignatureFormatter f = new RSAPKCS1SignatureFormatter(rsa);
                f.SetHashAlgorithm("SHA1");
                byte[] source = ASCIIEncoding.ASCII.GetBytes(originalString);
                SHA1Managed sha = new SHA1Managed();
                byte[] result = sha.ComputeHash(source);
                byte[] b = f.CreateSignature(result);
                signature = Convert.ToBase64String(b);
            }
            return signature;
        }

        ///// <summary>
        ///// ��˽Կ����ǩ�����ַ�����ʹ�ù�Կ���������֤
        ///// </summary>
        ///// <param name="originalString">δ���ܵ��ı����������</param>
        ///// <param name="encrytedString">���ܺ���ı�����ע�����к�</param>
        ///// <returns>�����֤�ɹ�����True������ΪFalse</returns>
        //public static bool Validate(string originalString, string encrytedString)
        //{
        //    return Validate(originalString, encrytedString, UIConstants.PublicKey);
        //}

        /// <summary>
        /// ��˽Կ���ܵ��ַ�����ʹ�ù�Կ���������֤
        /// </summary>
        /// <param name="originalString">δ���ܵ��ı����������</param>
        /// <param name="encrytedString">���ܺ���ı�����ע�����к�</param>
        /// <param name="publicKey">�ǶԳƼ��ܵĹ�Կ</param>
        /// <returns>�����֤�ɹ�����True������ΪFalse</returns>
        public static bool Validate(string originalString, string encrytedString, string publicKey)
        {
            bool bPassed = false;
            using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
            {
                try
                {
                    rsa.FromXmlString(publicKey); //��Կ
                    RSAPKCS1SignatureDeformatter formatter = new RSAPKCS1SignatureDeformatter(rsa);
                    formatter.SetHashAlgorithm("SHA1");

                    byte[] key = Convert.FromBase64String(encrytedString); //��֤
                    SHA1Managed sha = new SHA1Managed();
                    byte[] name = sha.ComputeHash(ASCIIEncoding.ASCII.GetBytes(originalString));
                    if (formatter.VerifySignature(name, key))
                    {
                        bPassed = true;
                    }
                }
                catch
                {
                }
            }
            return bPassed;
        }

        #endregion

    }
}