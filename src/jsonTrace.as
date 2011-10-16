package
{
	/**
	 * @date	2011-10-16
	 * @author	shinder.lin@gmail.com
	 */
	import lin.shinder.utils.JsonTrace;
	public function jsonTrace(rawObj:Object=null, noTrace:Boolean=false, noFormat:Boolean=false):String {
		return JsonTrace.tr(rawObj, noTrace, noFormat);
	}
}