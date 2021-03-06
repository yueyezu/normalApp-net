.net开发用的一套框架，好几年没维护了。
公司这边技术路线也均已转移，该框架被用到的可能几乎为0。
有些设计思路还是费了些心思的，开放出来供大家学习使用吧。
也希望有哪位大侠如果有精力，可以继续完善下去，不胜感激！



有疑问可以联系我：350221302@qq.com



# 系统说明

## 项目结构说明

```
0Design —— 设计文件，包含：数据库设计、初始化数据、设计说明书、部分复杂逻辑设计思路等。
0Document —— 系统的文档，包含：开发规范、数据库规范、系统思路梳理、类库封装说明、框架使用说明。
1KeyGen —— 系统授权使用的注册机文件，自己编写的，核心逻辑完成，具体程序还不完善。
1CoreClass —— 框架的核心代码： LT.Code-类库文件、LT.CoreMini-封装的基类文件。
2Mini_App —— 框架的初步版本，再核心代码基础上搭建的初版应用，包含了系统管理相关的功能。
```

## 项目技术说明

开发工具： VS2012

数据库： SqlServer2012

日志记录：log4net

Json插件： Newtonsoft.Json

后端基本纯手撸，没有使用多少插件。

<font color='red'>Ps. 其他具体看系统文档即可。</font>

## 实现的功能

**框架功能** ：登录注销、用户信息修改

**系统管理**：组织架构管理、岗位管理、用户管理、角色管理、菜单管理、 按钮管理、日志管理、字典管理、 字典值管理、系统配置

# 历史维护记录

| No   | 时间       | 工作                                        | 后续计划                       | 备注                                |
| ---- | ---------- | ------------------------------------------- | ------------------------------ | ----------------------------------- |
| 1    | 2017/12/11 | 策划文件初步整理完成。                      | 对已有的系统的框架进行抽离     |                                     |
| 2    | 2017/12/12 | 对于智慧仓库的框架进行抽离。                | 框架分布、基础类库整理         |                                     |
| 3    | 2017/12/20 | 框架分类，基本类库整理，基类初步创建。      | 数据库进行创建                 |                                     |
| 4    | 2017/12/25 | 数据库进行创建。设计文档起草完成。          | 设计文档后续开发中进行完善     | 功能列表梳理                        |
| 5    | 2017/12/28 | 引入requireJs进行前端JS文件管理。           | 登录界面开始编写               |                                     |
| 6    | 2018/1/2   | 引入字体样式。完善Common类库ltform封装。    |                                |                                     |
| 7    | 2018/1/4   | 登录功能开发完成。                          | 首页编写，登录验证，权限获取   |                                     |
| 8    | 2018/1/5   | 对于前端缓存的存放方式以及相关代码完成。    | 前端缓存数据获取，功能列表添加 |                                     |
| 9    | 2018/1/8   | 缓存获取、功能列表渲染完成。                | 菜单管理功能开发，并封装。     |                                     |
| 10   | 2018/1/10  | 单用户登录添加完成。                        | 用户登录验证属性加入。         |                                     |
| 11   | 2018/1/10  | 用户登录验证属性加入。Ashx请求的            | 对于系统公共配置信息的引入。   |                                     |
| 12   | 2018/1/10  | 对于错误页、404页、强制下线提示页进行添加。 | 同上                           |                                     |
| 13   | 2018/1/11  | 系统公共配置信息获取添加完成。              | 修改密码功能进行添加。         |                                     |
| 14   | 2018/1/12  | 修改密码功能添加完成。                      | 系统授权部分进行添加。         |                                     |
| 15   | 2018/1/16  | 授权认证注册机初步开发完成。                | 授权系统加载到mini框架中       | 注册机树立中对于Winform框架初步建立 |
| 16   | 2018/1/17  | Mini框架中集成授权认证功能。                | 菜单管理功能进行开发。         | 同时考虑按钮表的必要性              |
| 17   | 2018/3/1   | Mini框架菜单管理功能进行开发。              | 用户管理功能开发               |                                     |
| 18   | 2018/3/2   | 用户管理功能开发                            | 角色管理开发                   |                                     |
| 19   | 2018/3/6   | 角色管理功能开发                            | 岗位管理开发                   |                                     |
| 20   | 2018/3/7   | 岗位管理功能开发                            | 组织架构功能开发               |                                     |
| 21   | 2018/3/9   | 组织架构功能开发                            | 系统日志开发                   |                                     |
| 22   | 2018/3/9   | 系统日志功能开发                            | 字典管理开发                   |                                     |
| 23   | 2018/3/14  | 字典管理功能开发                            | 用户赋予角色开发               |                                     |
| 24   | 2018/3/22  | 用户赋予角色功能开发                        | 角色赋予权限开发               |                                     |
| 25   | 2018/3/23  | 角色赋予权限功能开发                        | 系统设置开发                   |                                     |
| 26   | 2018/3/26  | 系统设置功能开发                            | 添加系统日志开发               |                                     |
| 27   | 2018/3/28  | 系统日志添加功能开发                        | 用户信息修改开发               | 日志输出框架设计开发。              |
| 28   | 2018/3/29  | 用户信息修改功能开发                        | 系统权限控制                   |                                     |
| 29   | 2018/3/29  | 系统功能权限控制添加                        |                                | 1.0分支建立起来                     |
| 30   | 2018/6/23  | 修改树结构排序问题                          |                                |                                     |
| 31   | 2018/7/13  | 调整数据库的实现设计，兼容MySql添加         |                                |                                     |
| 32   | 2018/7/16  | 系初始化校验错误、树结构基类完善            |                                |                                     |
|      |            |                                             |                                |                                     |