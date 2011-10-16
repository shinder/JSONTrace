package lin.shinder.utils
{
	/**
	 * @date	2011-10-16
	 * @author	shinder.lin@gmail.com
	 */
	import com.adobe.serialization.json.JSON;
	
	public class JsonTrace
	{
		public static function tr(rawObj:Object=null, noTrace:Boolean=false, noFormat:Boolean=false):String {
			var jsonStr:String = JSON.encode(rawObj);
			var jf:JsonFormatter;
			
			if(!noFormat){
				jf = new JsonFormatter(jsonStr);
				jsonStr = jf.result;
			}
			
			if(!noTrace) {
				trace(jsonStr);
			}
			return jsonStr;
		}
	}
}