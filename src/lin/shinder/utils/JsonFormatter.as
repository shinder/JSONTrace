package lin.shinder.utils 
{
	/**
	 * @date	2011-10-16
	 * @author	shinder.lin@gmail.com
	 */
	public class JsonFormatter
	{
		private var spaces:int;
		private var spaceUnit:String = " ";
		private var resultStr:String = "";
		private var prevCh:String;
		
		public function JsonFormatter(str:String = null) {
			if (str) {
				findBracket( str );
			}
		}
		
		public function get result():String {
			if ( resultStr.charAt(0) == "\n") {
				resultStr = resultStr.slice(1);
			}
			return resultStr;
		}
		
		private function findBracket(str:String):void {
			var ch:String;
			var leftStr:String;
			var midStr:String;
			var rightStr:String;
			
			for (var i:int = 0; i < str.length; i++) {
				ch = str.charAt(i);
				
				if ( ch == '[' || ch == '{' || ch == ',' ) {
					leftStr = str.slice(0, i + 1);
					rightStr = str.slice(i + 1);
					break;
				} else if ( ch == '}' || ch == ']' ) {
					leftStr = str.slice(0, i);
					midStr = str.slice(i, i+1);
					rightStr = str.slice(i+1);
					break;
				} 
			}
			if (leftStr == null) {
				return;
			}
			if (ch == ',' && (prevCh=='}' || prevCh==']')) {
				resultStr += leftStr;
			} else {
				resultStr += getSpaces() + leftStr;
			}
			switch(ch) {
				case '[':
					spaces ++;
					break;
				case '{':
					spaces ++;
					break;
				case '}':
					spaces --;
					break;
				case ']':
					spaces --;
					break;
			}
			
			if (midStr != null) {
				resultStr += getSpaces() + midStr;
			}
			prevCh = ch;
			
			if(rightStr.length>1) {
				findBracket( rightStr );
			} else {
				resultStr += "\n" + rightStr;
			}
		}
		
		private function getSpaces():String {
			var str:String = "\n";
			for (var i:int = 0; i < spaces; i++){
				str += spaceUnit;
			}
			return str;
		}
	}
}