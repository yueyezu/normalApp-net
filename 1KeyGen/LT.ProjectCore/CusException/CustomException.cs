using System;

namespace LT.ProjectCore
{
    /// <summary>
    /// 自定义异常
    /// </summary>
    public class CustomException : Exception
    {
        public CustomException() { }

        public CustomException(string message)
            : base(message)
        {

        }
    }
}
