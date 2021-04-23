/**
* Title: 自定义异常类
* Author: yueye
* Date: long long ago
* Desp: 使用自定义的异常，在进行复杂点的处理时，可以与系统异常区分来进行处理，便于对于后台不同结果，采取不同返回内容。
*/
using System;

namespace LT.Core
{
    /// <summary>
    /// 表示要反馈给客户端的异常
    /// </summary>
    public class CustomException : Exception
    {
        public CustomException()
        {

        }

        public CustomException(string message)
            : base(message)
        {

        }

        public CustomException(string msg, Exception innerException)
            : base(msg, innerException)
        {
        }
    }
}
