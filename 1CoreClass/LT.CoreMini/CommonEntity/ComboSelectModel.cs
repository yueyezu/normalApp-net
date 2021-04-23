
namespace LT.Core
{
    public class ComboSelectModel
    {
        /// <summary>
        /// ID信息
        /// </summary>
        public string id { get; set; }

        /// <summary>
        /// 列表中要显示的信息
        /// </summary>
        public string text { get; set; }

        /// <summary>
        /// 显示的值的信息
        /// </summary>
        public string value { get; set; }

        /// <summary>
        /// 查询出来的完整数据，为防止后续存在功能使用到
        /// </summary>
        public object data { get; set; }
    }
}
