package app_magic.model.gesture
{
	import flash.geom.Point;
	import pl.k_puchalski.ZAF_2D;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class Gesture_m
	{
		
		public static const UP:String = "UP";
		public static const DOWN:String = "DOWN";
		public static const L_UP:String = "L_UP";
		public static const L_D:String = "L_D";
		public static const R_UP:String = "R_UP";
		public static const R_D:String = "R_D";
		public static const LEFT:String = "LEFT";
		public static const RIGHT:String = "RIGHT";
		
		private var _gesture_id:String;
		private var _data:Gesture_data_m;
		private var _action:String;
		private var _foto_data:String;
		
		
		public function Gesture_m()
		{
			_data = new Gesture_data_m();
		}
		
		public function add_move(down_point:Point, move_point:Point):void
		{
			var angle:Number = ZAF_2D.$getAngle(down_point.x, down_point.y, move_point.x, move_point.y);
			var refined_angle:Number;
			var string_dir:String;
			
			angle = ZAF_2D.$toDegrees(angle);
			if (angle >= 22 * -1 && angle < 23)
			{
				string_dir = Gesture_m.RIGHT;
			}
			
			if (angle >= 23 && angle < 68)
			{
				string_dir = Gesture_m.R_D;
			}
			
			if (angle >= 68 && angle < 113)
			{
				string_dir = Gesture_m.DOWN
			}
			
			if (angle >= 113 && angle < 158)
			{
				string_dir = Gesture_m.L_D;
			}
			
			if (angle >= 158 || angle < 157 * -1)
			{
				string_dir = Gesture_m.LEFT
			}
			
			if (angle >= 157 * -1 && angle < 112 * -1)
			{
				string_dir = Gesture_m.L_UP
			}
			
			if (angle >= 112 * -1 && angle < 67 * -1)
			{
				string_dir = Gesture_m.UP;
			}
			
			if (angle >= 67 * -1 && angle < 22 * -1)
			{
				string_dir = Gesture_m.R_UP;
			}
			
			_data.add_move(string_dir);
		}
		
		public function reset():void
		{
			_gesture_id = "-1";
			_data.reset();
		}
		
		public function show_me():void
		{
			this._data.show_data();
		}
		
		public function fill_data(obj:Object):void 
		{
			this.action = obj.action;
			this.data.fill_data(obj.data);
			this.foto_data = obj.preview;
			this._gesture_id = obj._id;
		}
		
		
		public function get_foto():void {
			
		}
		
		public function get action():String 
		{
			return _action;
		}
		
		public function set action(value:String):void 
		{
			_action = value;
		}
		
		public function get foto_data():String 
		{
			return _foto_data;
		}
		
		public function set foto_data(value:String):void 
		{
			_foto_data = value;
		}
		
		public function get data():Gesture_data_m 
		{
			return _data;
		}
		
		public function get gesture_id():String 
		{
			return _gesture_id;
		}
		
		public function set gesture_id(value:String):void 
		{
			_gesture_id = value;
		}
	
	}

}