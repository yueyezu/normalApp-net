using System;
using System.ComponentModel;
using LT.Core;

namespace LT.Model.System
{
	[Serializable]
    public class RoleOrganizeModel 
	{
		/// <summary>
		/// 主键
		/// </summary>
		[DisplayName("主键")]
		public string F_Id { get; set; }

		/// <summary>
		/// 组织主键
		/// </summary>
		[DisplayName("组织主键")]
		public string F_OrganizeId { get; set; }

		/// <summary>
		/// 角色编号
		/// </summary>
		[DisplayName("角色编号")]
		public string F_RoleId { get; set; }

		/// <summary>
		/// 排序码
		/// </summary>
		[DisplayName("排序码")]
		public int? F_SortNum { get; set; }

	}
}
