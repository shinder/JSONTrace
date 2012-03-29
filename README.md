An ActionScript 3 mini library for tracing JSON format strings by using the com.adobe.serialization.json package.

##Easy to Use##
Put the swc file in your lib path, and call:

	jsonTrace( yourObject )

##Change Spacing##
	import lin.shinder.utils.JsonFormatter;
	// the default is one space character
	JsonFormatter.spaceUnit = "\t";	

##Function##
	public function jsonTrace(rawObj:Object=null, noTrace:Boolean=false, noFormat:Boolean=false):String

- rawObj : an Object (or Array) you want to check
- noTrace : false for trace, true for no trace
- noFormat : false for formatting, true for no formatting


---
這是個基於 com.adobe.serialization.json 套件的小工具, 用來將物件或陣列做格式化的輸出。

##方便使用##
將 JSONTrace.swc 放到你的 swc 路徑, 以下面的方便呼叫即可:

	jsonTrace( yourObject )

##變更格式的空白單位##
	import lin.shinder.utils.JsonFormatter;
	// 預設為一個空白字元
	JsonFormatter.spaceUnit = "\t";	

##功能說明##
	public function jsonTrace(rawObj:Object=null, noTrace:Boolean=false, noFormat:Boolean=false):String

- rawObj : 所要查看的物件或陣列
- noTrace : false 就 trace, true 不做 trace
- noFormat : false 做格式化, true 不做格式化
