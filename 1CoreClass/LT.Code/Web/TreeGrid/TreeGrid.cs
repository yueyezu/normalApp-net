using System.Collections.Generic;
using System.Text;

namespace LT.Code
{
    public static class TreeGrid
    {

        /// <summary>
        /// 对treegrid展示所使用到的数据格式进行转化，转化后的格式如下：
        /// 
        /// </summary>
        /// <param name="data">需要转化的对象</param>
        /// <returns></returns>
        public static string TreeGridJson(this List<TreeGridModel> data)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{ \"rows\": ");
            sb.Append(TreeGridJson(data, -1, "0"));
            sb.Append("}");
            return sb.ToString();
        }

        /// <summary>
        /// 采用递归方式，对树结构进行渲染。内部使用，最终返回结果参考TreeGridJson方法
        /// </summary>
        /// <param name="data"></param>
        /// <param name="index"></param>
        /// <param name="parentId"></param>
        /// <returns></returns>
        private static string TreeGridJson(List<TreeGridModel> data, int index, string parentId)
        {
            var childNodeList = data.FindAll(t => t.parentId == parentId);
            if (childNodeList.Count > 0) { index++; }

            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            foreach (TreeGridModel entity in childNodeList)
            {
                sb.Append(entity.entityJson.TrimEnd('}') + ",");
                sb.Append("\"isLeaf\":" + (entity.isLeaf != true).ToString().ToLower() + ",");
                sb.Append("\"expanded\":" + entity.expanded.ToString().ToLower() + ",");
                sb.Append("\"parent\":\"" + parentId + "\",");
                sb.Append("\"level\":" + index);
                if (!entity.isLeaf)
                {
                    sb.Append(",\"children\":" + TreeGridJson(data, index, entity.id));
                }
                sb.Append("},");
            }
            if (sb.Length > 1)
            {
                sb.Remove(sb.Length - 1, 1);
            }

            return sb.Append("]").ToString();
        }
    }
}
