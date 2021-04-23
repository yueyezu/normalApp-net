/**
* 函数名称：Soap操作
* 使用方法如下：
* String url = "http://localhost:11528/FlowEngine.asmx";
* String soapAction = "http://tempuri.org/ProcessFlowRequest";
* Dictionary<String,String> dic = new Dictionary<String,String>();
* dic.Add("requestXml","{'Head': { 'MethodCode': 'M1001', 'Security': { 'Token': ''}},'Body': { 'FlowID': 'ca0a9a91-bb13-4717-8590-d9258f5c292f'}}")
* Object ob = soapClient.GetResult(url,soapAction,dic);
**/

using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace LT.Code
{
    /// <summary>
    /// SOAP辅助类
    /// </summary>
    public class SoapHelper
    {
        /// <summary>
        /// 获取返回结果
        /// </summary>
        /// <returns>返回值</returns>
        public static object GetResult(string uriString, String soapAction, Dictionary<string, string> arguments)
        {
            // 获取响应
            var webResponse = GetResponse(uriString, soapAction, arguments);
            if (webResponse == null) return null;

            var xmlReader = XmlReader.Create(webResponse.GetResponseStream());
            var xmlDocument = new XmlDocument();

            // 加载响应XML
            xmlDocument.Load(xmlReader);

            var nsmgr = new XmlNamespaceManager(xmlDocument.NameTable);
            nsmgr.AddNamespace("soap", "http://schemas.xmlsoap.org/soap/envelope/");

            var bodyNode = xmlDocument.SelectSingleNode("soap:Envelope/soap:Body", nsmgr);

            if (bodyNode != null && bodyNode.FirstChild.HasChildNodes)
                return bodyNode.FirstChild.FirstChild.InnerXml;

            return null;
        }

        /// <summary>
        /// 获取响应
        /// </summary>
        /// <returns>响应</returns>
        public static WebResponse GetResponse(string uriString, string soapAction, Dictionary<string, string> arguments)
        {
            Uri uri = new Uri(uriString);
            ICredentials credentials = CredentialCache.DefaultNetworkCredentials;

            var webRequest = (HttpWebRequest)WebRequest.Create(uri);
            webRequest.Headers.Add("SOAPAction", String.Format("\"{0}\"", soapAction));
            webRequest.ContentType = "text/xml;charset=\"utf-8\"";
            webRequest.Accept = "text/xml";
            webRequest.Method = "POST";
            webRequest.Credentials = credentials;

            // 写入请求SOAP信息
            using (var requestStream = webRequest.GetRequestStream())
            {
                using (var textWriter = new StreamWriter(requestStream))
                {
                    var envelope = MakeEnvelope(soapAction, arguments);

                    if (!string.IsNullOrEmpty(envelope))
                        textWriter.Write(envelope);
                }
            }

            // 获取SOAP请求返回
            return webRequest.GetResponse();
        }



        /// <summary>
        /// 消息体格式
        /// </summary>
        private const string FormatEnvelope = @"<?xml version='1.0' encoding='utf-8'?>
                <soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>
                  <soap:Body>
                    <{0} xmlns='{1}'>{2}</{0}>
                  </soap:Body>
                </soap:Envelope>";

        /// <summary>
        /// 参数格式
        /// </summary>
        private const string FormatParameter = "<{0}>{1}</{0}>";

        /// <summary>
        /// 序列化
        /// </summary>
        /// <param name="soapAction">SOAP动作</param>
        /// <param name="soapParameters">参数集合</param>
        /// <returns>返回值</returns>
        public static string MakeEnvelope(string soapAction, Dictionary<string, string> soapParameters)
        {
            var index = soapAction.LastIndexOf(Path.AltDirectorySeparatorChar);
            var nameSpace = soapAction.Substring(0, index + 1);
            var methodName = soapAction.Substring(index + 1, soapAction.Length - index - 1);

            var buffer = new StringBuilder();
            foreach (var soapParameter in soapParameters)
            {
                var strContent = GetObjectContent(soapParameter.Value);
                buffer.AppendFormat(FormatParameter, soapParameter.Key, strContent);
            }

            return string.Format(FormatEnvelope, methodName, nameSpace, buffer);
        }

        /// <summary>
        /// 获取对象内容XML
        /// </summary>
        /// <param name="graph">图</param>
        /// <returns>对象内容XML</returns>
        public static string GetObjectContent(object graph)
        {
            using (var memoryStream = new MemoryStream())
            {
                var graphType = graph.GetType();
                var xmlSerializer = new XmlSerializer(graphType);

                // XML序列化
                xmlSerializer.Serialize(memoryStream, graph);

                // 获取对象XML
                var strContent = Encoding.UTF8.GetString(memoryStream.ToArray());
                var xmlDocument = new XmlDocument();
                xmlDocument.LoadXml(strContent);

                // 返回对象内容XML
                var contentNode = xmlDocument.SelectSingleNode(graphType.Name);

                return contentNode != null ? contentNode.InnerXml : graph.ToString();
            }
        }

        /// <summary>
        /// 获取名称空间
        /// </summary>
        /// <param name="soapAction">SOAP动作</param>
        /// <returns>名称空间</returns>
        public static string GetNameSpace(string soapAction)
        {
            var index = soapAction.LastIndexOf(Path.AltDirectorySeparatorChar);
            var nameSpace = soapAction.Substring(0, index + 1);

            return nameSpace;
        }

        /// <summary>
        /// 获取函数名称
        /// </summary>
        /// <param name="soapAction">SOAP动作</param>
        /// <returns>函数名称</returns>
        public static string GetMethodName(string soapAction)
        {
            var index = soapAction.LastIndexOf(Path.AltDirectorySeparatorChar);
            var methodName = soapAction.Substring(index + 1, soapAction.Length - index - 1);

            return methodName;
        }
    }
}
