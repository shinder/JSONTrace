package lin.shinder.utils 
{
	/**
	 * @date	2012-03-29
	 * @author	shinder.lin@gmail.com
	 */
	public class JsonFormatter
	{
		private var spaces:int;
		public static var spaceUnit:String = " ";
		private var resultStr:String = "";
		private var prevCh:String;
		
		private var pieces:Array;
		private var currentIndex:int;
		private var lastStepIndex:int;
		
		public function JsonFormatter(str:String = null) {
			spaces = 0;
			lastStepIndex = 0;
			pieces = [];
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
			
			for (var i:int = 0; i < str.length; i++)
			{
				ch = str.charAt(i);
				if ( ch == '[' || ch == '{' || ch == ',' || ch == '}' || ch == ']' )
				{
					if ( ch == '[' || ch == '{' || ch == ',' ) {
						leftStr = str.slice(lastStepIndex, i + 1);
						midStr = null;
						lastStepIndex = i+1;

					} else if ( ch == '}' || ch == ']' ) {
						leftStr = str.slice(lastStepIndex, i);
						midStr = str.slice(i, i+1);
						lastStepIndex = i+1;
					}
					
					if (ch == ',' && (prevCh=='}' || prevCh==']')) {
						pieces.push( leftStr );

					} else {
						addSpaces();
						pieces.push( leftStr );
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
						addSpaces();
						pieces.push( midStr );
					}

					prevCh = ch;
				}	// end if

			}	// end for

			resultStr = pieces.join('');
		}
		
		private function addSpaces():void {
			pieces.push( '\n' );
			for (var i:int = 0; i < spaces; i++){
				pieces.push( spaceUnit );
			}
		}
	}
}