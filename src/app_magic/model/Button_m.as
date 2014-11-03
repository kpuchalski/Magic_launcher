package app_magic.model
{
	import app_magic.button_simple;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class Button_m extends button_simple
	{
		
		private var _listener_func:Function;
		private var _pos:Point;
		
		public function Button_m(str:String, pos:Point, touch_listener:Function)
		{
			
			this.buttonMode = true;
			
			_copy.text = str;
			this.x = pos.x;
			this.y = pos.y;
			
			_listener_func = touch_listener;
		}
		
		public function add_listeners():void
		{
			this.addEventListener(TouchEvent.TOUCH_END, _touch_end, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_UP, _touch_end, false, 0, true);
			
			this.addEventListener(TouchEvent.TOUCH_BEGIN, _touch_start, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_DOWN, _touch_start, false, 0, true);
		}
		
		public function remove_listeners():void
		{
			this.removeEventListener(TouchEvent.TOUCH_END, _touch_end);
			this.removeEventListener(MouseEvent.MOUSE_UP, _touch_end);
			
			this.removeEventListener(TouchEvent.TOUCH_BEGIN, _touch_start);
			this.removeEventListener(MouseEvent.MOUSE_DOWN, _touch_start);
		}
		
		private function _touch_start(e:*):void
		{
			this.gotoAndStop(2);
		}
		
		private function _touch_end(e:*):void
		{
			this.gotoAndStop(1);
			_listener_func();
		}
		
		public function set pos(value:Point):void
		{
			_pos = value;
			this.x = _pos.x;
			this.y = _pos.y;
		
		}
	
	}

}