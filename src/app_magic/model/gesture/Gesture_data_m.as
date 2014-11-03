package app_magic.model.gesture 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Zafan
	 */
	public class Gesture_data_m 
	{
		private var _gesture_data:Vector.<String>;
		private var _data:String;
		
		public function Gesture_data_m() 
		{
		
			_gesture_data = new Vector.<String>;
		
		}
		
		public function fill_data(data:String):void {
			_data = data;
			reset();
			_encodoe_gesture();
		}
		
		
		public function add_move(str:String):void 
		{
			if (_gesture_data.length == 0) {
				_gesture_data.push(str);
			}
			else {
				if (_gesture_data[_gesture_data.length - 1] != str) {
					_gesture_data.push(str);
				}
			}
		}
		
		
		public function show_data():void {
		
			var pom:String = "";
			
			for each (var item:String in _gesture_data ) 
			{
				pom += item + ";";
			}
		}
		
		public function reset():void 
		{
			_gesture_data = new Vector.<String>;
		}
		
		public function to_string():String
		{
				var pom:String = "";
			
			for each (var item:String in _gesture_data ) 
			{
				pom += item + ";";
			}
			
			return pom;
		}
		private function _encodoe_gesture():void 
		{
			var pom:String = _data;
			
			var end:Boolean = false;
			while (end == false) 
			{
				var index:int = pom.indexOf(";");
				
				if (index == -1) {
					break;
				}
				var gesture_str:String = pom.slice(0, index);
				pom = pom.slice(index + 1);
				_gesture_data.push(gesture_str);
			}
		}

	}

}