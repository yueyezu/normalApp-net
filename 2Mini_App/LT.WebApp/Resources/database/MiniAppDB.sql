/*
Navicat SQL Server Data Transfer

Source Server         : yueye-sqlserver
Source Server Version : 110000
Source Host           : .:1433
Source Database       : MiniAppDB
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2019-06-21 17:09:53
*/


-- ----------------------------
-- Table structure for Bas_Region
-- ----------------------------
DROP TABLE [dbo].[Bas_Region]
GO
CREATE TABLE [dbo].[Bas_Region] (
[F_Id] varchar(36) NOT NULL ,
[F_ParentId] varchar(36) NULL ,
[F_Layers] varchar(200) NULL ,
[F_Code] varchar(36) NULL ,
[F_Name] nvarchar(36) NULL ,
[F_SimpleSpelling] varchar(60) NULL ,
[F_SortNum] int NULL ,
[F_DeleteFlag] int NULL ,
[F_EnabledFlag] int NULL ,
[F_Description] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_LastModifyUserId] varchar(36) NULL ,
[F_LastModifyTime] datetime NULL ,
[F_DeleteUserId] varchar(36) NULL ,
[F_DeleteTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'区域表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'区域表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_ParentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Layers')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Code')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Code'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Code'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_SimpleSpelling')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'简拼'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_SimpleSpelling'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'简拼'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_SimpleSpelling'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_DeleteFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_EnabledFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Description'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_LastModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_LastModifyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_DeleteUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_DeleteTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Bas_Region', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Bas_Region'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Bas_Region
-- ----------------------------
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'110000', N'0', N'#110000#', N'110000', N'北京', N'bj', N'110000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'110100', N'110000', N'#110000#|#110100#', N'110100', N'北京市', N'bjs', N'110100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'120000', N'0', N'#120000#', N'120000', N'天津', N'tj', N'120000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'120100', N'120000', N'#120000#|#120100#', N'120100', N'天津市', N'tjs', N'120100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130000', N'0', N'#130000#', N'130000', N'河北省', N'hbs', N'130000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130100', N'130000', N'#130000#|#130100#', N'130100', N'石家庄市', N'sjzs', N'130100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130200', N'130000', N'#130000#|#130200#', N'130200', N'唐山市', N'tss', N'130200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130300', N'130000', N'#130000#|#130300#', N'130300', N'秦皇岛市', N'qhds', N'130300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130400', N'130000', N'#130000#|#130400#', N'130400', N'邯郸市', N'hds', N'130400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130500', N'130000', N'#130000#|#130500#', N'130500', N'邢台市', N'xts', N'130500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130600', N'130000', N'#130000#|#130600#', N'130600', N'保定市', N'bds', N'130600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130700', N'130000', N'#130000#|#130700#', N'130700', N'张家口市', N'zjks', N'130700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130800', N'130000', N'#130000#|#130800#', N'130800', N'承德市', N'cds', N'130800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'130900', N'130000', N'#130000#|#130900#', N'130900', N'沧州市', N'czs', N'130900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'131000', N'130000', N'#130000#|#131000#', N'131000', N'廊坊市', N'lfs', N'131000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'131100', N'130000', N'#130000#|#131100#', N'131100', N'衡水市', N'hss', N'131100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140000', N'0', N'#140000#', N'140000', N'山西省', N'sxs', N'140000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140100', N'140000', N'#140000#|#140100#', N'140100', N'太原市', N'tys', N'140100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140200', N'140000', N'#140000#|#140200#', N'140200', N'大同市', N'dts', N'140200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140300', N'140000', N'#140000#|#140300#', N'140300', N'阳泉市', N'yqs', N'140300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140400', N'140000', N'#140000#|#140400#', N'140400', N'长治市', N'czs', N'140400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140500', N'140000', N'#140000#|#140500#', N'140500', N'晋城市', N'jcs', N'140500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140600', N'140000', N'#140000#|#140600#', N'140600', N'朔州市', N'szs', N'140600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140700', N'140000', N'#140000#|#140700#', N'140700', N'晋中市', N'jzs', N'140700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140800', N'140000', N'#140000#|#140800#', N'140800', N'运城市', N'ycs', N'140800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'140900', N'140000', N'#140000#|#140900#', N'140900', N'忻州市', N'xzs', N'140900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'141000', N'140000', N'#140000#|#141000#', N'141000', N'临汾市', N'lfs', N'141000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'141100', N'140000', N'#140000#|#141100#', N'141100', N'吕梁市', N'lls', N'141100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150000', N'0', N'#150000#', N'150000', N'内蒙古自治区', N'nmgzzq', N'150000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150100', N'150000', N'#150000#|#150100#', N'150100', N'呼和浩特市', N'hhhts', N'150100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150200', N'150000', N'#150000#|#150200#', N'150200', N'包头市', N'bts', N'150200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150300', N'150000', N'#150000#|#150300#', N'150300', N'乌海市', N'whs', N'150300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150400', N'150000', N'#150000#|#150400#', N'150400', N'赤峰市', N'cfs', N'150400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150500', N'150000', N'#150000#|#150500#', N'150500', N'通辽市', N'tls', N'150500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150600', N'150000', N'#150000#|#150600#', N'150600', N'鄂尔多斯市', N'eedss', N'150600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150700', N'150000', N'#150000#|#150700#', N'150700', N'呼伦贝尔市', N'hlbes', N'150700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150800', N'150000', N'#150000#|#150800#', N'150800', N'巴彦淖尔市', N'bynes', N'150800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'150900', N'150000', N'#150000#|#150900#', N'150900', N'乌兰察布市', N'wlcbs', N'150900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'152200', N'150000', N'#150000#|#152200#', N'152200', N'兴安盟', N'xam', N'152200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'152500', N'150000', N'#150000#|#152500#', N'152500', N'锡林郭勒盟', N'xlglm', N'152500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'152900', N'150000', N'#150000#|#152900#', N'152900', N'阿拉善盟', N'alsm', N'152900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210000', N'0', N'#210000#', N'210000', N'辽宁省', N'lns', N'210000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210100', N'210000', N'#210000#|#210100#', N'210100', N'沈阳市', N'sys', N'210100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210200', N'210000', N'#210000#|#210200#', N'210200', N'大连市', N'dls', N'210200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210300', N'210000', N'#210000#|#210300#', N'210300', N'鞍山市', N'ass', N'210300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210400', N'210000', N'#210000#|#210400#', N'210400', N'抚顺市', N'fss', N'210400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210500', N'210000', N'#210000#|#210500#', N'210500', N'本溪市', N'bxs', N'210500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210600', N'210000', N'#210000#|#210600#', N'210600', N'丹东市', N'dds', N'210600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210700', N'210000', N'#210000#|#210700#', N'210700', N'锦州市', N'jzs', N'210700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210800', N'210000', N'#210000#|#210800#', N'210800', N'营口市', N'yks', N'210800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'210900', N'210000', N'#210000#|#210900#', N'210900', N'阜新市', N'fxs', N'210900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'211000', N'210000', N'#210000#|#211000#', N'211000', N'辽阳市', N'lys', N'211000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'211100', N'210000', N'#210000#|#211100#', N'211100', N'盘锦市', N'pjs', N'211100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'211200', N'210000', N'#210000#|#211200#', N'211200', N'铁岭市', N'tls', N'211200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'211300', N'210000', N'#210000#|#211300#', N'211300', N'朝阳市', N'zys', N'211300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'211400', N'210000', N'#210000#|#211400#', N'211400', N'葫芦岛市', N'hlds', N'211400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220000', N'0', N'#220000#', N'220000', N'吉林省', N'jls', N'220000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220100', N'220000', N'#220000#|#220100#', N'220100', N'长春市', N'zcs', N'220100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220200', N'220000', N'#220000#|#220200#', N'220200', N'吉林市', N'jls', N'220200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220300', N'220000', N'#220000#|#220300#', N'220300', N'四平市', N'sps', N'220300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220400', N'220000', N'#220000#|#220400#', N'220400', N'辽源市', N'lys', N'220400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220500', N'220000', N'#220000#|#220500#', N'220500', N'通化市', N'ths', N'220500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220600', N'220000', N'#220000#|#220600#', N'220600', N'白山市', N'bss', N'220600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220700', N'220000', N'#220000#|#220700#', N'220700', N'松原市', N'sys', N'220700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'220800', N'220000', N'#220000#|#220800#', N'220800', N'白城市', N'bcs', N'220800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'222400', N'220000', N'#220000#|#222400#', N'222400', N'延边朝鲜族自治州', N'ybzxzzzz', N'222400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230000', N'0', N'#230000#', N'230000', N'黑龙江省', N'hljs', N'230000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230100', N'230000', N'#230000#|#230100#', N'230100', N'哈尔滨市', N'hebs', N'230100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230200', N'230000', N'#230000#|#230200#', N'230200', N'齐齐哈尔市', N'qqhes', N'230200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230300', N'230000', N'#230000#|#230300#', N'230300', N'鸡西市', N'jxs', N'230300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230400', N'230000', N'#230000#|#230400#', N'230400', N'鹤岗市', N'hgs', N'230400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230500', N'230000', N'#230000#|#230500#', N'230500', N'双鸭山市', N'syss', N'230500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230600', N'230000', N'#230000#|#230600#', N'230600', N'大庆市', N'dqs', N'230600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230700', N'230000', N'#230000#|#230700#', N'230700', N'伊春市', N'ycs', N'230700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230800', N'230000', N'#230000#|#230800#', N'230800', N'佳木斯市', N'jmss', N'230800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'230900', N'230000', N'#230000#|#230900#', N'230900', N'七台河市', N'qths', N'230900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'231000', N'230000', N'#230000#|#231000#', N'231000', N'牡丹江市', N'mdjs', N'231000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'231100', N'230000', N'#230000#|#231100#', N'231100', N'黑河市', N'hhs', N'231100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'231200', N'230000', N'#230000#|#231200#', N'231200', N'绥化市', N'shs', N'231200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'232700', N'230000', N'#230000#|#232700#', N'232700', N'大兴安岭地区', N'dxaldq', N'232700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'310000', N'0', N'#310000#', N'310000', N'上海', N'sh', N'310000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'310100', N'310000', N'#310000#|#310100#', N'310100', N'上海市', N'shs', N'310100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320000', N'0', N'#320000#', N'320000', N'江苏省', N'jss', N'320000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320100', N'320000', N'#320000#|#320100#', N'320100', N'南京市', N'njs', N'320100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320200', N'320000', N'#320000#|#320200#', N'320200', N'无锡市', N'wxs', N'320200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320300', N'320000', N'#320000#|#320300#', N'320300', N'徐州市', N'xzs', N'320300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320400', N'320000', N'#320000#|#320400#', N'320400', N'常州市', N'czs', N'320400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320500', N'320000', N'#320000#|#320500#', N'320500', N'苏州市', N'szs', N'320500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320600', N'320000', N'#320000#|#320600#', N'320600', N'南通市', N'nts', N'320600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320700', N'320000', N'#320000#|#320700#', N'320700', N'连云港市', N'lygs', N'320700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320800', N'320000', N'#320000#|#320800#', N'320800', N'淮安市', N'has', N'320800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'320900', N'320000', N'#320000#|#320900#', N'320900', N'盐城市', N'ycs', N'320900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'321000', N'320000', N'#320000#|#321000#', N'321000', N'扬州市', N'yzs', N'321000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'321100', N'320000', N'#320000#|#321100#', N'321100', N'镇江市', N'zjs', N'321100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'321200', N'320000', N'#320000#|#321200#', N'321200', N'泰州市', N'tzs', N'321200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'321300', N'320000', N'#320000#|#321300#', N'321300', N'宿迁市', N'sqs', N'321300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330000', N'0', N'#330000#', N'330000', N'浙江省', N'zjs', N'330000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330100', N'330000', N'#330000#|#330100#', N'330100', N'杭州市', N'hzs', N'330100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330200', N'330000', N'#330000#|#330200#', N'330200', N'宁波市', N'nbs', N'330200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330300', N'330000', N'#330000#|#330300#', N'330300', N'温州市', N'wzs', N'330300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330400', N'330000', N'#330000#|#330400#', N'330400', N'嘉兴市', N'jxs', N'330400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330500', N'330000', N'#330000#|#330500#', N'330500', N'湖州市', N'hzs', N'330500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330600', N'330000', N'#330000#|#330600#', N'330600', N'绍兴市', N'sxs', N'330600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330700', N'330000', N'#330000#|#330700#', N'330700', N'金华市', N'jhs', N'330700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330800', N'330000', N'#330000#|#330800#', N'330800', N'衢州市', N'qzs', N'330800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'330900', N'330000', N'#330000#|#330900#', N'330900', N'舟山市', N'zss', N'330900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'331000', N'330000', N'#330000#|#331000#', N'331000', N'台州市', N'tzs', N'331000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'331100', N'330000', N'#330000#|#331100#', N'331100', N'丽水市', N'lss', N'331100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340000', N'0', N'#340000#', N'340000', N'安徽省', N'ahs', N'340000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340100', N'340000', N'#340000#|#340100#', N'340100', N'合肥市', N'hfs', N'340100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340200', N'340000', N'#340000#|#340200#', N'340200', N'芜湖市', N'whs', N'340200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340300', N'340000', N'#340000#|#340300#', N'340300', N'蚌埠市', N'bbs', N'340300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340400', N'340000', N'#340000#|#340400#', N'340400', N'淮南市', N'hns', N'340400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340500', N'340000', N'#340000#|#340500#', N'340500', N'马鞍山市', N'mass', N'340500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340600', N'340000', N'#340000#|#340600#', N'340600', N'淮北市', N'hbs', N'340600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340700', N'340000', N'#340000#|#340700#', N'340700', N'铜陵市', N'tls', N'340700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'340800', N'340000', N'#340000#|#340800#', N'340800', N'安庆市', N'aqs', N'340800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'341000', N'340000', N'#340000#|#341000#', N'341000', N'黄山市', N'hss', N'341000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'341100', N'340000', N'#340000#|#341100#', N'341100', N'滁州市', N'czs', N'341100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'341200', N'340000', N'#340000#|#341200#', N'341200', N'阜阳市', N'fys', N'341200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'341300', N'340000', N'#340000#|#341300#', N'341300', N'宿州市', N'szs', N'341300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'341500', N'340000', N'#340000#|#341500#', N'341500', N'六安市', N'las', N'341500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'341600', N'340000', N'#340000#|#341600#', N'341600', N'亳州市', N'bzs', N'341600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'341700', N'340000', N'#340000#|#341700#', N'341700', N'池州市', N'czs', N'341700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'341800', N'340000', N'#340000#|#341800#', N'341800', N'宣城市', N'xcs', N'341800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350000', N'0', N'#350000#', N'350000', N'福建省', N'fjs', N'350000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350100', N'350000', N'#350000#|#350100#', N'350100', N'福州市', N'fzs', N'350100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350200', N'350000', N'#350000#|#350200#', N'350200', N'厦门市', N'xms', N'350200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350300', N'350000', N'#350000#|#350300#', N'350300', N'莆田市', N'pts', N'350300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350400', N'350000', N'#350000#|#350400#', N'350400', N'三明市', N'sms', N'350400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350500', N'350000', N'#350000#|#350500#', N'350500', N'泉州市', N'qzs', N'350500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350600', N'350000', N'#350000#|#350600#', N'350600', N'漳州市', N'zzs', N'350600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350700', N'350000', N'#350000#|#350700#', N'350700', N'南平市', N'nps', N'350700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350800', N'350000', N'#350000#|#350800#', N'350800', N'龙岩市', N'lys', N'350800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'350900', N'350000', N'#350000#|#350900#', N'350900', N'宁德市', N'nds', N'350900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360000', N'0', N'#360000#', N'360000', N'江西省', N'jxs', N'360000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360100', N'360000', N'#360000#|#360100#', N'360100', N'南昌市', N'ncs', N'360100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360200', N'360000', N'#360000#|#360200#', N'360200', N'景德镇市', N'jdzs', N'360200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360300', N'360000', N'#360000#|#360300#', N'360300', N'萍乡市', N'pxs', N'360300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360400', N'360000', N'#360000#|#360400#', N'360400', N'九江市', N'jjs', N'360400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360500', N'360000', N'#360000#|#360500#', N'360500', N'新余市', N'xys', N'360500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360600', N'360000', N'#360000#|#360600#', N'360600', N'鹰潭市', N'yts', N'360600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360700', N'360000', N'#360000#|#360700#', N'360700', N'赣州市', N'gzs', N'360700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360800', N'360000', N'#360000#|#360800#', N'360800', N'吉安市', N'jas', N'360800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'360900', N'360000', N'#360000#|#360900#', N'360900', N'宜春市', N'ycs', N'360900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'361000', N'360000', N'#360000#|#361000#', N'361000', N'抚州市', N'fzs', N'361000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'361100', N'360000', N'#360000#|#361100#', N'361100', N'上饶市', N'srs', N'361100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370000', N'0', N'#370000#', N'370000', N'山东省', N'sds', N'370000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370100', N'370000', N'#370000#|#370100#', N'370100', N'济南市', N'jns', N'370100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370200', N'370000', N'#370000#|#370200#', N'370200', N'青岛市', N'qds', N'370200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370300', N'370000', N'#370000#|#370300#', N'370300', N'淄博市', N'zbs', N'370300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370400', N'370000', N'#370000#|#370400#', N'370400', N'枣庄市', N'zzs', N'370400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370500', N'370000', N'#370000#|#370500#', N'370500', N'东营市', N'dys', N'370500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370600', N'370000', N'#370000#|#370600#', N'370600', N'烟台市', N'yts', N'370600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370700', N'370000', N'#370000#|#370700#', N'370700', N'潍坊市', N'wfs', N'370700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370800', N'370000', N'#370000#|#370800#', N'370800', N'济宁市', N'jns', N'370800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'370900', N'370000', N'#370000#|#370900#', N'370900', N'泰安市', N'tas', N'370900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'371000', N'370000', N'#370000#|#371000#', N'371000', N'威海市', N'whs', N'371000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'371100', N'370000', N'#370000#|#371100#', N'371100', N'日照市', N'rzs', N'371100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'371200', N'370000', N'#370000#|#371200#', N'371200', N'莱芜市', N'lws', N'371200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'371300', N'370000', N'#370000#|#371300#', N'371300', N'临沂市', N'lys', N'371300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'371400', N'370000', N'#370000#|#371400#', N'371400', N'德州市', N'dzs', N'371400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'371500', N'370000', N'#370000#|#371500#', N'371500', N'聊城市', N'lcs', N'371500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'371600', N'370000', N'#370000#|#371600#', N'371600', N'滨州市', N'bzs', N'371600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'371700', N'370000', N'#370000#|#371700#', N'371700', N'菏泽市', N'hzs', N'371700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410000', N'0', N'#410000#', N'410000', N'河南省', N'hns', N'410000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410100', N'410000', N'#410000#|#410100#', N'410100', N'郑州市', N'zzs', N'410100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410200', N'410000', N'#410000#|#410200#', N'410200', N'开封市', N'kfs', N'410200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410300', N'410000', N'#410000#|#410300#', N'410300', N'洛阳市', N'lys', N'410300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410400', N'410000', N'#410000#|#410400#', N'410400', N'平顶山市', N'pdss', N'410400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410500', N'410000', N'#410000#|#410500#', N'410500', N'安阳市', N'ays', N'410500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410600', N'410000', N'#410000#|#410600#', N'410600', N'鹤壁市', N'hbs', N'410600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410700', N'410000', N'#410000#|#410700#', N'410700', N'新乡市', N'xxs', N'410700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410800', N'410000', N'#410000#|#410800#', N'410800', N'焦作市', N'jzs', N'410800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410881', N'410000', N'#410000#|#410881#', N'410881', N'济源市', N'jys', N'410881', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'410900', N'410000', N'#410000#|#410900#', N'410900', N'濮阳市', N'pys', N'410900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'411000', N'410000', N'#410000#|#411000#', N'411000', N'许昌市', N'xcs', N'411000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'411100', N'410000', N'#410000#|#411100#', N'411100', N'漯河市', N'lhs', N'411100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'411200', N'410000', N'#410000#|#411200#', N'411200', N'三门峡市', N'smxs', N'411200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'411300', N'410000', N'#410000#|#411300#', N'411300', N'南阳市', N'nys', N'411300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'411400', N'410000', N'#410000#|#411400#', N'411400', N'商丘市', N'sqs', N'411400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'411500', N'410000', N'#410000#|#411500#', N'411500', N'信阳市', N'xys', N'411500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'411600', N'410000', N'#410000#|#411600#', N'411600', N'周口市', N'zks', N'411600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'411700', N'410000', N'#410000#|#411700#', N'411700', N'驻马店市', N'zmds', N'411700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420000', N'0', N'#420000#', N'420000', N'湖北省', N'hbs', N'420000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420100', N'420000', N'#420000#|#420100#', N'420100', N'武汉市', N'whs', N'420100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420200', N'420000', N'#420000#|#420200#', N'420200', N'黄石市', N'hss', N'420200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420300', N'420000', N'#420000#|#420300#', N'420300', N'十堰市', N'sys', N'420300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420500', N'420000', N'#420000#|#420500#', N'420500', N'宜昌市', N'ycs', N'420500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420600', N'420000', N'#420000#|#420600#', N'420600', N'襄阳市', N'xys', N'420600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420700', N'420000', N'#420000#|#420700#', N'420700', N'鄂州市', N'ezs', N'420700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420800', N'420000', N'#420000#|#420800#', N'420800', N'荆门市', N'jms', N'420800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'420900', N'420000', N'#420000#|#420900#', N'420900', N'孝感市', N'xgs', N'420900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'421000', N'420000', N'#420000#|#421000#', N'421000', N'荆州市', N'jzs', N'421000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'421100', N'420000', N'#420000#|#421100#', N'421100', N'黄冈市', N'hgs', N'421100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'421200', N'420000', N'#420000#|#421200#', N'421200', N'咸宁市', N'xns', N'421200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'421300', N'420000', N'#420000#|#421300#', N'421300', N'随州市', N'szs', N'421300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'422800', N'420000', N'#420000#|#422800#', N'422800', N'恩施土家族苗族自治州', N'estjzmzzzz', N'422800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430000', N'0', N'#430000#', N'430000', N'湖南省', N'hns', N'430000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430100', N'430000', N'#430000#|#430100#', N'430100', N'长沙市', N'zss', N'430100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430200', N'430000', N'#430000#|#430200#', N'430200', N'株洲市', N'zzs', N'430200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430300', N'430000', N'#430000#|#430300#', N'430300', N'湘潭市', N'xts', N'430300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430400', N'430000', N'#430000#|#430400#', N'430400', N'衡阳市', N'hys', N'430400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430500', N'430000', N'#430000#|#430500#', N'430500', N'邵阳市', N'sys', N'430500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430600', N'430000', N'#430000#|#430600#', N'430600', N'岳阳市', N'yys', N'430600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430700', N'430000', N'#430000#|#430700#', N'430700', N'常德市', N'cds', N'430700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430800', N'430000', N'#430000#|#430800#', N'430800', N'张家界市', N'zjjs', N'430800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'430900', N'430000', N'#430000#|#430900#', N'430900', N'益阳市', N'yys', N'430900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'431000', N'430000', N'#430000#|#431000#', N'431000', N'郴州市', N'czs', N'431000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'431100', N'430000', N'#430000#|#431100#', N'431100', N'永州市', N'yzs', N'431100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'431200', N'430000', N'#430000#|#431200#', N'431200', N'怀化市', N'hhs', N'431200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'431300', N'430000', N'#430000#|#431300#', N'431300', N'娄底市', N'lds', N'431300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'433100', N'430000', N'#430000#|#433100#', N'433100', N'湘西土家族苗族自治州', N'xxtjzmzzzz', N'433100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440000', N'0', N'#440000#', N'440000', N'广东省', N'gds', N'440000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440100', N'440000', N'#440000#|#440100#', N'440100', N'广州市', N'gzs', N'440100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440200', N'440000', N'#440000#|#440200#', N'440200', N'韶关市', N'sgs', N'440200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440300', N'440000', N'#440000#|#440300#', N'440300', N'深圳市', N'szs', N'440300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440400', N'440000', N'#440000#|#440400#', N'440400', N'珠海市', N'zhs', N'440400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440500', N'440000', N'#440000#|#440500#', N'440500', N'汕头市', N'sts', N'440500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440600', N'440000', N'#440000#|#440600#', N'440600', N'佛山市', N'fss', N'440600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440700', N'440000', N'#440000#|#440700#', N'440700', N'江门市', N'jms', N'440700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440800', N'440000', N'#440000#|#440800#', N'440800', N'湛江市', N'zjs', N'440800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'440900', N'440000', N'#440000#|#440900#', N'440900', N'茂名市', N'mms', N'440900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'441200', N'440000', N'#440000#|#441200#', N'441200', N'肇庆市', N'zqs', N'441200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'441300', N'440000', N'#440000#|#441300#', N'441300', N'惠州市', N'hzs', N'441300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'441400', N'440000', N'#440000#|#441400#', N'441400', N'梅州市', N'mzs', N'441400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'441500', N'440000', N'#440000#|#441500#', N'441500', N'汕尾市', N'sws', N'441500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'441600', N'440000', N'#440000#|#441600#', N'441600', N'河源市', N'hys', N'441600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'441700', N'440000', N'#440000#|#441700#', N'441700', N'阳江市', N'yjs', N'441700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'441800', N'440000', N'#440000#|#441800#', N'441800', N'清远市', N'qys', N'441800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'445100', N'440000', N'#440000#|#445100#', N'445100', N'潮州市', N'czs', N'445100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'445200', N'440000', N'#440000#|#445200#', N'445200', N'揭阳市', N'jys', N'445200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'445300', N'440000', N'#440000#|#445300#', N'445300', N'云浮市', N'yfs', N'445300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450000', N'0', N'#450000#', N'450000', N'广西壮族自治区', N'gxzzzzq', N'450000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450100', N'450000', N'#450000#|#450100#', N'450100', N'南宁市', N'nns', N'450100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450200', N'450000', N'#450000#|#450200#', N'450200', N'柳州市', N'lzs', N'450200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450300', N'450000', N'#450000#|#450300#', N'450300', N'桂林市', N'gls', N'450300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450400', N'450000', N'#450000#|#450400#', N'450400', N'梧州市', N'wzs', N'450400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450500', N'450000', N'#450000#|#450500#', N'450500', N'北海市', N'bhs', N'450500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450600', N'450000', N'#450000#|#450600#', N'450600', N'防城港市', N'fcgs', N'450600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450700', N'450000', N'#450000#|#450700#', N'450700', N'钦州市', N'qzs', N'450700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450800', N'450000', N'#450000#|#450800#', N'450800', N'贵港市', N'ggs', N'450800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'450900', N'450000', N'#450000#|#450900#', N'450900', N'玉林市', N'yls', N'450900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'451000', N'450000', N'#450000#|#451000#', N'451000', N'百色市', N'bss', N'451000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'451100', N'450000', N'#450000#|#451100#', N'451100', N'贺州市', N'hzs', N'451100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'451200', N'450000', N'#450000#|#451200#', N'451200', N'河池市', N'hcs', N'451200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'451300', N'450000', N'#450000#|#451300#', N'451300', N'来宾市', N'lbs', N'451300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'451400', N'450000', N'#450000#|#451400#', N'451400', N'崇左市', N'czs', N'451400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'460000', N'0', N'#460000#', N'460000', N'海南省', N'hns', N'460000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'460100', N'460000', N'#460000#|#460100#', N'460100', N'海口市', N'hks', N'460100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'500000', N'0', N'#500000#', N'500000', N'重庆', N'zq', N'500000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'500100', N'500000', N'#500000#|#500100#', N'500100', N'重庆市', N'zqs', N'500100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510000', N'0', N'#510000#', N'510000', N'四川省', N'scs', N'510000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510100', N'510000', N'#510000#|#510100#', N'510100', N'成都市', N'cds', N'510100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510300', N'510000', N'#510000#|#510300#', N'510300', N'自贡市', N'zgs', N'510300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510400', N'510000', N'#510000#|#510400#', N'510400', N'攀枝花市', N'pzhs', N'510400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510500', N'510000', N'#510000#|#510500#', N'510500', N'泸州市', N'lzs', N'510500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510600', N'510000', N'#510000#|#510600#', N'510600', N'德阳市', N'dys', N'510600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510700', N'510000', N'#510000#|#510700#', N'510700', N'绵阳市', N'mys', N'510700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510800', N'510000', N'#510000#|#510800#', N'510800', N'广元市', N'gys', N'510800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'510900', N'510000', N'#510000#|#510900#', N'510900', N'遂宁市', N'sns', N'510900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511000', N'510000', N'#510000#|#511000#', N'511000', N'内江市', N'njs', N'511000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511100', N'510000', N'#510000#|#511100#', N'511100', N'乐山市', N'yss', N'511100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511300', N'510000', N'#510000#|#511300#', N'511300', N'南充市', N'ncs', N'511300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511400', N'510000', N'#510000#|#511400#', N'511400', N'眉山市', N'mss', N'511400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511500', N'510000', N'#510000#|#511500#', N'511500', N'宜宾市', N'ybs', N'511500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511600', N'510000', N'#510000#|#511600#', N'511600', N'广安市', N'gas', N'511600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511700', N'510000', N'#510000#|#511700#', N'511700', N'达州市', N'dzs', N'511700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511800', N'510000', N'#510000#|#511800#', N'511800', N'雅安市', N'yas', N'511800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'511900', N'510000', N'#510000#|#511900#', N'511900', N'巴中市', N'bzs', N'511900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'512000', N'510000', N'#510000#|#512000#', N'512000', N'资阳市', N'zys', N'512000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'513200', N'510000', N'#510000#|#513200#', N'513200', N'阿坝藏族羌族自治州', N'abzzqzzzz', N'513200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'513300', N'510000', N'#510000#|#513300#', N'513300', N'甘孜藏族自治州', N'gzzzzzz', N'513300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'513400', N'510000', N'#510000#|#513400#', N'513400', N'凉山彝族自治州', N'lsyzzzz', N'513400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'520000', N'0', N'#520000#', N'520000', N'贵州省', N'gzs', N'520000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'520100', N'520000', N'#520000#|#520100#', N'520100', N'贵阳市', N'gys', N'520100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'520200', N'520000', N'#520000#|#520200#', N'520200', N'六盘水市', N'lpss', N'520200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'520300', N'520000', N'#520000#|#520300#', N'520300', N'遵义市', N'zys', N'520300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'520400', N'520000', N'#520000#|#520400#', N'520400', N'安顺市', N'ass', N'520400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'522200', N'520000', N'#520000#|#522200#', N'522200', N'铜仁市', N'trs', N'522200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'522300', N'520000', N'#520000#|#522300#', N'522300', N'黔西南布依族苗族自治州', N'qxnbyzmzzzz', N'522300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'522400', N'520000', N'#520000#|#522400#', N'522400', N'毕节市', N'bjs', N'522400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'522600', N'520000', N'#520000#|#522600#', N'522600', N'黔东南苗族侗族自治州', N'qdnmztzzzz', N'522600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'522700', N'520000', N'#520000#|#522700#', N'522700', N'黔南布依族苗族自治州', N'qnbyzmzzzz', N'522700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530000', N'0', N'#530000#', N'530000', N'云南省', N'yns', N'530000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530100', N'530000', N'#530000#|#530100#', N'530100', N'昆明市', N'kms', N'530100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530300', N'530000', N'#530000#|#530300#', N'530300', N'曲靖市', N'qjs', N'530300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530400', N'530000', N'#530000#|#530400#', N'530400', N'玉溪市', N'yxs', N'530400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530500', N'530000', N'#530000#|#530500#', N'530500', N'保山市', N'bss', N'530500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530600', N'530000', N'#530000#|#530600#', N'530600', N'昭通市', N'zts', N'530600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530700', N'530000', N'#530000#|#530700#', N'530700', N'丽江市', N'ljs', N'530700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530800', N'530000', N'#530000#|#530800#', N'530800', N'普洱市', N'pes', N'530800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'530900', N'530000', N'#530000#|#530900#', N'530900', N'临沧市', N'lcs', N'530900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'532300', N'530000', N'#530000#|#532300#', N'532300', N'楚雄彝族自治州', N'cxyzzzz', N'532300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'532500', N'530000', N'#530000#|#532500#', N'532500', N'红河哈尼族彝族自治州', N'hhhnzyzzzz', N'532500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'532600', N'530000', N'#530000#|#532600#', N'532600', N'文山壮族苗族自治州', N'wszzmzzzz', N'532600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'532800', N'530000', N'#530000#|#532800#', N'532800', N'西双版纳傣族自治州', N'xsbndzzzz', N'532800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'532900', N'530000', N'#530000#|#532900#', N'532900', N'大理白族自治州', N'dlbzzzz', N'532900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'533100', N'530000', N'#530000#|#533100#', N'533100', N'德宏傣族景颇族自治州', N'dhdzjpzzzz', N'533100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'533300', N'530000', N'#530000#|#533300#', N'533300', N'怒江傈僳族自治州', N'njlszzzz', N'533300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'533400', N'530000', N'#530000#|#533400#', N'533400', N'迪庆藏族自治州', N'dqzzzzz', N'533400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'540000', N'0', N'#540000#', N'540000', N'西藏自治区', N'xzzzq', N'540000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'540100', N'540000', N'#540000#|#540100#', N'540100', N'拉萨市', N'lss', N'540100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'542100', N'540000', N'#540000#|#542100#', N'542100', N'昌都地区', N'cddq', N'542100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'542200', N'540000', N'#540000#|#542200#', N'542200', N'山南地区', N'sndq', N'542200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'542300', N'540000', N'#540000#|#542300#', N'542300', N'日喀则地区', N'rkzdq', N'542300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'542400', N'540000', N'#540000#|#542400#', N'542400', N'那曲地区', N'nqdq', N'542400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'542500', N'540000', N'#540000#|#542500#', N'542500', N'阿里地区', N'aldq', N'542500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'542600', N'540000', N'#540000#|#542600#', N'542600', N'林芝地区', N'lzdq', N'542600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610000', N'0', N'#610000#', N'610000', N'陕西省', N'sxs', N'610000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610100', N'610000', N'#610000#|#610100#', N'610100', N'西安市', N'xas', N'610100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610200', N'610000', N'#610000#|#610200#', N'610200', N'铜川市', N'tcs', N'610200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610300', N'610000', N'#610000#|#610300#', N'610300', N'宝鸡市', N'bjs', N'610300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610400', N'610000', N'#610000#|#610400#', N'610400', N'咸阳市', N'xys', N'610400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610500', N'610000', N'#610000#|#610500#', N'610500', N'渭南市', N'wns', N'610500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610600', N'610000', N'#610000#|#610600#', N'610600', N'延安市', N'yas', N'610600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610700', N'610000', N'#610000#|#610700#', N'610700', N'汉中市', N'hzs', N'610700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610800', N'610000', N'#610000#|#610800#', N'610800', N'榆林市', N'yls', N'610800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'610900', N'610000', N'#610000#|#610900#', N'610900', N'安康市', N'aks', N'610900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'611000', N'610000', N'#610000#|#611000#', N'611000', N'商洛市', N'sls', N'611000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620000', N'0', N'#620000#', N'620000', N'甘肃省', N'gss', N'620000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620100', N'620000', N'#620000#|#620100#', N'620100', N'兰州市', N'lzs', N'620100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620200', N'620000', N'#620000#|#620200#', N'620200', N'嘉峪关市', N'jygs', N'620200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620300', N'620000', N'#620000#|#620300#', N'620300', N'金昌市', N'jcs', N'620300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620400', N'620000', N'#620000#|#620400#', N'620400', N'白银市', N'bys', N'620400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620500', N'620000', N'#620000#|#620500#', N'620500', N'天水市', N'tss', N'620500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620600', N'620000', N'#620000#|#620600#', N'620600', N'武威市', N'wws', N'620600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620700', N'620000', N'#620000#|#620700#', N'620700', N'张掖市', N'zys', N'620700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620800', N'620000', N'#620000#|#620800#', N'620800', N'平凉市', N'pls', N'620800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'620900', N'620000', N'#620000#|#620900#', N'620900', N'酒泉市', N'jqs', N'620900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'621000', N'620000', N'#620000#|#621000#', N'621000', N'庆阳市', N'qys', N'621000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'621100', N'620000', N'#620000#|#621100#', N'621100', N'定西市', N'dxs', N'621100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'621200', N'620000', N'#620000#|#621200#', N'621200', N'陇南市', N'lns', N'621200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'622900', N'620000', N'#620000#|#622900#', N'622900', N'临夏回族自治州', N'lxhzzzz', N'622900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'623000', N'620000', N'#620000#|#623000#', N'623000', N'甘南藏族自治州', N'gnzzzzz', N'623000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'630000', N'0', N'#630000#', N'630000', N'青海省', N'qhs', N'630000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'630100', N'630000', N'#630000#|#630100#', N'630100', N'西宁市', N'xns', N'630100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'632100', N'630000', N'#630000#|#632100#', N'632100', N'海东市', N'hds', N'632100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'632200', N'630000', N'#630000#|#632200#', N'632200', N'海北藏族自治州', N'hbzzzzz', N'632200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'632300', N'630000', N'#630000#|#632300#', N'632300', N'黄南藏族自治州', N'hnzzzzz', N'632300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'632500', N'630000', N'#630000#|#632500#', N'632500', N'海南藏族自治州', N'hnzzzzz', N'632500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'632600', N'630000', N'#630000#|#632600#', N'632600', N'果洛藏族自治州', N'glzzzzz', N'632600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'632700', N'630000', N'#630000#|#632700#', N'632700', N'玉树藏族自治州', N'yszzzzz', N'632700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'632800', N'630000', N'#630000#|#632800#', N'632800', N'海西蒙古族藏族自治州', N'hxmgzzzzzz', N'632800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'640000', N'0', N'#640000#', N'640000', N'宁夏回族自治区', N'nxhzzzq', N'640000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'640100', N'640000', N'#640000#|#640100#', N'640100', N'银川市', N'ycs', N'640100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'640200', N'640000', N'#640000#|#640200#', N'640200', N'石嘴山市', N'szss', N'640200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'640300', N'640000', N'#640000#|#640300#', N'640300', N'吴忠市', N'wzs', N'640300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'640400', N'640000', N'#640000#|#640400#', N'640400', N'固原市', N'gys', N'640400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'640500', N'640000', N'#640000#|#640500#', N'640500', N'中卫市', N'zws', N'640500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'650000', N'0', N'#650000#', N'650000', N'新疆维吾尔自治区', N'xjwwezzq', N'650000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'650100', N'650000', N'#650000#|#650100#', N'650100', N'乌鲁木齐市', N'wlmqs', N'650100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'650200', N'650000', N'#650000#|#650200#', N'650200', N'克拉玛依市', N'klmys', N'650200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'652100', N'650000', N'#650000#|#652100#', N'652100', N'吐鲁番地区', N'tlfdq', N'652100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'652200', N'650000', N'#650000#|#652200#', N'652200', N'哈密地区', N'hmdq', N'652200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'652300', N'650000', N'#650000#|#652300#', N'652300', N'昌吉回族自治州', N'cjhzzzz', N'652300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'652700', N'650000', N'#650000#|#652700#', N'652700', N'博尔塔拉蒙古自治州', N'betlmgzzz', N'652700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'652800', N'650000', N'#650000#|#652800#', N'652800', N'巴音郭楞蒙古自治州', N'byglmgzzz', N'652800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'652900', N'650000', N'#650000#|#652900#', N'652900', N'阿克苏地区', N'aksdq', N'652900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'653000', N'650000', N'#650000#|#653000#', N'653000', N'克孜勒苏柯尔克孜自治州', N'kzlskekzzzz', N'653000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'653100', N'650000', N'#650000#|#653100#', N'653100', N'喀什地区', N'ksdq', N'653100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'653200', N'650000', N'#650000#|#653200#', N'653200', N'和田地区', N'htdq', N'653200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'654000', N'650000', N'#650000#|#654000#', N'654000', N'伊犁哈萨克自治州', N'ylhskzzz', N'654000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'654200', N'650000', N'#650000#|#654200#', N'654200', N'塔城地区', N'tcdq', N'654200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'654300', N'650000', N'#650000#|#654300#', N'654300', N'阿勒泰地区', N'altdq', N'654300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'810000', N'0', N'#810000#', N'810000', N'香港特别行政区', N'xgtbxzq', N'810000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'810100', N'810000', N'#810000#|#810100#', N'810100', N'香港岛', N'xgd', N'810100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'810200', N'810000', N'#810000#|#810200#', N'810200', N'九龙', N'jl', N'810200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'810300', N'810000', N'#810000#|#810300#', N'810300', N'新界', N'xj', N'810300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'820000', N'0', N'#820000#', N'820000', N'澳门特别行政区', N'amtbxzq', N'820000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'820100', N'820000', N'#820000#|#820100#', N'820100', N'澳门半岛', N'ambd', N'820100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'820300', N'820000', N'#820000#|#820300#', N'820300', N'路环岛', N'lhd', N'820300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'820400', N'820000', N'#820000#|#820400#', N'820400', N'凼仔岛', N'dzd', N'820400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830000', N'0', N'#830000#', N'830000', N'台湾省', N'tws', N'830000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830100', N'830000', N'#830000#|#830100#', N'830100', N'台北市', N'tbs', N'830100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830200', N'830000', N'#830000#|#830200#', N'830200', N'高雄市', N'gxs', N'830200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830300', N'830000', N'#830000#|#830300#', N'830300', N'台南市', N'tns', N'830300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830400', N'830000', N'#830000#|#830400#', N'830400', N'台中市', N'tzs', N'830400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830500', N'830000', N'#830000#|#830500#', N'830500', N'南投县', N'ntx', N'830500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830600', N'830000', N'#830000#|#830600#', N'830600', N'基隆市', N'jls', N'830600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830700', N'830000', N'#830000#|#830700#', N'830700', N'新竹市', N'xzs', N'830700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830800', N'830000', N'#830000#|#830800#', N'830800', N'嘉义市', N'jys', N'830800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'830900', N'830000', N'#830000#|#830900#', N'830900', N'宜兰县', N'ylx', N'830900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831000', N'830000', N'#830000#|#831000#', N'831000', N'新竹县', N'xzx', N'831000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831100', N'830000', N'#830000#|#831100#', N'831100', N'桃园县', N'tyx', N'831100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831200', N'830000', N'#830000#|#831200#', N'831200', N'苗栗县', N'mlx', N'831200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831300', N'830000', N'#830000#|#831300#', N'831300', N'彰化县', N'zhx', N'831300', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831400', N'830000', N'#830000#|#831400#', N'831400', N'嘉义县', N'jyx', N'831400', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831500', N'830000', N'#830000#|#831500#', N'831500', N'云林县', N'ylx', N'831500', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831600', N'830000', N'#830000#|#831600#', N'831600', N'屏东县', N'pdx', N'831600', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831700', N'830000', N'#830000#|#831700#', N'831700', N'台东县', N'tdx', N'831700', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831800', N'830000', N'#830000#|#831800#', N'831800', N'花莲县', N'hlx', N'831800', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'831900', N'830000', N'#830000#|#831900#', N'831900', N'澎湖县', N'phx', N'831900', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'832000', N'830000', N'#830000#|#832000#', N'832000', N'新北市', N'xbs', N'832000', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'832100', N'830000', N'#830000#|#832100#', N'832100', N'台中县', N'tzx', N'832100', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Bas_Region] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SimpleSpelling], [F_SortNum], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'832200', N'830000', N'#830000#|#832200#', N'832200', N'连江县', N'ljx', N'832200', N'0', N'1', null, null, null, null, null, null, null, null, null, null, null)
GO
GO

-- ----------------------------
-- Table structure for Sys_Alarm
-- ----------------------------
DROP TABLE [dbo].[Sys_Alarm]
GO
CREATE TABLE [dbo].[Sys_Alarm] (
[F_Id] varchar(36) NOT NULL ,
[F_SourceType] varchar(36) NULL ,
[F_SourceNo] varchar(36) NULL ,
[F_AlarmType] int NULL ,
[F_Reason] nvarchar(200) NULL ,
[F_Time] datetime NULL ,
[F_Remark] nvarchar(200) NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警信息表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警信息表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_SourceType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警源类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_SourceType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警源类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_SourceType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_SourceNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警源编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_SourceNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警源编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_SourceNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_AlarmType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_AlarmType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_AlarmType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_Reason')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警原因'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Reason'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警原因'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Reason'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_Time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Alarm', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Alarm'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_Alarm
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_Configs
-- ----------------------------
DROP TABLE [dbo].[Sys_Configs]
GO
CREATE TABLE [dbo].[Sys_Configs] (
[F_Id] varchar(36) NOT NULL ,
[F_Group] varchar(36) NULL ,
[F_Name] varchar(36) NULL ,
[F_Key] varchar(36) NULL ,
[F_Value] varchar(200) NULL ,
[F_Description] varchar(200) NULL ,
[F_Remark] varchar(200) NULL ,
[F_SortNum] int NULL ,
[F_LastModifyUserId] varchar(36) NULL ,
[F_LastModifyTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] datetime NULL ,
[F_ValueType] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统配置表
   对于系统的配置信息存储到数据库中的表
   主要是为了给用户提供一个可以通过界面管理的功能，同时方面在sql存储过程或者函数中用到相关的地址之类的信息时，可以直接使用。'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统配置表
   对于系统的配置信息存储到数据库中的表
   主要是为了给用户提供一个可以通过界面管理的功能，同时方面在sql存储过程或者函数中用到相关的地址之类的信息时，可以直接使用。'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Group')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配置组名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Group'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配置组名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Group'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配置的名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配置的名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Key')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配置的key值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Key'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配置的key值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Key'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Value')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配置Value'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Value'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配置Value'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Value'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Description'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_LastModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_LastModifyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Configs', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Configs'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO

-- ----------------------------
-- Records of Sys_Configs
-- ----------------------------
INSERT INTO [dbo].[Sys_Configs] ([F_Id], [F_Group], [F_Name], [F_Key], [F_Value], [F_Description], [F_Remark], [F_SortNum], [F_LastModifyUserId], [F_LastModifyTime], [F_Field1], [F_Field2], [F_Field3], [F_ValueType]) VALUES (N'1', N'test', N'测试', N'testConfig', N'1sad', null, null, N'1', N'admin', N'2018-03-28 16:55:17.643', null, null, null, N'text')
GO
GO

-- ----------------------------
-- Table structure for Sys_DbBackup
-- ----------------------------
DROP TABLE [dbo].[Sys_DbBackup]
GO
CREATE TABLE [dbo].[Sys_DbBackup] (
[F_Id] varchar(36) NOT NULL ,
[F_DbName] varchar(60) NULL ,
[F_FileName] nvarchar(60) NULL ,
[F_FileSize] float(53) NULL ,
[F_FilePath] nvarchar(200) NULL ,
[F_BackupTime] datetime NULL ,
[F_EnabledFlag] int NULL ,
[F_DeleteFlag] int NULL ,
[F_Description] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_DeleteUserId] varchar(36) NULL ,
[F_DeleteTime] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据库备份表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据库备份表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_DbName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据库名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_DbName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据库名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_DbName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_FileName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_FileName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_FileName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_FileSize')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件大小'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_FileSize'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件大小'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_FileSize'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_FilePath')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_FilePath'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_FilePath'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_BackupTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备份时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_BackupTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备份时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_BackupTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_EnabledFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_DeleteFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_Description'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_DeleteUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DbBackup', 
'COLUMN', N'F_DeleteTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DbBackup'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
GO

-- ----------------------------
-- Records of Sys_DbBackup
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_Dict
-- ----------------------------
DROP TABLE [dbo].[Sys_Dict]
GO
CREATE TABLE [dbo].[Sys_Dict] (
[F_Id] varchar(36) NOT NULL ,
[F_ParentId] varchar(36) NULL ,
[F_Layers] nvarchar(200) NULL ,
[F_Code] varchar(60) NULL ,
[F_Name] nvarchar(60) NULL ,
[F_SortNum] int NULL ,
[F_EnableDelete] int NULL ,
[F_DeleteFlag] int NULL ,
[F_EnabledFlag] int NULL ,
[F_Description] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_LastModifyUserId] varchar(36) NULL ,
[F_LastModifyTime] datetime NULL ,
[F_DeleteUserId] varchar(36) NULL ,
[F_DeleteTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字典表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字典表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_ParentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Layers')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Code')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Code'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Code'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_EnableDelete')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_DeleteFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_EnabledFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Description'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_LastModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_LastModifyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_DeleteUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_DeleteTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Dict', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Dict'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_Dict
-- ----------------------------
INSERT INTO [dbo].[Sys_Dict] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'menuTypeDict', N'0', N'#menuTypeDict#', N'menuType', N'菜单类型', N'2', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:55:35.000', N'admin', N'2018-03-12 18:11:52.747', null, null, null, N'', N'', N'1900-01-01 00:00:00.000')
GO
GO
INSERT INTO [dbo].[Sys_Dict] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'organizeTypeDict', N'0', N'#organizeTypeDict#', N'organizeType', N'组织类型', N'1', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:55:35.000', null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Dict] ([F_Id], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'testDict', N'0', N'#testDict#', N'systemType', N'系统类型', N'1', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:55:35.000', N'admin', N'2018-03-27 17:20:51.723', null, null, null, null, null, null)
GO
GO

-- ----------------------------
-- Table structure for Sys_DictItem
-- ----------------------------
DROP TABLE [dbo].[Sys_DictItem]
GO
CREATE TABLE [dbo].[Sys_DictItem] (
[F_Id] varchar(36) NOT NULL ,
[F_DictId] varchar(36) NULL ,
[F_ParentId] varchar(36) NULL ,
[F_Layers] varchar(200) NULL ,
[F_Code] varchar(60) NULL ,
[F_Name] nvarchar(60) NULL ,
[F_IsDefault] int NULL ,
[F_SortNum] int NULL ,
[F_EnableDelete] int NULL ,
[F_DeleteFlag] int NULL ,
[F_EnabledFlag] int NULL ,
[F_Description] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_LastModifyUserId] varchar(36) NULL ,
[F_LastModifyTime] datetime NULL ,
[F_DeleteUserId] varchar(36) NULL ,
[F_DeleteTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字典值表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字典值表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_DictId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字典主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_DictId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字典主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_DictId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_ParentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Layers')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Code')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Code'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Code'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_IsDefault')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否默认'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_IsDefault'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否默认'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_IsDefault'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_EnableDelete')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_DeleteFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_EnabledFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Description'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_LastModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_LastModifyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_DeleteUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_DeleteTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_DictItem', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_DictItem'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_DictItem
-- ----------------------------
INSERT INTO [dbo].[Sys_DictItem] ([F_Id], [F_DictId], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_IsDefault], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'menuTypeDictItem1', N'menuTypeDict', N'0', N'#menuTypeDictItem1#', N'1', N'模块', N'0', N'0', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:56:45.000', null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_DictItem] ([F_Id], [F_DictId], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_IsDefault], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'menuTypeDictItem2', N'menuTypeDict', N'0', N'#menuTypeDictItem2#', N'2', N'功能', N'0', N'0', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:56:45.000', null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_DictItem] ([F_Id], [F_DictId], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_IsDefault], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'menuTypeDictItem3', N'menuTypeDict', N'0', N'#menuTypeDictItem3#', N'3', N'按钮', N'0', N'0', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:56:45.000', null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_DictItem] ([F_Id], [F_DictId], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_IsDefault], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'organizeTypeDictItem1', N'organizeTypeDict', N'0', N'#organizeTypeDictItem1#', N'1', N'机构', N'0', N'1', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:55:35.000', null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_DictItem] ([F_Id], [F_DictId], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_IsDefault], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'organizeTypeDictItem2', N'organizeTypeDict', N'0', N'#organizeTypeDictItem2#', N'2', N'部门', N'0', N'1', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:55:35.000', null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_DictItem] ([F_Id], [F_DictId], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_IsDefault], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'testDictitem1', N'testDict', N'0', N'#testDict#', N'thisSystem', N'当前系统', N'1', N'1', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:56:45.000', N'admin', N'2018-03-27 17:18:43.367', null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_DictItem] ([F_Id], [F_DictId], [F_ParentId], [F_Layers], [F_Code], [F_Name], [F_IsDefault], [F_SortNum], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'testDictitem2', N'testDict', N'0', N'#testDict#', N'otherSystem', N'其他系统', N'0', N'2', N'0', N'0', N'1', null, N'admin', N'2018-01-08 13:56:45.000', N'admin', N'2018-03-27 17:19:02.990', null, null, null, N'', N'', N'1900-01-01 00:00:00.000')
GO
GO

-- ----------------------------
-- Table structure for Sys_Logs
-- ----------------------------
DROP TABLE [dbo].[Sys_Logs]
GO
CREATE TABLE [dbo].[Sys_Logs] (
[F_Id] varchar(36) NOT NULL ,
[F_System] varchar(36) NULL ,
[F_Module] nvarchar(36) NULL ,
[F_OptType] nvarchar(10) NULL ,
[F_OptContent] nvarchar(MAX) NULL ,
[F_IPAddress] nvarchar(36) NULL ,
[F_IPCity] nvarchar(36) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统日志表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统日志表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_System')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_System'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_System'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_Module')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'功能模块'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Module'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'功能模块'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Module'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_OptType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_OptType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_OptType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_OptContent')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作说明'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_OptContent'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作说明'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_OptContent'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_IPAddress')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'IP地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_IPAddress'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'IP地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_IPAddress'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_IPCity')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'IP城市'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_IPCity'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'IP城市'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_IPCity'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Logs', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Logs'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_Logs
-- ----------------------------
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'07c60e41-4b75-4fb8-b5f8-788560e80fba', N'thisSystem', N'系统管理>组织管理', N'修改', N'{"F_Id":"8a0038d9-634d-4e57-97f4-92f0d3a4c775","F_Name":"技术部002","F_ParentId":"0","F_Layers":"#ccead0ae-2997-4c9b-898d-d06bfdc0df2f#|#8a0038d9-634d-4e57-97f4-92f0d3a4c775#","F_Type":2,"F_Code":"JSB02","F_ShortName":"技术部02","F_ManagerId":null,"F_Phone":null,"F_Address":null,"F_EnableDelete":1,"F_SortNum":1,"F_EnabledFlag":1,"F_DeleteFlag":0,"F_Description":null,"F_CreateUserId":null,"F_CreateTime":null,"F_LastModifyUserId":"admin","F_LastModifyTime":"2018-07-16 16:48:13","F_DeleteUserId":null,"F_DeleteTime":null,"F_Field1":null,"F_Field2":null,"F_Field3":null,"F_Field4":null}', N'192.168.1.214', N'XX 内网IP', N'admin', N'2018-07-16 16:48:13.327', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'08df92d5-bac7-4157-a93e-c31285ec44e9', N'thisSystem', N'系统管理>菜单按钮管理', N'添加', N'{"F_Id":"f96a9d11-3b28-4580-a442-499bb2f7208d","F_ParentId":"5cd25a40-42a5-4818-a1a9-6f65c641c7d1","F_Layers":"#76447f4c-6449-43b8-a5e5-225f4141bff0#|#5cd25a40-42a5-4818-a1a9-6f65c641c7d1#|#f96a9d11-3b28-4580-a442-499bb2f7208d#","F_Type":3,"F_Code":"btnAdd","F_Name":"添加按钮","F_Icon":"fa fa-plus","F_Location":null,"F_Event":"add()","F_Url":null,"F_SortNum":1,"F_EnableDelete":1,"F_EnabledFlag":1,"F_DeleteFlag":0,"F_Remark":null,"F_CreateUserId":"admin","F_CreateTime":"2018-03-29 18:12:22","F_LastModifyUserId":null,"F_LastModifyTime":null,"F_DeleteUserId":null,"F_DeleteTime":null}', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-03-29 18:12:23.080', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'29210558-6926-4820-aead-6b79a9f1d2b3', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.214', N'XX 内网IP', N'admin', N'2018-07-16 16:44:31.563', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'2bde0895-2455-42a2-bbf1-f88554a16506', N'toolSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录小工具系统。', N'192.168.1.212', null, N'admin', N'2018-09-17 09:44:20.423', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'35e3909d-3da8-4a07-890f-e79832128957', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.214', N'XX 内网IP', N'admin', N'2018-07-16 17:25:37.530', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'36b1bf37-88ce-43cb-b297-d564df627837', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.214', N'XX 内网IP', N'admin', N'2018-07-16 17:23:14.747', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'4092a020-4b51-4a41-b643-0d375715850e', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'', N'', N'admin', N'2018-09-21 16:47:23.433', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'46ba923d-9192-4fcb-94e2-2f7f9bd81b79', N'thisSystem', N'系统管理>角色管理', N'赋予权限', N'系统管理员角色(094cc9fa-72f9-46c8-a188-1d918f69b2b8)修改权限信息：76447f4c-6449-43b8-a5e5-225f4141bff0;054514d8-9779-4303-8543-e7d603d6b2cd;17511ba7-5a29-415a-b568-d4307ca82904;47d206ab-ae0c-4d37-90f9-814a5a780e24;eb078a3a-cc0b-4e30-9a66-a5c6c2b40543;eb48b541-de85-4a0f-ab9c-68ec68d38962;325d12db-84ba-40ec-8e78-6721d28a246e;17206257-6b98-418d-8f00-7ce00049579a;ac13795d-dd62-41cd-85dd-e23162f7ad02;5cd25a40-42a5-4818-a1a9-6f65c641c7d1;00c5b6ce-8fb9-44e0-814f-ba9129b8ff54;34bad1f8-510b-4ca7-9cc6-ce7efd6f4d7b;66022a98-5127-47fe-8f54-07d34b3d5cfc;fb710c81-a59f-4a04-9423-fe6e852cd1bf;76447f4c-6449-43b8-a5e5-225f4141bff1;105a09ef-f78d-4091-a8a3-823b6e01f305;216429d6-dafd-4302-91b8-ca0d82562774;76447f4c-6449-43b8-a5e5-225f4141bf22;af438db7-93b3-4416-9240-58b3852eca4f;bb8e70de-528c-47de-b83a-d6a54779b7aa;ce64aa8d-6c10-4a9a-ae19-e72d17fe8be2;cf4498bd-048c-4c6d-95fa-91cce6813725;76447f4c-6449-43b8-a5e5-225f4141bff2;250c3902-88cb-4d73-99e4-d41d76f562c6;382a7310-9ad9-4b2c-a145-c635e3923ceb;428e547a-24e8-4e73-877c', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-06-23 14:57:30.197', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'52ff0538-40ee-4c17-849d-b79f94041ce5', N'thisSystem', N'系统管理>系统设置', N'修改', N'修改后配置为：', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-03-29 18:20:29.467', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'546e68de-610c-4740-aada-bb5afc5d117c', N'thisSystem', N'系统管理>组织管理', N'修改', N'{"F_Id":"8a0038d9-634d-4e57-97f4-92f0d3a4c775","F_Name":"技术部002","F_ParentId":"ccead0ae-2997-4c9b-898d-d06bfdc0df2f","F_Layers":"#8a0038d9-634d-4e57-97f4-92f0d3a4c775#","F_Type":2,"F_Code":"JSB02","F_ShortName":"技术部02","F_ManagerId":null,"F_Phone":null,"F_Address":null,"F_EnableDelete":1,"F_SortNum":1,"F_EnabledFlag":1,"F_DeleteFlag":0,"F_Description":null,"F_CreateUserId":null,"F_CreateTime":null,"F_LastModifyUserId":"admin","F_LastModifyTime":"2018-07-16 16:48:34","F_DeleteUserId":null,"F_DeleteTime":null,"F_Field1":null,"F_Field2":null,"F_Field3":null,"F_Field4":null}', N'192.168.1.214', N'XX 内网IP', N'admin', N'2018-07-16 16:48:34.937', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'5b516f10-ed41-4465-b432-f88bba33f7bc', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-03-30 18:03:19.510', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'64146a22-25d0-429d-8361-e79a37806915', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.108', N'XX 内网IP', N'admin', N'2018-07-13 15:07:07.177', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'844f6e09-ece5-4024-8a3a-94f6fca4ad49', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.214', N'XX 内网IP', N'admin', N'2018-07-16 17:34:13.500', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'88ebf973-cda7-4e36-8c6e-22ae0f080089', N'thisSystem', N'系统管理>菜单管理', N'添加', N'{"F_Id":"4d519456-5779-4349-8fdd-3addf7d094ed","F_ParentId":"c26ffd0c-61a5-47e1-b276-78d94248cf95","F_Layers":"#c26ffd0c-61a5-47e1-b276-78d94248cf95#|#4d519456-5779-4349-8fdd-3addf7d094ed#","F_Type":2,"F_Code":"0012","F_Name":"1232","F_Icon":"fa fa-bath","F_Location":null,"F_Event":null,"F_Url":null,"F_SortNum":2,"F_EnableDelete":1,"F_EnabledFlag":1,"F_DeleteFlag":0,"F_Remark":null,"F_CreateUserId":"admin","F_CreateTime":"2018-06-23 14:58:11","F_LastModifyUserId":null,"F_LastModifyTime":null,"F_DeleteUserId":null,"F_DeleteTime":null}', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-06-23 14:58:11.957', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'8d553537-7872-421e-aa0a-d95825b09421', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.214', N'XX 内网IP', N'admin', N'2018-07-16 18:00:42.383', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'8e6ccca0-d9a6-4e3a-a91e-3796671aa5da', N'thisSystem', N'系统管理>菜单管理', N'修改', N'{"F_Id":"76447f4c-6449-43b8-a5e5-225f4141bff0","F_ParentId":"0","F_Layers":"#76447f4c-6449-43b8-a5e5-225f4141bff0#","F_Type":1,"F_Code":"moduleSys","F_Name":"系统管理","F_Icon":"fa fa-window-maximize","F_Location":null,"F_Event":null,"F_Url":null,"F_SortNum":3,"F_EnableDelete":0,"F_EnabledFlag":1,"F_DeleteFlag":0,"F_Remark":null,"F_CreateUserId":null,"F_CreateTime":null,"F_LastModifyUserId":"admin","F_LastModifyTime":"2018-06-23 14:57:48","F_DeleteUserId":null,"F_DeleteTime":null}', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-06-23 14:57:48.977', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'a628992e-3e24-47df-9458-2a952d153c90', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'', N'', N'admin', N'2019-01-07 15:24:17.897', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'a7d532f2-276e-4401-92db-3841a92afd77', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.214', N'XX 内网IP', N'admin', N'2018-07-16 16:09:17.187', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'b51df951-4dfc-48c9-8156-e91b5f24d5cf', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.212', N'XX 内网IP', N'admin', N'2018-09-17 09:39:46.957', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'ba321c95-5f3b-4385-a4e4-900601b986bb', N'toolSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录小工具系统。', N'192.168.1.212', null, N'admin', N'2018-09-17 10:29:47.677', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'c1b0cabe-1a0f-47ad-a436-e802749d8fbd', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-03-29 18:19:43.913', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'c2ec31b5-1936-47c2-ade0-49ca8bf092c0', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-03-29 18:44:34.977', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'ee6b9050-e561-4f07-9316-7e5199970db6', N'thisSystem', N'系统管理>菜单管理', N'添加', N'{"F_Id":"397ec93f-103f-4ee2-8dbe-449170f61e7c","F_ParentId":"7a016d9e-1b20-4a7e-bdce-a95a55576094","F_Layers":"#7a016d9e-1b20-4a7e-bdce-a95a55576094#|#397ec93f-103f-4ee2-8dbe-449170f61e7c#","F_Type":2,"F_Code":"0021","F_Name":"测试功能22","F_Icon":"fa fa-user","F_Location":null,"F_Event":null,"F_Url":null,"F_SortNum":1,"F_EnableDelete":1,"F_EnabledFlag":1,"F_DeleteFlag":0,"F_Remark":null,"F_CreateUserId":"admin","F_CreateTime":"2018-06-23 14:56:44","F_LastModifyUserId":null,"F_LastModifyTime":null,"F_DeleteUserId":null,"F_DeleteTime":null}', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-06-23 14:56:44.277', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'ee9bf9e8-49f8-4818-aa8a-c859e91aa062', N'thisSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录系统。', N'192.168.1.213', N'XX 内网IP', N'admin', N'2018-03-29 17:11:09.910', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Logs] ([F_Id], [F_System], [F_Module], [F_OptType], [F_OptContent], [F_IPAddress], [F_IPCity], [F_CreateUserId], [F_CreateTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'fe29d77b-b890-43a1-8e0a-88ea3806ef0f', N'toolSystem', N'登录注销', N'登录', N'用户月夜最牛逼(admin)登录小工具系统。', N'192.168.1.212', null, N'admin', N'2018-09-17 10:32:01.397', null, null, null, null)
GO
GO

-- ----------------------------
-- Table structure for Sys_Menu
-- ----------------------------
DROP TABLE [dbo].[Sys_Menu]
GO
CREATE TABLE [dbo].[Sys_Menu] (
[F_Id] varchar(36) NOT NULL ,
[F_ParentId] varchar(36) NULL ,
[F_Layers] varchar(200) NULL ,
[F_Type] int NULL ,
[F_Code] varchar(36) NULL ,
[F_Name] nvarchar(36) NULL ,
[F_Icon] nvarchar(36) NULL ,
[F_Location] varchar(36) NULL ,
[F_Event] nvarchar(36) NULL ,
[F_Url] nvarchar(200) NULL ,
[F_SortNum] int NULL ,
[F_EnableDelete] int NULL ,
[F_EnabledFlag] int NULL ,
[F_DeleteFlag] int NULL ,
[F_Remark] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_LastModifyUserId] varchar(36) NULL ,
[F_LastModifyTime] datetime NULL ,
[F_DeleteUserId] varchar(36) NULL ,
[F_DeleteTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL ,
[F_SystemCode] varchar(36) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统菜单表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统菜单表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_ParentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Layers')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模块、功能、按钮'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块、功能、按钮'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Code')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Code'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Code'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Icon')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'图标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Icon'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'图标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Icon'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Location')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Location'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Location'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Event')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'事件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Event'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'事件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Event'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Url')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'连接'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Url'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'连接'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Url'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_EnableDelete')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_EnabledFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_DeleteFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_LastModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_LastModifyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_DeleteUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_DeleteTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Menu', 
'COLUMN', N'F_SystemCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_SystemCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Menu'
, @level2type = 'COLUMN', @level2name = N'F_SystemCode'
GO

-- ----------------------------
-- Records of Sys_Menu
-- ----------------------------
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'00c5b6ce-8fb9-44e0-814f-ba9129b8ff54', N'5cd25a40-42a5-4818-a1a9-6f65c641c7d1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#5cd25a40-42a5-4818-a1a9-6f65c641c7d1#|#00c5b6ce-8fb9-44e0-814f-ba9129b8ff54#', N'3', N'btnEdit', N'修改', N'fa fa-pencil', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:52:54.990', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'054514d8-9779-4303-8543-e7d603d6b2cd', N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#054514d8-9779-4303-8543-e7d603d6b2cd#', N'2', N'funcQuarters', N'岗位管理', N'fa fa-street-view', null, null, N'WebApp/SysManager/Quarters/Index.aspx', N'4', N'0', N'1', N'0', null, N'admin', N'2018-03-07 08:47:56.880', N'admin', N'2018-03-26 16:38:36.743', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'055a8567-6c6d-44be-8fdf-8e10cba1ed3a', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#|#055a8567-6c6d-44be-8fdf-8e10cba1ed3a#', N'3', N'btnAdd', N'添加', N'fa fa-plus', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:01:51.310', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'08bf1921-c512-43f5-8dd8-081c629846b6', N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#|#08bf1921-c512-43f5-8dd8-081c629846b6#', N'3', N'btnMenuManage', N'按钮管理', N'fa fa-cubes', null, null, null, N'4', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:50:13.930', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'105a09ef-f78d-4091-a8a3-823b6e01f305', N'76447f4c-6449-43b8-a5e5-225f4141bff1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff1#|#105a09ef-f78d-4091-a8a3-823b6e01f305#', N'3', N'btnReset', N'重置密码', N'fa fa-refresh', null, null, null, N'4', N'0', N'1', N'0', null, N'admin', N'2018-03-29 18:32:26.463', N'admin', N'2018-03-29 18:36:15.723', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'13f17d45-1704-4f6f-b031-0110146f3ed9', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#|#13f17d45-1704-4f6f-b031-0110146f3ed9#', N'3', N'btnDelete', N'删除', N'fa fa-remove', null, null, null, N'3', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:02:26.487', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'17206257-6b98-418d-8f00-7ce00049579a', N'325d12db-84ba-40ec-8e78-6721d28a246e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#325d12db-84ba-40ec-8e78-6721d28a246e#|#17206257-6b98-418d-8f00-7ce00049579a#', N'3', N'btnSubmit', N'保存', N'fa fa-save', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:04:11.893', N'admin', N'2018-03-29 19:37:01.330', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'17511ba7-5a29-415a-b568-d4307ca82904', N'054514d8-9779-4303-8543-e7d603d6b2cd', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#054514d8-9779-4303-8543-e7d603d6b2cd#|#17511ba7-5a29-415a-b568-d4307ca82904#', N'3', N'btnQuery', N'查询', N'fa fa-search', null, null, null, N'4', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:52:06.057', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'18febb11-9424-4395-9668-16ee1807eaa1', N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#|#18febb11-9424-4395-9668-16ee1807eaa1#', N'3', N'btnAddButton', N'添加(按钮管理)', N'fa fa-plus', null, null, null, N'6', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:09:58.970', N'admin', N'2018-03-29 19:10:09.037', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'19439ee5-f44b-4da8-ae9a-ba73e6326bd6', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#|#19439ee5-f44b-4da8-ae9a-ba73e6326bd6#', N'3', N'btnAddDict', N'添加(字典管理)', N'fa fa-plus', null, null, null, N'6', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:33:57.537', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'216429d6-dafd-4302-91b8-ca0d82562774', N'76447f4c-6449-43b8-a5e5-225f4141bff1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff1#|#216429d6-dafd-4302-91b8-ca0d82562774#', N'3', N'btnQuery', N'查询', N'fa fa-search', null, null, null, N'5', N'0', N'1', N'0', null, N'admin', N'2018-03-29 18:33:18.513', N'admin', N'2018-03-29 18:33:47.340', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'250c3902-88cb-4d73-99e4-d41d76f562c6', N'76447f4c-6449-43b8-a5e5-225f4141bff2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff2#|#250c3902-88cb-4d73-99e4-d41d76f562c6#', N'3', N'btnDelete', N'删除', N'fa fa-remove', null, null, null, N'3', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:38:02.723', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'27d38943-3f99-4ada-b531-b985ff4d3651', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#|#27d38943-3f99-4ada-b531-b985ff4d3651#', N'3', N'btnEditDict', N'修改(字典管理)', N'fa fa-pencil', null, null, null, N'7', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:34:25.717', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'325d12db-84ba-40ec-8e78-6721d28a246e', N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#325d12db-84ba-40ec-8e78-6721d28a246e#', N'2', N'funSet', N'系统设置', N'fa fa-wrench', null, null, N'WebApp/SysManager/Configs/Index.aspx', N'8', N'0', N'1', N'0', null, N'admin', N'2018-03-26 16:38:10.060', N'admin', N'2018-03-26 17:00:08.247', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'34bad1f8-510b-4ca7-9cc6-ce7efd6f4d7b', N'5cd25a40-42a5-4818-a1a9-6f65c641c7d1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#5cd25a40-42a5-4818-a1a9-6f65c641c7d1#|#34bad1f8-510b-4ca7-9cc6-ce7efd6f4d7b#', N'3', N'btnQuery', N'查询', N'fa fa-search', null, null, null, N'4', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:53:17.673', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'382a7310-9ad9-4b2c-a145-c635e3923ceb', N'76447f4c-6449-43b8-a5e5-225f4141bff2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff2#|#382a7310-9ad9-4b2c-a145-c635e3923ceb#', N'3', N'btnQuery', N'查询', N'fa fa-search', null, null, null, N'5', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:38:58.177', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'397ec93f-103f-4ee2-8dbe-449170f61e7c', N'7a016d9e-1b20-4a7e-bdce-a95a55576094', N'#7a016d9e-1b20-4a7e-bdce-a95a55576094#|#397ec93f-103f-4ee2-8dbe-449170f61e7c#', N'2', N'0021', N'测试功能22', N'fa fa-user', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-06-23 14:56:44.227', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'428e547a-24e8-4e73-877c-5a426610857c', N'76447f4c-6449-43b8-a5e5-225f4141bff2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff2#|#428e547a-24e8-4e73-877c-5a426610857c#', N'3', N'btnEdit', N'修改', N'fa fa-pencil', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:37:13.750', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'47d206ab-ae0c-4d37-90f9-814a5a780e24', N'054514d8-9779-4303-8543-e7d603d6b2cd', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#054514d8-9779-4303-8543-e7d603d6b2cd#|#47d206ab-ae0c-4d37-90f9-814a5a780e24#', N'3', N'btnAdd', N'添加', N'fa fa-plus', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:51:22.843', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'4d519456-5779-4349-8fdd-3addf7d094ed', N'c26ffd0c-61a5-47e1-b276-78d94248cf95', N'#c26ffd0c-61a5-47e1-b276-78d94248cf95#|#4d519456-5779-4349-8fdd-3addf7d094ed#', N'2', N'0012', N'1232', N'fa fa-bath', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-06-23 14:58:11.937', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'5cd25a40-42a5-4818-a1a9-6f65c641c7d1', N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#5cd25a40-42a5-4818-a1a9-6f65c641c7d1#', N'2', N'funcOrganize', N'组织架构', N'fa fa-sitemap', null, null, N'WebApp/SysManager/Organize/Index.aspx', N'5', N'0', N'1', N'0', null, N'admin', N'2018-03-07 15:09:54.140', N'admin', N'2018-03-26 16:38:31.440', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'66022a98-5127-47fe-8f54-07d34b3d5cfc', N'5cd25a40-42a5-4818-a1a9-6f65c641c7d1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#5cd25a40-42a5-4818-a1a9-6f65c641c7d1#|#66022a98-5127-47fe-8f54-07d34b3d5cfc#', N'3', N'btnAdd', N'添加', N'fa fa-plus', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:52:44.223', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'6880f1fa-ac73-4a4d-94ff-b0423d2c5d8c', N'b0074f2c-47ed-4640-971a-716f82281fb2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#b0074f2c-47ed-4640-971a-716f82281fb2#|#6880f1fa-ac73-4a4d-94ff-b0423d2c5d8c#', N'3', N'btnDelete', N'删除', N'fa fa-remove', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:54:30.373', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'6f532a01-ee48-45fe-ade8-2d11b2146207', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#|#6f532a01-ee48-45fe-ade8-2d11b2146207#', N'3', N'btnQuery', N'查询', N'fa fa-search', null, null, null, N'5', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:03:20.133', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'75dc0555-bb89-428a-94f0-4c3bea0adc03', N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#|#75dc0555-bb89-428a-94f0-4c3bea0adc03#', N'3', N'btnAdd', N'添加', N'fa fa-plus', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:47:51.867', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'76447f4c-6449-43b8-a5e5-225f4141bf22', N'76447f4c-6449-43b8-a5e5-225f4141bff1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff1#|#76447f4c-6449-43b8-a5e5-225f4141bf22#', N'3', N'btnAdd', N'添加', N'fa fa-plus', null, null, null, N'1', N'0', N'1', N'0', null, N'admin', N'2018-01-08 13:17:34.000', N'admin', N'2018-03-29 18:30:37.860', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#', N'1', N'moduleSys', N'系统管理', N'fa fa-window-maximize', null, null, null, N'3', N'0', N'1', N'0', null, N'admin', N'2018-01-08 12:17:30.000', N'admin', N'2018-06-23 14:57:48.900', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'76447f4c-6449-43b8-a5e5-225f4141bff1', N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff1#', N'2', N'funcUser', N'用户管理', N'fa fa-user', null, null, N'WebApp/SysManager/User/Index.aspx', N'1', N'0', N'1', N'0', null, N'admin', N'2018-01-08 13:17:34.000', N'admin', N'2018-03-28 19:57:39.603', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'76447f4c-6449-43b8-a5e5-225f4141bff2', N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff2#', N'2', N'funcRole', N'角色管理', N'fa fa-user-secret', null, null, N'WebApp/SysManager/Role/Index.aspx', N'2', N'0', N'1', N'0', null, N'admin', N'2018-01-08 13:17:34.000', N'admin', N'2018-03-27 13:49:35.213', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#', N'2', N'funcMenu', N'菜单管理', N'fa fa-th-large', null, null, N'WebApp/SysManager/Menu/Index.aspx', N'3', N'0', N'1', N'0', null, N'admin', N'2018-01-08 13:17:34.000', N'admin', N'2018-03-26 16:38:41.850', null, null, null, N'', N'', N'1900-01-01 00:00:00.000', N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'7a016d9e-1b20-4a7e-bdce-a95a55576094', N'0', N'#7a016d9e-1b20-4a7e-bdce-a95a55576094#', N'1', N'002', N'测试菜单2', N'fa fa-bath', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-06-23 14:56:13.913', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'8542b04a-666b-4ddf-94f7-34ec3ab5cfb8', N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#|#8542b04a-666b-4ddf-94f7-34ec3ab5cfb8#', N'3', N'btnQuery', N'查询', N'fa fa-search', null, null, null, N'5', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:50:32.623', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'866c3506-31b0-42af-b0e5-1def84859220', N'c26ffd0c-61a5-47e1-b276-78d94248cf95', N'#c26ffd0c-61a5-47e1-b276-78d94248cf95#|#866c3506-31b0-42af-b0e5-1def84859220#', N'2', N'0011', N'123', N'fa fa-bath', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-06-23 14:55:48.710', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'877c4a6e-6838-4451-a252-8f2d8bfde96e', N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#|#877c4a6e-6838-4451-a252-8f2d8bfde96e#', N'3', N'btnDelete', N'删除', N'fa fa-remove', null, null, null, N'3', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:48:55.023', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'9396f851-b809-493e-8f5c-6856032bf6e6', N'76447f4c-6449-43b8-a5e5-225f4141bff2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff2#|#9396f851-b809-493e-8f5c-6856032bf6e6#', N'3', N'btnAdd', N'添加', N'fa fa-plus', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-27 13:49:22.540', N'admin', N'2018-03-29 18:36:46.540', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'a2e51209-2e17-414b-9c50-3823bf83e7d3', N'b0074f2c-47ed-4640-971a-716f82281fb2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#b0074f2c-47ed-4640-971a-716f82281fb2#|#a2e51209-2e17-414b-9c50-3823bf83e7d3#', N'3', N'btnQuery', N'查询', N'fa fa-search', null, null, null, N'3', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:59:05.397', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'aa5f3d82-7bc3-4e87-a943-ac1e9871fb3c', N'7a016d9e-1b20-4a7e-bdce-a95a55576094', N'#7a016d9e-1b20-4a7e-bdce-a95a55576094#|#aa5f3d82-7bc3-4e87-a943-ac1e9871fb3c#', N'2', N'0022', N'测试功能23', N'fa fa-user', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-06-23 14:57:10.053', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'ac13795d-dd62-41cd-85dd-e23162f7ad02', N'325d12db-84ba-40ec-8e78-6721d28a246e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#325d12db-84ba-40ec-8e78-6721d28a246e#|#ac13795d-dd62-41cd-85dd-e23162f7ad02#', N'3', N'btnQuery', N'查询', N'fa fa-search', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:36:54.050', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'af438db7-93b3-4416-9240-58b3852eca4f', N'76447f4c-6449-43b8-a5e5-225f4141bff1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff1#|#af438db7-93b3-4416-9240-58b3852eca4f#', N'3', N'btnDelete', N'删除', N'fa fa-remove', null, null, null, N'3', N'0', N'1', N'0', null, N'admin', N'2018-03-29 18:31:37.110', N'admin', N'2018-03-29 18:33:38.830', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'b0074f2c-47ed-4640-971a-716f82281fb2', N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#b0074f2c-47ed-4640-971a-716f82281fb2#', N'2', N'funcLog', N'系统日志', N'fa fa-address-book', null, null, N'WebApp/SysManager/Log/Index.aspx', N'6', N'0', N'1', N'0', null, N'admin', N'2018-03-07 15:49:57.680', N'admin', N'2018-03-26 16:38:26.107', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'b1e294dd-d1f6-4db5-b6f3-ae4784e6bfc1', N'b0074f2c-47ed-4640-971a-716f82281fb2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#b0074f2c-47ed-4640-971a-716f82281fb2#|#b1e294dd-d1f6-4db5-b6f3-ae4784e6bfc1#', N'3', N'btnClear', N'清空', N'fa fa-trash', null, null, null, N'4', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:59:30.370', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'bb8e70de-528c-47de-b83a-d6a54779b7aa', N'76447f4c-6449-43b8-a5e5-225f4141bff1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff1#|#bb8e70de-528c-47de-b83a-d6a54779b7aa#', N'3', N'btnClear', N'清空', N'fa fa-trash', null, null, null, N'6', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:18:12.973', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'c26ffd0c-61a5-47e1-b276-78d94248cf95', N'0', N'#c26ffd0c-61a5-47e1-b276-78d94248cf95#', N'1', N'001', N'测试功能1', N'fa fa-bath', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-06-23 14:55:13.253', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'c4060c18-9099-4d00-95cd-effefaad43a1', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#|#c4060c18-9099-4d00-95cd-effefaad43a1#', N'3', N'btnEdit', N'修改', N'fa fa-pencil', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:02:09.230', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'ce64aa8d-6c10-4a9a-ae19-e72d17fe8be2', N'76447f4c-6449-43b8-a5e5-225f4141bff1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff1#|#ce64aa8d-6c10-4a9a-ae19-e72d17fe8be2#', N'3', N'btnEdit', N'修改', N'fa fa-pencil', null, null, null, N'2', N'0', N'1', N'0', null, N'admin', N'2018-03-29 18:31:09.960', N'admin', N'2018-03-29 18:33:34.120', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'cf4498bd-048c-4c6d-95fa-91cce6813725', N'76447f4c-6449-43b8-a5e5-225f4141bff1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff1#|#cf4498bd-048c-4c6d-95fa-91cce6813725#', N'3', N'btnUserRole', N'赋予角色', N'fa fa-user-secret', null, null, null, N'7', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:44:39.673', N'admin', N'2018-03-29 19:48:10.960', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'db0be7f4-bb94-492a-87e1-93ade30efb45', N'76447f4c-6449-43b8-a5e5-225f4141bff2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff2#|#db0be7f4-bb94-492a-87e1-93ade30efb45#', N'3', N'btnAddMenu', N'赋予权限', N'fa fa-users', null, null, null, N'4', N'1', N'1', N'0', null, N'admin', N'2018-03-28 18:52:28.147', N'admin', N'2018-03-29 18:38:28.813', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'ddd05a12-df03-4d57-adff-f64a8340f302', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#|#ddd05a12-df03-4d57-adff-f64a8340f302#', N'3', N'btnDeleteDict', N'删除(字典管理)', N'fa fa-remove', null, null, null, N'8', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:34:59.887', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'76447f4c-6449-43b8-a5e5-225f4141bff0', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#', N'2', N'funcDictItem', N'字典值管理', N'fa fa-book', null, null, N'WebApp/SysManager/DictItem/Index.aspx', N'7', N'0', N'1', N'0', null, N'admin', N'2018-03-07 15:52:16.920', N'admin', N'2018-03-29 19:04:44.280', null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'e6438f46-2d28-4b31-8aaf-5b879056a14b', N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#|#e6438f46-2d28-4b31-8aaf-5b879056a14b#', N'3', N'btnEditButton', N'修改(按钮管理)', N'fa fa-pencil', null, null, null, N'7', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:10:53.173', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'eb078a3a-cc0b-4e30-9a66-a5c6c2b40543', N'054514d8-9779-4303-8543-e7d603d6b2cd', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#054514d8-9779-4303-8543-e7d603d6b2cd#|#eb078a3a-cc0b-4e30-9a66-a5c6c2b40543#', N'3', N'btnDelete', N'删除', N'fa fa-remove', null, null, null, N'3', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:51:49.850', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'eb48b541-de85-4a0f-ab9c-68ec68d38962', N'054514d8-9779-4303-8543-e7d603d6b2cd', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#054514d8-9779-4303-8543-e7d603d6b2cd#|#eb48b541-de85-4a0f-ab9c-68ec68d38962#', N'3', N'btnEdit', N'修改', N'fa fa-pencil', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:51:36.493', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'eecf3561-4993-44a2-9d35-66bbfa6d72dc', N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#|#eecf3561-4993-44a2-9d35-66bbfa6d72dc#', N'3', N'btnEdit', N'修改', N'fa fa-pencil', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:48:19.837', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'f8487000-86e1-465f-a227-4bb33c14b18f', N'b0074f2c-47ed-4640-971a-716f82281fb2', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#b0074f2c-47ed-4640-971a-716f82281fb2#|#f8487000-86e1-465f-a227-4bb33c14b18f#', N'3', N'btnLogsClear', N'清空日志', N'fa fa-trash-o', null, null, null, N'2', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:58:36.257', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'f8e6af03-73f7-4df2-b011-84d2060613e1', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e#|#f8e6af03-73f7-4df2-b011-84d2060613e1#', N'3', N'dictSet', N'字典设置', N'fa fa-book', null, null, null, N'3', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:02:59.797', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'fb710c81-a59f-4a04-9423-fe6e852cd1bf', N'5cd25a40-42a5-4818-a1a9-6f65c641c7d1', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#5cd25a40-42a5-4818-a1a9-6f65c641c7d1#|#fb710c81-a59f-4a04-9423-fe6e852cd1bf#', N'3', N'btnDelete', N'删除', N'fa fa-remove', null, null, null, N'3', N'1', N'1', N'0', null, N'admin', N'2018-03-29 18:53:05.987', null, null, null, null, null, null, null, null, N'minApp')
GO
GO
INSERT INTO [dbo].[Sys_Menu] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_Icon], [F_Location], [F_Event], [F_Url], [F_SortNum], [F_EnableDelete], [F_EnabledFlag], [F_DeleteFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4], [F_SystemCode]) VALUES (N'fbb82102-7b64-4791-a15e-e55d4e24bb88', N'76447f4c-6449-43b8-a5e5-225f4141bff3', N'#76447f4c-6449-43b8-a5e5-225f4141bff0#|#76447f4c-6449-43b8-a5e5-225f4141bff3#|#fbb82102-7b64-4791-a15e-e55d4e24bb88#', N'3', N'btnDeleteButton', N'删除(按钮管理)', N'fa fa-remove', null, null, null, N'8', N'1', N'1', N'0', null, N'admin', N'2018-03-29 19:11:18.867', null, null, null, null, null, null, null, null, N'minApp')
GO
GO

-- ----------------------------
-- Table structure for Sys_NewMsg
-- ----------------------------
DROP TABLE [dbo].[Sys_NewMsg]
GO
CREATE TABLE [dbo].[Sys_NewMsg] (
[F_Id] varchar(36) NOT NULL ,
[F_Type] varchar(36) NULL ,
[F_Title] nvarchar(60) NULL ,
[F_Content] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_IsRead] int NULL ,
[F_ReadUserId] varchar(36) NULL ,
[F_ReadTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'消息提醒表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'消息提醒表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_Type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'消息类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'消息类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_Title')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'消息标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Title'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'消息标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Title'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_Content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'消息描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'消息描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Content'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_IsRead')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否已读：0、未读；1、已读'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_IsRead'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否已读：0、未读；1、已读'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_IsRead'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_ReadUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'已读人员'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_ReadUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'已读人员'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_ReadUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_ReadTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'已读时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_ReadTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'已读时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_ReadTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_NewMsg', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_NewMsg'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_NewMsg
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_Organize
-- ----------------------------
DROP TABLE [dbo].[Sys_Organize]
GO
CREATE TABLE [dbo].[Sys_Organize] (
[F_Id] varchar(36) NOT NULL ,
[F_ParentId] varchar(36) NULL ,
[F_Layers] varchar(200) NULL ,
[F_Type] int NULL ,
[F_Code] varchar(36) NULL ,
[F_Name] nvarchar(36) NULL ,
[F_ShortName] nvarchar(36) NULL ,
[F_ManagerId] varchar(36) NULL ,
[F_Phone] varchar(36) NULL ,
[F_Address] nvarchar(200) NULL ,
[F_EnableDelete] int NULL ,
[F_SortNum] int NULL ,
[F_EnabledFlag] int NULL ,
[F_DeleteFlag] int NULL ,
[F_Description] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_LastModifyUserId] varchar(36) NULL ,
[F_LastModifyTime] datetime NULL ,
[F_DeleteUserId] varchar(36) NULL ,
[F_DeleteTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织架构表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织架构表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_ParentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_ParentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Layers')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'层次：#编码#|#编码#'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Layers'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'分类： 1、机构，2、部门'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类： 1、机构，2、部门'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Code')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Code'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Code'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_ShortName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'简称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_ShortName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'简称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_ShortName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_ManagerId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'负责人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_ManagerId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'负责人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_ManagerId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Address')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Address'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Address'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_EnableDelete')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_EnabledFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_DeleteFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Description'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_LastModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_LastModifyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_DeleteUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_DeleteTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Organize', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Organize'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_Organize
-- ----------------------------
INSERT INTO [dbo].[Sys_Organize] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_ShortName], [F_ManagerId], [F_Phone], [F_Address], [F_EnableDelete], [F_SortNum], [F_EnabledFlag], [F_DeleteFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'8a0038d9-634d-4e57-97f4-92f0d3a4c775', N'ccead0ae-2997-4c9b-898d-d06bfdc0df2f', N'#ccead0ae-2997-4c9b-898d-d06bfdc0df2f#|#8a0038d9-634d-4e57-97f4-92f0d3a4c775#', N'2', N'JSB02', N'技术部002', N'技术部02', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-27 18:00:38.977', N'admin', N'2018-07-16 16:48:34.843', null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Organize] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_ShortName], [F_ManagerId], [F_Phone], [F_Address], [F_EnableDelete], [F_SortNum], [F_EnabledFlag], [F_DeleteFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'b448918f-2056-4081-80c5-5b9442e123e0', N'ccead0ae-2997-4c9b-898d-d06bfdc0df2f', N'#ccead0ae-2997-4c9b-898d-d06bfdc0df2f#|#b448918f-2056-4081-80c5-5b9442e123e0#', N'2', N'JSB', N'技术部001', N'技术部', null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-27 17:55:36.260', null, null, null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Organize] ([F_Id], [F_ParentId], [F_Layers], [F_Type], [F_Code], [F_Name], [F_ShortName], [F_ManagerId], [F_Phone], [F_Address], [F_EnableDelete], [F_SortNum], [F_EnabledFlag], [F_DeleteFlag], [F_Description], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'ccead0ae-2997-4c9b-898d-d06bfdc0df2f', N'0', N'#ccead0ae-2997-4c9b-898d-d06bfdc0df2f#', N'1', N'organzie', N'组织', null, null, null, null, N'1', N'1', N'1', N'0', null, N'admin', N'2018-03-13 09:12:09.787', null, null, null, null, null, null, null, null)
GO
GO

-- ----------------------------
-- Table structure for Sys_Role
-- ----------------------------
DROP TABLE [dbo].[Sys_Role]
GO
CREATE TABLE [dbo].[Sys_Role] (
[F_Id] varchar(36) NOT NULL ,
[F_Code] varchar(36) NULL ,
[F_Name] nvarchar(36) NULL ,
[F_Type] int NULL ,
[F_EnableDelete] int NULL ,
[F_SortNum] int NULL ,
[F_EnabledFlag] int NULL ,
[F_Remark] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_LastModifyUserId] varchar(36) NULL ,
[F_LastModifyTime] datetime NULL ,
[F_DeleteFlag] int NULL ,
[F_DeleteUserId] varchar(36) NULL ,
[F_DeleteTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色岗位表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色岗位表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Code')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Code'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Code'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'分类：1、角色，2、岗位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类：1、角色，2、岗位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_EnableDelete')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_EnabledFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_LastModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_LastModifyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_DeleteFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_DeleteUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_DeleteTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_Role', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_Role'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
INSERT INTO [dbo].[Sys_Role] ([F_Id], [F_Code], [F_Name], [F_Type], [F_EnableDelete], [F_SortNum], [F_EnabledFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteFlag], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'sysAdmin', N'系统管理员角色', N'1', N'0', N'1', N'1', N'', N'admin', N'2018-03-24 15:41:45.850', null, null, N'0', null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Role] ([F_Id], [F_Code], [F_Name], [F_Type], [F_EnableDelete], [F_SortNum], [F_EnabledFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteFlag], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'c7b8d801-1875-48d1-a4bc-7ef84300f89f', N'test1', N'岗位1', N'2', N'1', N'1', N'1', null, N'admin', N'2018-03-10 09:21:59.670', null, null, N'0', null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_Role] ([F_Id], [F_Code], [F_Name], [F_Type], [F_EnableDelete], [F_SortNum], [F_EnabledFlag], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteFlag], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'testRole', N'testRole', N'测试角色', N'1', N'0', N'1', N'1', null, N'admin', N'2018-01-08 13:44:36.000', N'admin', N'2018-03-09 10:23:48.020', N'0', null, null, null, null, null, null)
GO
GO

-- ----------------------------
-- Table structure for Sys_RoleMenu
-- ----------------------------
DROP TABLE [dbo].[Sys_RoleMenu]
GO
CREATE TABLE [dbo].[Sys_RoleMenu] (
[F_Id] varchar(36) NOT NULL ,
[F_RoleId] varchar(36) NULL ,
[F_MenuId] varchar(36) NULL ,
[F_SortNum] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleMenu', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限角色表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限角色表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleMenu', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleMenu', 
'COLUMN', N'F_RoleId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
, @level2type = 'COLUMN', @level2name = N'F_RoleId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
, @level2type = 'COLUMN', @level2name = N'F_RoleId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleMenu', 
'COLUMN', N'F_MenuId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
, @level2type = 'COLUMN', @level2name = N'F_MenuId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
, @level2type = 'COLUMN', @level2name = N'F_MenuId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleMenu', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleMenu'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO

-- ----------------------------
-- Records of Sys_RoleMenu
-- ----------------------------
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'066bfef7-b940-4add-842e-9b9e52dc6be1', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'397ec93f-103f-4ee2-8dbe-449170f61e7c', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'08f28038-13ce-4f4d-9289-511d6a96f399', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'866c3506-31b0-42af-b0e5-1def84859220', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'0ca0edaa-ba55-4e80-b942-920a934b7339', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'08bf1921-c512-43f5-8dd8-081c629846b6', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'135f9b4a-ed20-4e9b-9319-97bdb99d2311', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'b1e294dd-d1f6-4db5-b6f3-ae4784e6bfc1', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'1a0c40bb-2645-42d8-a3de-932348001c14', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'17511ba7-5a29-415a-b568-d4307ca82904', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'1c65a103-f96c-4c86-8591-a4bb909c5717', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'ddd05a12-df03-4d57-adff-f64a8340f302', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'1d340f43-a65b-4935-90b8-4b7c146eeb20', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'5cd25a40-42a5-4818-a1a9-6f65c641c7d1', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'210bdbc3-07cd-4795-949c-b6c4b8d2fd8b', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'eecf3561-4993-44a2-9d35-66bbfa6d72dc', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'29093737-adb2-4ef1-9bf1-7ae3cbfe3dc6', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'27d38943-3f99-4ada-b531-b985ff4d3651', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'2aee76bd-9671-4c75-9045-6f6edea4d6d8', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'f8487000-86e1-465f-a227-4bb33c14b18f', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'2f69d852-e87b-47c6-9324-47a2d4339cce', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'13f17d45-1704-4f6f-b031-0110146f3ed9', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'307496fb-6296-42f5-9d52-ff1001eb3853', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'c4060c18-9099-4d00-95cd-effefaad43a1', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'3c0e2bf2-3e9b-4b04-8eba-5b0ea9af3708', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'e1a94a9d-ca3c-4a21-8e33-e2ee2150c46e', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'3ea6e1b7-e025-4247-893a-a64c9c8f3c76', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'76447f4c-6449-43b8-a5e5-225f4141bff3', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'3f6616db-58a6-4f67-8a1b-ae54532c7365', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'76447f4c-6449-43b8-a5e5-225f4141bff0', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'3fa4dd7e-3f56-4980-88d7-f1982a6abaa2', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'66022a98-5127-47fe-8f54-07d34b3d5cfc', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'405f8b09-3141-41f3-8a4f-ff3a208369b8', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'428e547a-24e8-4e73-877c-5a426610857c', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'43b220d4-79e7-4216-9590-761a8f22dd78', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'eb48b541-de85-4a0f-ab9c-68ec68d38962', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'44c5382d-8bed-4249-a426-3e6756023e36', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'055a8567-6c6d-44be-8fdf-8e10cba1ed3a', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'44e38f3c-6628-4912-a58e-075e081c0241', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'c26ffd0c-61a5-47e1-b276-78d94248cf95', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'46281637-1509-411b-a0c7-51ad6708cd8e', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'ce64aa8d-6c10-4a9a-ae19-e72d17fe8be2', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'46f81571-a495-4320-bcc5-e8ccfd6d241d', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'47d206ab-ae0c-4d37-90f9-814a5a780e24', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'53c7a1cb-642d-446c-9997-acb08b55b804', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'6880f1fa-ac73-4a4d-94ff-b0423d2c5d8c', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'55cac2a6-c2b7-4253-82c3-40d982391945', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'325d12db-84ba-40ec-8e78-6721d28a246e', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'5d624f13-672a-4dc6-8b47-492a14d66ab0', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'cf4498bd-048c-4c6d-95fa-91cce6813725', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'69402354-c1ee-4895-a558-fb202696b49b', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'75dc0555-bb89-428a-94f0-4c3bea0adc03', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'6fa7ff74-21a5-4afb-b72b-15d9730fe269', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'877c4a6e-6838-4451-a252-8f2d8bfde96e', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'711c55b6-da50-4466-bb51-3a5e8a2434e9', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'17206257-6b98-418d-8f00-7ce00049579a', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'790ca29f-e350-4c3f-871b-ca97acd4f92c', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'bb8e70de-528c-47de-b83a-d6a54779b7aa', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'825c1017-d0c9-41bb-9fe7-b8719d1eacad', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'76447f4c-6449-43b8-a5e5-225f4141bff1', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'83b6a9d2-16eb-4b2f-bafc-a9a6c8bee1b0', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'9396f851-b809-493e-8f5c-6856032bf6e6', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'8ae93ffd-df07-410b-83c3-4d6c141b6487', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'fbb82102-7b64-4791-a15e-e55d4e24bb88', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'8df0a676-76d3-49fa-9ccf-af8383f717f7', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'18febb11-9424-4395-9668-16ee1807eaa1', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'8f9d60df-84b1-48db-bf1c-bd8a681598f2', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'34bad1f8-510b-4ca7-9cc6-ce7efd6f4d7b', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'96c2033b-0cf6-484e-944a-75b2e9d25e2f', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'db0be7f4-bb94-492a-87e1-93ade30efb45', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'9f49c647-2359-4552-a462-43d434c63fd0', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'aa5f3d82-7bc3-4e87-a943-ac1e9871fb3c', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'b0c08485-aabd-41f9-a1ba-2808d3fdd378', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'76447f4c-6449-43b8-a5e5-225f4141bf22', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'b21b9093-11ab-4d64-a6c8-719ec0646376', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'af438db7-93b3-4416-9240-58b3852eca4f', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'c0975bbd-0abc-4956-8c53-f4836f9e0bbc', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'e6438f46-2d28-4b31-8aaf-5b879056a14b', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'c68fac6a-89a2-404b-9759-7db2304fca68', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'00c5b6ce-8fb9-44e0-814f-ba9129b8ff54', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'cc5d0a74-06d6-4db4-b3a1-4a4fbb139398', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'b0074f2c-47ed-4640-971a-716f82281fb2', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'd4d2addb-02d4-46a9-b7a2-62b71b9c72ee', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'6f532a01-ee48-45fe-ade8-2d11b2146207', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'd713f437-6394-4100-b2e5-3760f2c49a90', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'eb078a3a-cc0b-4e30-9a66-a5c6c2b40543', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'd8caf1f9-679f-4eb1-9b48-ff5ced3de54b', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'fb710c81-a59f-4a04-9423-fe6e852cd1bf', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'deece634-1616-41f9-acee-41aa9f6d24b0', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'7a016d9e-1b20-4a7e-bdce-a95a55576094', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'dfd47205-4048-4020-9791-5eb446d75280', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'8542b04a-666b-4ddf-94f7-34ec3ab5cfb8', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'e04a0ef3-6eb9-4e87-8897-74cdbf88d654', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'105a09ef-f78d-4091-a8a3-823b6e01f305', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'e04b6d73-bb08-4443-9989-a867c77f0428', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'f8e6af03-73f7-4df2-b011-84d2060613e1', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'e1889ba7-043a-4299-9a97-a7e2e5042cdb', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'250c3902-88cb-4d73-99e4-d41d76f562c6', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'e58eafb3-1d82-4ee5-aa16-dfc90a6df42e', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'a2e51209-2e17-414b-9c50-3823bf83e7d3', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'e8923a31-4109-4e75-93c8-31e8b210ff78', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'19439ee5-f44b-4da8-ae9a-ba73e6326bd6', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'ec3eaedf-2098-4020-b668-41afbf07dbaf', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'76447f4c-6449-43b8-a5e5-225f4141bff2', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'ed8d207a-daed-43dc-b2bc-fa62d3974d62', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'216429d6-dafd-4302-91b8-ca0d82562774', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'f0e3a0c2-6d98-4e5e-ab30-a3bdea86f8a2', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'054514d8-9779-4303-8543-e7d603d6b2cd', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'f1cf5949-4e73-4ad1-ac2f-8f442ee4c27a', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'382a7310-9ad9-4b2c-a145-c635e3923ceb', null)
GO
GO
INSERT INTO [dbo].[Sys_RoleMenu] ([F_Id], [F_RoleId], [F_MenuId], [F_SortNum]) VALUES (N'f71978f8-e532-47e0-b884-aa628c76411e', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8', N'ac13795d-dd62-41cd-85dd-e23162f7ad02', null)
GO
GO

-- ----------------------------
-- Table structure for Sys_RoleOrganize
-- ----------------------------
DROP TABLE [dbo].[Sys_RoleOrganize]
GO
CREATE TABLE [dbo].[Sys_RoleOrganize] (
[F_Id] varchar(36) NOT NULL ,
[F_OrganizeId] varchar(36) NULL ,
[F_RoleId] varchar(36) NULL ,
[F_SortNum] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleOrganize', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织岗位表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织岗位表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleOrganize', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleOrganize', 
'COLUMN', N'F_OrganizeId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
, @level2type = 'COLUMN', @level2name = N'F_OrganizeId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
, @level2type = 'COLUMN', @level2name = N'F_OrganizeId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleOrganize', 
'COLUMN', N'F_RoleId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
, @level2type = 'COLUMN', @level2name = N'F_RoleId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
, @level2type = 'COLUMN', @level2name = N'F_RoleId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_RoleOrganize', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_RoleOrganize'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO

-- ----------------------------
-- Records of Sys_RoleOrganize
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
DROP TABLE [dbo].[Sys_User]
GO
CREATE TABLE [dbo].[Sys_User] (
[F_Id] varchar(36) NOT NULL ,
[F_Account] nvarchar(36) NULL ,
[F_RealName] nvarchar(36) NULL ,
[F_NickName] nvarchar(36) NULL ,
[F_HeadIcon] nvarchar(200) NULL ,
[F_Sex] varchar(10) NULL ,
[F_WeChat] nvarchar(36) NULL ,
[F_Phone] varchar(36) NULL ,
[F_Email] nvarchar(36) NULL ,
[F_Birthday] datetime NULL ,
[F_OrganizeId] varchar(36) NULL ,
[F_DepartmentId] varchar(36) NULL ,
[F_RoleId] varchar(36) NULL ,
[F_IsAdmin] int NULL ,
[F_EnableDelete] int NULL ,
[F_DeleteFlag] int NULL ,
[F_EnabledFlag] int NULL ,
[F_SortNum] int NULL ,
[F_Remark] nvarchar(200) NULL ,
[F_CreateUserId] varchar(36) NULL ,
[F_CreateTime] datetime NULL ,
[F_LastModifyUserId] varchar(36) NULL ,
[F_LastModifyTime] datetime NULL ,
[F_DeleteUserId] varchar(36) NULL ,
[F_DeleteTime] datetime NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户表
   '
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户表
   '
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Account')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户帐号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Account'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户帐号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Account'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_RealName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_RealName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_RealName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_NickName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'呢称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_NickName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'呢称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_NickName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_HeadIcon')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'头像'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_HeadIcon'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'头像'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_HeadIcon'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Sex')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'性别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Sex'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'性别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Sex'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_WeChat')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'微信'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_WeChat'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'微信'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_WeChat'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Email')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户邮件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Email'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户邮件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Email'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Birthday')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'生日'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Birthday'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生日'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Birthday'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_OrganizeId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_OrganizeId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_OrganizeId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_DepartmentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'部门主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_DepartmentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'部门主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_DepartmentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_RoleId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'岗位主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_RoleId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'岗位主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_RoleId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_IsAdmin')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否管理员'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_IsAdmin'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否管理员'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_IsAdmin'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_EnableDelete')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_EnableDelete'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_DeleteFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_DeleteFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_EnabledFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_EnabledFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_SortNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_SortNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_CreateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_CreateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_LastModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_LastModifyTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_LastModifyTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_DeleteUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_DeleteUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_DeleteTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_DeleteTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_User', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_User'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO [dbo].[Sys_User] ([F_Id], [F_Account], [F_RealName], [F_NickName], [F_HeadIcon], [F_Sex], [F_WeChat], [F_Phone], [F_Email], [F_Birthday], [F_OrganizeId], [F_DepartmentId], [F_RoleId], [F_IsAdmin], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_SortNum], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'8c37d535-fafd-45bf-bf0b-7ca2873d2f83', N'user', N'用户', N'测试用户', null, N'1', null, null, null, N'2018-03-14 00:00:00.000', N'ccead0ae-2997-4c9b-898d-d06bfdc0df2f', N'ccead0ae-2997-4c9b-898d-d06bfdc0df2f', N'c7b8d801-1875-48d1-a4bc-7ef84300f89f', N'1', N'1', N'0', N'1', N'1', null, N'admin', N'2018-03-10 15:03:19.723', N'admin', N'2018-03-24 14:19:25.187', null, null, null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_User] ([F_Id], [F_Account], [F_RealName], [F_NickName], [F_HeadIcon], [F_Sex], [F_WeChat], [F_Phone], [F_Email], [F_Birthday], [F_OrganizeId], [F_DepartmentId], [F_RoleId], [F_IsAdmin], [F_EnableDelete], [F_DeleteFlag], [F_EnabledFlag], [F_SortNum], [F_Remark], [F_CreateUserId], [F_CreateTime], [F_LastModifyUserId], [F_LastModifyTime], [F_DeleteUserId], [F_DeleteTime], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'admin', N'admin', N'系统管理员', N'月夜最牛逼', null, N'1', null, null, null, N'1991-01-07 00:00:00.000', N'ccead0ae-2997-4c9b-898d-d06bfdc0df2f', N'8a0038d9-634d-4e57-97f4-92f0d3a4c775', N'c7b8d801-1875-48d1-a4bc-7ef84300f89f', N'1', N'0', N'0', N'1', N'1', null, N'admin', N'2018-01-03 16:14:11.000', N'admin', N'2018-03-27 18:31:29.437', null, null, null, null, null, null)
GO
GO

-- ----------------------------
-- Table structure for Sys_UserLogin
-- ----------------------------
DROP TABLE [dbo].[Sys_UserLogin]
GO
CREATE TABLE [dbo].[Sys_UserLogin] (
[F_Id] varchar(36) NOT NULL ,
[F_UserId] varchar(36) NULL ,
[F_Password] varchar(36) NULL ,
[F_Secretkey] varchar(36) NULL ,
[F_LastVisitTime] datetime NULL ,
[F_ChangePassTime] datetime NULL ,
[F_MultiUserLogin] int NULL ,
[F_LogOnCount] int NULL ,
[F_LoginStatus] int NULL ,
[F_Question] nvarchar(100) NULL ,
[F_Answer] nvarchar(36) NULL ,
[F_EnableLogin] int NULL ,
[F_Field1] int NULL ,
[F_Field2] nvarchar(36) NULL ,
[F_Field3] varchar(36) NULL ,
[F_Field4] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户登录表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户登录表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_UserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_UserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_UserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Password')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'密码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Password'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'密码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Password'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Secretkey')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'密钥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Secretkey'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'密钥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Secretkey'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_LastVisitTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'最后登录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_LastVisitTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最后登录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_LastVisitTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_ChangePassTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'最后密码修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_ChangePassTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最后密码修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_ChangePassTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_MultiUserLogin')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许多端登录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_MultiUserLogin'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许多端登录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_MultiUserLogin'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_LogOnCount')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录次数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_LogOnCount'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录次数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_LogOnCount'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_LoginStatus')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'在线状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_LoginStatus'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在线状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_LoginStatus'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Question')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'密保问题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Question'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'密保问题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Question'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Answer')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'问题答案'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Answer'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'问题答案'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Answer'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_EnableLogin')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否限制访问'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_EnableLogin'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否限制访问'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_EnableLogin'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Field1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Field1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Field2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Field2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Field3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Field3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserLogin', 
'COLUMN', N'F_Field4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserLogin'
, @level2type = 'COLUMN', @level2name = N'F_Field4'
GO

-- ----------------------------
-- Records of Sys_UserLogin
-- ----------------------------
INSERT INTO [dbo].[Sys_UserLogin] ([F_Id], [F_UserId], [F_Password], [F_Secretkey], [F_LastVisitTime], [F_ChangePassTime], [F_MultiUserLogin], [F_LogOnCount], [F_LoginStatus], [F_Question], [F_Answer], [F_EnableLogin], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'6d2127e5-2d61-4f95-8014-399d2c9588b4', N'8c37d535-fafd-45bf-bf0b-7ca2873d2f83', N'533e8d481bf697f9d860046ba35f7756', N'0172c3ef3d354204', null, null, N'0', N'0', N'0', null, null, N'1', null, null, null, null)
GO
GO
INSERT INTO [dbo].[Sys_UserLogin] ([F_Id], [F_UserId], [F_Password], [F_Secretkey], [F_LastVisitTime], [F_ChangePassTime], [F_MultiUserLogin], [F_LogOnCount], [F_LoginStatus], [F_Question], [F_Answer], [F_EnableLogin], [F_Field1], [F_Field2], [F_Field3], [F_Field4]) VALUES (N'admin', N'admin', N'0cf57ecf80e909cf9c380ff9336c45bc', N'30ea7a42b389c824', N'2019-01-07 15:24:14.810', N'2018-01-12 15:57:56.000', N'0', N'3', N'1', null, N'', N'1', null, null, null, null)
GO
GO

-- ----------------------------
-- Table structure for Sys_UserRole
-- ----------------------------
DROP TABLE [dbo].[Sys_UserRole]
GO
CREATE TABLE [dbo].[Sys_UserRole] (
[F_Id] varchar(36) NOT NULL ,
[F_UserId] varchar(36) NULL ,
[F_RoleId] varchar(36) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserRole', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户角色表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserRole'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户角色表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserRole'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserRole', 
'COLUMN', N'F_Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserRole'
, @level2type = 'COLUMN', @level2name = N'F_Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserRole'
, @level2type = 'COLUMN', @level2name = N'F_Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserRole', 
'COLUMN', N'F_UserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserRole'
, @level2type = 'COLUMN', @level2name = N'F_UserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserRole'
, @level2type = 'COLUMN', @level2name = N'F_UserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Sys_UserRole', 
'COLUMN', N'F_RoleId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserRole'
, @level2type = 'COLUMN', @level2name = N'F_RoleId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Sys_UserRole'
, @level2type = 'COLUMN', @level2name = N'F_RoleId'
GO

-- ----------------------------
-- Records of Sys_UserRole
-- ----------------------------
INSERT INTO [dbo].[Sys_UserRole] ([F_Id], [F_UserId], [F_RoleId]) VALUES (N'1', N'admin', N'094cc9fa-72f9-46c8-a188-1d918f69b2b8')
GO
GO
INSERT INTO [dbo].[Sys_UserRole] ([F_Id], [F_UserId], [F_RoleId]) VALUES (N'2', N'8c37d535-fafd-45bf-bf0b-7ca2873d2f83', N'testRole')
GO
GO

-- ----------------------------
-- Indexes structure for table Bas_Region
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Bas_Region
-- ----------------------------
ALTER TABLE [dbo].[Bas_Region] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_Alarm
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_Alarm
-- ----------------------------
ALTER TABLE [dbo].[Sys_Alarm] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_Configs
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_Configs
-- ----------------------------
ALTER TABLE [dbo].[Sys_Configs] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_DbBackup
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_DbBackup
-- ----------------------------
ALTER TABLE [dbo].[Sys_DbBackup] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_Dict
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_Dict
-- ----------------------------
ALTER TABLE [dbo].[Sys_Dict] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_DictItem
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_DictItem
-- ----------------------------
ALTER TABLE [dbo].[Sys_DictItem] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_Logs
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_Logs
-- ----------------------------
ALTER TABLE [dbo].[Sys_Logs] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_Menu
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_Menu
-- ----------------------------
ALTER TABLE [dbo].[Sys_Menu] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_NewMsg
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_NewMsg
-- ----------------------------
ALTER TABLE [dbo].[Sys_NewMsg] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_Organize
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_Organize
-- ----------------------------
ALTER TABLE [dbo].[Sys_Organize] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_Role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_Role
-- ----------------------------
ALTER TABLE [dbo].[Sys_Role] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_RoleMenu
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_RoleMenu
-- ----------------------------
ALTER TABLE [dbo].[Sys_RoleMenu] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_RoleOrganize
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_RoleOrganize
-- ----------------------------
ALTER TABLE [dbo].[Sys_RoleOrganize] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_User
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_User
-- ----------------------------
ALTER TABLE [dbo].[Sys_User] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_UserLogin
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_UserLogin
-- ----------------------------
ALTER TABLE [dbo].[Sys_UserLogin] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Indexes structure for table Sys_UserRole
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Sys_UserRole
-- ----------------------------
ALTER TABLE [dbo].[Sys_UserRole] ADD PRIMARY KEY ([F_Id])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Sys_DictItem]
-- ----------------------------
ALTER TABLE [dbo].[Sys_DictItem] ADD FOREIGN KEY ([F_DictId]) REFERENCES [dbo].[Sys_Dict] ([F_Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Sys_RoleMenu]
-- ----------------------------
ALTER TABLE [dbo].[Sys_RoleMenu] ADD FOREIGN KEY ([F_MenuId]) REFERENCES [dbo].[Sys_Menu] ([F_Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[Sys_RoleMenu] ADD FOREIGN KEY ([F_RoleId]) REFERENCES [dbo].[Sys_Role] ([F_Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Sys_RoleOrganize]
-- ----------------------------
ALTER TABLE [dbo].[Sys_RoleOrganize] ADD FOREIGN KEY ([F_OrganizeId]) REFERENCES [dbo].[Sys_Organize] ([F_Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[Sys_RoleOrganize] ADD FOREIGN KEY ([F_RoleId]) REFERENCES [dbo].[Sys_Role] ([F_Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Sys_UserLogin]
-- ----------------------------
ALTER TABLE [dbo].[Sys_UserLogin] ADD FOREIGN KEY ([F_UserId]) REFERENCES [dbo].[Sys_User] ([F_Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Sys_UserRole]
-- ----------------------------
ALTER TABLE [dbo].[Sys_UserRole] ADD FOREIGN KEY ([F_RoleId]) REFERENCES [dbo].[Sys_Role] ([F_Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[Sys_UserRole] ADD FOREIGN KEY ([F_UserId]) REFERENCES [dbo].[Sys_User] ([F_Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
