package app_magic.model 
{
	import app_magic.model.gesture.Gesture_m;
	import app_magic.service.Image_s;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Zafan
	 */
	public class Gesture_field_m extends Sprite
	{
		private var _drawing:Boolean  = false;
		private var _gesture:Gesture_m;
		
		private var _down_point:Point;
		private var _move_point:Point;
		private var _bounds:int = 500;
		private var _tolerance:Number = 20;
		private var _gesture_check:Boolean = false;
		
		public function Gesture_field_m() 
		{
			_gesture = new Gesture_m();
				
			   _reset();
			   _add_listeners();
			   this.graphics.lineStyle(2, 0x000000);
		}
		
		public function reset():void 
		{
			_reset();
		}
		
		public function save_img():void 
		{
	 gesture.foto_data = Image_s.getInstance().save_img_andorid(this,_bounds);
	
		}
		
		private function _add_listeners():void {
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, _down_mouse, false, 0, true); 
		}
		// WEB/ Mouse listeners 
		
		private function _down_mouse(e:MouseEvent):void 
		{
			_reset();
			
			_down_point = new Point(mouseX, mouseY);
			_move_point = new Point(mouseX, mouseY);
			
				this.graphics.moveTo(mouseX, mouseY);
				_drawing = true;
				Magic_launcher.instance.stage.addEventListener(MouseEvent.MOUSE_UP, _up_mouse); 
				Magic_launcher.instance.stage.addEventListener(Event.ENTER_FRAME, _move_mouse); 
		}
		
		private function _move_mouse(e:Event):void 
		{
			if (_drawing == false)
			return;
			_move_point.x = mouseX;
			_move_point.y = mouseY;
			
			this.graphics.lineTo(mouseX, mouseY);
			
			if (Point.distance(_down_point, _move_point) > _tolerance) {
				_gesture.add_move(_down_point, _move_point);
				_down_point.x = mouseX;
				_down_point.y = mouseY;
			}
		}
		
		private function _up_mouse(e:MouseEvent):void 
		{
				Magic_launcher.instance.stage.removeEventListener(MouseEvent.MOUSE_UP, _up_mouse); 
				Magic_launcher.instance.stage.removeEventListener(Event.ENTER_FRAME, _move_mouse); 
				_drawing = false;
				_gesture.show_me();
				
				if (_gesture_check == true) {
					Gestures_m.getInstance().find_gesture(this._gesture);
				}
				

		}
		
		private function _reset():void {
			_gesture.reset();
			this.graphics.beginFill(0xFFFFFF);
			this.graphics.drawRect(0,0,500,500);
			this.graphics.endFill();
		}
		
		public function get gesture():Gesture_m 
		{
			return _gesture;
		}
		
		public function set gesture_check(value:Boolean):void 
		{
			_gesture_check = value;
		}

		
		
		
	}

}