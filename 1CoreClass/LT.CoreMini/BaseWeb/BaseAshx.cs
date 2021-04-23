/**
* Title: 一般处理程序的基类
* Author: yueye
* Date: 2017/12/29 15:48:30
* Desp: 对于请求进行转换处理；定义前后台调用的规范；定义公共的方法。
 * 不建议直接集成，该类子类有：FormAshx，TreeAshx，FileAshx等，可以直接调用。
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.SessionState;
using LT.Code;

namespace LT.Core
{
    [CheckLogin(true)]
    public class BaseAshx : IHttpHandler, IRequiresSessionState
    {
        /// <summary>
        /// 日志输出的类
        /// </summary>
        protected Log MyLog
        {
            get { return LogFactory.GetLogger(this.GetType().ToString()); }
        }

        #region 后台请求的调度方法

        /// <summary>
        /// 默认访问方法，对所有方法进行调度
        /// </summary>
        /// <param name="context">请求参数</param>
        public void ProcessRequest(HttpContext context)
        {
            Type nowType = this.GetType(); //获取当前的最终的类
            context.Response.ContentType = "text/plain"; //默认为text的返回类型

            // 1、获取当前请求的方法名称
            string action = context.Request["action"];
            if (string.IsNullOrEmpty(action))
            {
                context.Response.Write(ErrorResult(JsonRpcErrorEnum.ParamError, "未找到action参数，请检查请求是否正常！"));
                return;
            }

            // 2、用户登录情况验证的方法
            if (CheckUserNoLogin(nowType, action, context.Response))
            {
                return;
            }

            // 3、反射，根据请求的action信息，获取需要执行的方法。
            MethodInfo method = nowType.GetMethod(action);
            if (method == null)
            {
                MyLog.Info("系统未找到需访问的方法：" + action);
                context.Response.Write(ErrorResult(JsonRpcErrorEnum.NotFindMethod, "找不到指定的方法！"));
                return;
            }

            try
            {
                // 4、执行对应的方法，获取相应的信息。
                //如果不需要在这里进行返回时，可以直接调用context进行返回，然后方法返回null即可
                string result = (string)method.Invoke(this, new object[] { context });
                if (result != null)
                {
                    context.Response.Write(result);
                }
            }
            catch (Exception ex)
            {
                BaseExceptionHandler(ex, context.Response);
            }
            finally
            {
                context.Response.End();
            }
        }

        /// <summary>
        /// 判断用户未登录或者登录被挤掉
        /// </summary>
        /// <param name="nowType">当前请求的处理类类型</param>
        /// <param name="action">当前亲你供求的方法</param>
        /// <param name="response">信息返回对象</param>
        /// <returns></returns>
        private bool CheckUserNoLogin(Type nowType, string action, HttpResponse response)
        {
            CheckLoginAttribute checkLoginAttr = (CheckLoginAttribute)Attribute.GetCustomAttribute(nowType, typeof(CheckLoginAttribute));
            //存在登录验证属性、且类标记为验证状态、且当前请求的方法不再屏蔽验证方法列表中时，进行验证。
            if (checkLoginAttr != null && checkLoginAttr.IsCheck && !checkLoginAttr.IgnoreFunction.Contains(action))
            {
                //判断当前的session中没用用户登录信息，标示用户未登录，直接调转到登录界面。
                if (OperatorProvider.Provider.GetCurrent() == null)
                {
                    RedirectResult(response, "/WebMaster/Login/Login.aspx");
                    return true;
                }
                //当前session在全局的session信息是否被强制下线验证，如果已经强制下线，则返回提示信息。
                if (OperatorProvider.CheckIsNoLogin())
                {
                    OperatorProvider.Provider.RemoveCurrent();
                    RedirectResult(response, "/WebMaster/Offline/offline.htm?msg=您的帐号在其他地方已登录，请重新登录！");
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// 基本类的异常统一处理的方法
        ///   ExceptionHandler方法也可以实现，但是比这个方法多一步判断，其性能消耗可以忽略，但是适用性更广了。
        ///   但是这里为了防止继承类集成修改了异常处理，影响该基类的异常处理，所以单独使用私有方法处理。
        /// </summary>
        /// <param name="ex"></param>
        /// <param name="response"></param>
        private void BaseExceptionHandler(Exception ex, HttpResponse response)
        {
            if (ex.InnerException != null)
            {
                //如果是用户自定义异常时，直接将对应的异常信息返回到前台即可。
                if (ex.InnerException is CustomException)
                {
                    response.Write(ErrorResult(JsonRpcErrorEnum.BusinessError, ex.InnerException.Message));
                }
                else
                {
                    MyLog.Error("执行异常：", ex.InnerException);
                    response.Write(ErrorResult(JsonRpcErrorEnum.ServerError, "请求出现异常:" + ex.InnerException.Message, ex.InnerException));
                }
            }
            else
            {
                MyLog.Error("执行异常：", ex);
                response.Write(ErrorResult(JsonRpcErrorEnum.ServerError, "请求出现异常:" + ex.Message, ex));
            }
        }

        #endregion

        #region 数据返回操作的定义

        /// <summary>
        /// jsonrcp定义的错误代码
        /// </summary>
        protected enum JsonRpcErrorEnum
        {
            /// <summary>
            /// 未找到相应方法
            /// </summary>
            NotFindMethod = -32601,

            /// <summary>
            /// 参数错误
            /// </summary>
            ParamError = -32602,

            /// <summary>
            /// 服务器错误
            /// </summary>
            ServerError = -32000,

            /// <summary>
            /// 添加失败
            /// </summary>
            AddError = -32001,

            /// <summary>
            /// 修改失败
            /// </summary>
            UpdateError = -32002,

            /// <summary>
            /// 删除失败
            /// </summary>
            DeleteError = -32003,

            /// <summary>
            /// 查询失败
            /// </summary>
            SearchError = -32004,

            /// <summary>
            /// 业务错误
            /// </summary>
            BusinessError = -32005,

            /// <summary>
            /// 未知错误
            /// </summary>
            UnknowError = -32099,
        }

        /// <summary>
        /// 错误编码对应的默认文本描述
        /// </summary>
        private Dictionary<JsonRpcErrorEnum, string> JsonRpcErrorMsg = new Dictionary<JsonRpcErrorEnum, string>()
        {
            {JsonRpcErrorEnum.NotFindMethod, "请求方法无效"},
            {JsonRpcErrorEnum.ParamError, "参数错误"},
            {JsonRpcErrorEnum.ServerError, "服务器错误"},
            {JsonRpcErrorEnum.AddError, "添加失败"},
            {JsonRpcErrorEnum.UpdateError, "修改失败"},
            {JsonRpcErrorEnum.DeleteError, "删除失败"},
            {JsonRpcErrorEnum.SearchError, "查询失败"},
            {JsonRpcErrorEnum.BusinessError, "业务错误"},
            {JsonRpcErrorEnum.UnknowError, "未知错误"}
        };

        /// <summary>
        /// 拼装执行成功时的json对象
        /// </summary>
        /// <param name="res">执行成功的结果</param>
        /// <param name="requestId">执行情况的id</param>
        /// <returns>
        /// json对象: { jsonrpc = "2.0", id = "", result = jsonResult }
        /// </returns>
        protected string SuccessResult(object res, string requestId = "")
        {
            return new { jsonrpc = 2.0, id = requestId, result = res }.ToJson();
        }

        /// <summary>
        /// 执行失败时返回的json信息
        /// </summary>
        /// <param name="error">错误代码,在枚举中已经设置好</param>
        /// <param name="ex"></param>
        /// <param name="msg">对于错误的提示信息</param>
        /// <param name="requestId">执行情况的id</param>
        /// <returns>
        /// 执行错误的json对象: { jsonrpc = 2.0, error = new { code = 102, message = "上传失败", data = exp.Message }, id = "" } 
        /// </returns>
        protected string ErrorResult(JsonRpcErrorEnum error, string msg = "", Exception ex = null,
            string requestId = "")
        {
            object obj = new
            {
                jsonrpc = 2.0,
                error = new
                {
                    code = (int)error,
                    message = msg == "" ? JsonRpcErrorMsg[error] : msg,
                    data = ex == null ? "" : ex.Message
                },
                id = requestId
            };

            return obj.ToJson();
        }

        /// <summary>
        /// 返回文件结果
        /// </summary>
        /// <param name="response"></param>
        /// <param name="fileBytes"></param>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string FileResult(HttpResponse response, byte[] fileBytes, string fileName)
        {
            response.ContentType = "application/octet-stream";
            response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            response.BinaryWrite(fileBytes);

            return null;
        }

        /// <summary>
        /// 异步请求，跳转的处理
        /// </summary>
        /// <param name="response"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        protected string RedirectResult(HttpResponse response, string path)
        {
            response.ContentType = "text/html";
            response.Write(new { jsonrpc = 2.0, id = "redirect", result = path }.ToJson());

            return null;
        }

        /// <summary>
        /// 正常信息的返回，对于传入的对象直接序列化成json格式
        /// </summary>
        /// <param name="res"></param>
        /// <returns></returns>
        protected string JsonResult(object res)
        {
            return res.ToJson();
        }

        /// <summary>
        /// 返回内容信息，只限于可修改为文本的内容
        /// </summary>
        /// <param name="res"></param>
        /// <returns></returns>
        protected string ContentResult(object res)
        {
            return res.ToString();
        }

        #endregion

        #region 操作日志输出的方法

        /// <summary>
        /// 添加系统日志
        /// </summary>
        /// <returns></returns>
        protected void AddSysLog(string optType, string optContent, string otherMsg = "")
        {
            Type t = this.GetType();
            FuncMsgAttribute funcMsg = (FuncMsgAttribute)Attribute.GetCustomAttribute(t, typeof(FuncMsgAttribute));

            BaseSysLogModel sysLogModel = new BaseSysLogModel();
            sysLogModel.F_OptType = optType;
            sysLogModel.F_OptContent = optContent;
            sysLogModel.F_OtherMsg = otherMsg;

            try
            {
                sysLogModel.F_System = Configs.GetSetting("systemFlag");
                if (funcMsg == null)
                {
                    sysLogModel.F_Module = "";
                    MyLog.Error("未配置该方法的FuncMsg信息：" + t.FullName);
                }
                else
                {
                    sysLogModel.F_Module = funcMsg.GetModuleFuncStr();
                }

                SysLogProvider.GetInstance().WirteSysLog(sysLogModel);
            }
            catch (Exception e)
            {
                MyLog.Error("写入日志出现错误", e);
            }
        }

        /// <summary>
        /// 添加系统日志
        /// </summary>
        /// <returns></returns>
        protected void AddSysLog(string optType, string optContent, string system, string module, string otherMsg = "")
        {
            Type t = this.GetType();
            FuncMsgAttribute funcMsg = (FuncMsgAttribute)Attribute.GetCustomAttribute(t, typeof(FuncMsgAttribute));

            BaseSysLogModel sysLogModel = new BaseSysLogModel();
            sysLogModel.F_OptType = optType;
            sysLogModel.F_OptContent = optContent;
            sysLogModel.F_OtherMsg = otherMsg;

            try
            {
                sysLogModel.F_System = string.IsNullOrEmpty(system) ? Configs.GetSetting("systemFlag") : system;
                if (string.IsNullOrEmpty(module) && funcMsg != null)
                {
                    sysLogModel.F_Module = funcMsg.GetModuleFuncStr();
                }
                else
                {
                    sysLogModel.F_Module = module;
                }

                SysLogProvider.GetInstance().WirteSysLog(sysLogModel);
            }
            catch (Exception e)
            {
                MyLog.Error("批量写入日志出现错误", e);
            }
        }

        #endregion

        #region 可直接调用的工具方法

        /// <summary>
        /// 继承类可调用的异常处理方法
        /// 当自定义异常需要使用时，可以调用该方法
        /// </summary>
        /// <returns></returns>
        protected string ExceptionHandler(Exception ex, HttpResponse response)
        {
            //如果是用户自定义异常时，直接将对应的异常信息返回到前台即可。
            if (ex is CustomException)
            {
                //MyLog.Error("执行异常：", ex);
                response.Write(ErrorResult(JsonRpcErrorEnum.BusinessError, ex.Message));
            }
            else
            {
                if (ex.InnerException != null)
                {
                    //如果是用户自定义异常时，直接将对应的异常信息返回到前台即可。
                    if (ex.InnerException is CustomException)
                    {
                        response.Write(ErrorResult(JsonRpcErrorEnum.BusinessError, ex.InnerException.Message));
                    }
                    else
                    {
                        MyLog.Error("执行异常：", ex.InnerException);
                        response.Write(ErrorResult(JsonRpcErrorEnum.ServerError, "请求出现异常:" + ex.InnerException.Message, ex.InnerException));
                    }
                }
                else
                {
                    MyLog.Error("执行异常：", ex);
                    response.Write(ErrorResult(JsonRpcErrorEnum.ServerError, "请求出现异常:" + ex.Message, ex));
                }
            }
            return null;
        }

        /// <summary>
        /// 通用的方法将获取到的数据解析到实体类中。
        /// 该方法具体使用时，根据实际的处理情况进行自主修补。
        /// </summary>
        /// <typeparam name="T">实体类类型</typeparam>
        /// <param name="request"></param>
        /// <returns></returns>
        protected T RequstParamToModel<T>(HttpRequest request) where T : class, new()
        {
            Type t = typeof(T);
            var fields = t.GetProperties();
            T model = new T();

            String val = string.Empty;
            object obj = null;
            foreach (var field in fields)
            {
                if (request.Form.AllKeys.Contains(field.Name))
                {
                    val = request[field.Name];

                    //非泛型
                    if (!field.PropertyType.IsGenericType)
                        obj = string.IsNullOrEmpty(val) ? null : Convert.ChangeType(val, field.PropertyType);
                    else //泛型Nullable<>
                    {
                        Type genericTypeDefinition = field.PropertyType.GetGenericTypeDefinition();
                        if (genericTypeDefinition == typeof(Nullable<>))
                        {
                            obj = string.IsNullOrEmpty(val)
                                ? null
                                : Convert.ChangeType(val, Nullable.GetUnderlyingType(field.PropertyType));
                        }
                    }
                    field.SetValue(model, obj, null);
                }
            }
            return model;
        }

        /// <summary>
        /// 获取请求的数据信息到字典中
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        protected Dictionary<string, string> RequestParamToDictionary(HttpRequest request)
        {
            Dictionary<string, string> allParams = new Dictionary<string, string>();

            string[] formKeys = request.Form.AllKeys;
            string[] queryKeys = request.QueryString.AllKeys;
            List<string> allKeys = formKeys.Union(queryKeys).ToList<string>();

            //忽略不会用到的查询条件key值
            string[] ignoreKey = new string[] { "rows", "page", "action" };

            foreach (string key in allKeys)
            {
                if (ignoreKey.Contains(key)) //获取的参数更专注于业务，这里对于分页相关的参数在对应的方法中单独实现获取
                {
                    continue;
                }
                allParams.Add(key, request[key]);
            }

            return allParams;
        }

        #endregion

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
