/**
* Title: JsonRPC协议格式的定义
 * todo yueye 未使用到，留作参考吧
* Author: yueye
* Date: 2017/12/29 17:10:00
* Desp:
*/

namespace LT.Core
{
    public class JsonRpcError
    {
        public string code { get; set; }
        public string message { get; set; }
        public string data { get; set; }
    }

    public class JsonRpcResult
    {
        public string jsonrpc
        {
            get { return "2.0"; }
            set { }
        }
        public int id { get; set; }
        public object result { get; set; }
        public JsonRpcError error { get; set; }
    }
}
