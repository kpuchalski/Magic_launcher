package app_magic.model
{
	import app_magic.model.actions.Action_m;
	import app_magic.model.gesture.Gesture_m;
	import app_magic.service.Base_s;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class Gestures_m
	{
		
		private var _gestures_vec:Vector.<Gesture_m>;
		private static var _instance:Gestures_m;
		private var _act_gest:int = 0;
		
		public function Gestures_m()
		{
			
			if (_instance)
			{
				throw new Error("Error: Instantiation failed");
			}
			_get_gestures();
		}
		
		private function _get_gestures():void
		{
			Base_s.getInstance().get_gestures();
		}
		
		public static function getInstance():Gestures_m
		{
			if (_instance == null)
			{
				_instance = new Gestures_m();
			}
			return _instance;
		}
		
		public function update(obj:Array):void
		{
			
			_gestures_vec = new Vector.<Gesture_m>;
			if (obj != null)
			{
				for (var i:int = 0; i < obj.length; i++)
				{
					var gest:Gesture_m = new Gesture_m();
					gest.fill_data(obj[i]);
					_gestures_vec.push(gest);
				}
			}
		}
		
		public function prev_active():void
		{
			this._act_gest--;
			if (this._act_gest < 0)
			{
				_act_gest = this._gestures_vec.length - 1;
			}
		}
		
		public function next_active():void
		{
			this._act_gest++;
			if (this._act_gest >= this._gestures_vec.length)
			{
				_act_gest = 0;
			}
		
		}
		
		public function get_Active():Gesture_m
		{
			return _gestures_vec[_act_gest];
		}
		
		public function find_gesture(gesture:Gesture_m):void
		{
			
			var good:Boolean = false;
			var gest:String;
			
			for each (var item:Gesture_m in _gestures_vec)
			{

				if (item.data.to_string() == gesture.data.to_string())
				{
					good = true;
					gest = item.action;
				}
			}
			
			if (good == true)
			{
				Action_m.getInstance().show_action(gest);
			}
		
		}
		
		public function delete_active():void
		{
			Base_s.getInstance().delete_gesture(get_Active());
			_gestures_vec.splice(_act_gest, 1);
			prev_active();
		}
	
	}

}