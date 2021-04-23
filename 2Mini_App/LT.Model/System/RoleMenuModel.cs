using System;
using System.ComponentModel;

namespace LT.Model.System
{
	[Serializable]
	public class RoleMenuModel
	{
		/// <summary>
		/// 主键
		/// </summary>
		[DisplayName("主键")]
		public string F_Id { get; set; }

		/// <summary>
		/// 角色编号
		/// </summary>
		[DisplayName("角色编号")]
		public string F_RoleId { get; set; }

		/// <summary>
		/// 权限编号
		/// </summary>
		[DisplayName("权限编号")]
		public string F_MenuId { get; set; }

		/// <summary>
		/// 排序码
		/// </summary>
		[DisplayName("排序码")]
		public int? F_SortNum { get; set; }

	}
}
