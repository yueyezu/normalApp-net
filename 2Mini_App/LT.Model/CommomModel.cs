/*********************************************************************************
 * 公司名称：励图高科
 * 命名空间：Common.WSEntity
 * 文件名：  CommomModel
 * 创建人：  yueye
 * 创建时间：2016/3/7 11:36:49
 * 描述：
 ********************************************************************************/

namespace LT.Model
{
    public class KeyValuePairModel
    {
        private string key;
        private string value;

        /// <summary>
        /// key值
        /// </summary>
        public string Key
        {
            set { key = value; }
            get { return key; }
        }

        /// <summary>
        /// value值
        /// </summary>
        public string Value
        {
            set { this.value = value; }
            get { return value; }
        }
    }
}
