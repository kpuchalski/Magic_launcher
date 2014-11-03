package app_magic.view
{
	import app_magic.controller.App_c;
	import app_magic.model.Button_m;
	import app_magic.model.Gesture_field_m;
	import app_magic.model.Gestures_m;
	import app_magic.view.view_data.View_i;
	import app_magic.view.view_data.View_type;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Krzysztof Puchalski
	 */
	public class Draw_v implements View_i
	{
		
		private var _mc_main:MovieClip;
		private var _gesture_field:Gesture_field_m;
		private var _btn_back:Button_m;
		private var _btn_next:Button_m;
		private var _params:Object;
		
		public function Draw_v()
		{
			_mc_main = new MovieClip();
			_gesture_field = new Gesture_field_m();
			
			_mc_main.addChild(_gesture_field);
			_gesture_field.x = -_gesture_field.width / 2;
			_gesture_field.y = -_gesture_field.height / 2 - 40;
			
			_btn_next = new Button_m("NEXT", new Point(0, 260), change_to_add);
			_btn_back = new Button_m("BACK", new Point(0, 350), change_to_main);
			
			_mc_main.addChild(_btn_next);
			_mc_main.addChild(_btn_back);
		}
		
		private function change_to_add():void
		{
			remove_listeners();
			_gesture_field.save_img();
			
			if (_params != null)
			{
				if (_params.draw == "draw_edit")
				{
					_gesture_field.gesture.gesture_id = Gestures_m.getInstance().get_Active().gesture_id;
				}
			}
			
			App_c.getInstance().$change_state(View_type.ADD_V, _gesture_field.gesture);
		
		}
		
		private function change_to_main():void
		{
			remove_listeners();
			App_c.getInstance().$change_state(View_type.START_V);
		}
		
		public function $show():void
		{
			if (_params != null)
			{
				_btn_next.visible = true;
				_btn_back.pos = new Point(0, 350);
				_btn_next.pos = new Point(0, 260);
				
			}
			else
			{
				_btn_next.visible = false;
				_btn_back.pos = new Point(0, 260);
				
			}
			
			add_listeners();
		}
		
		private function remove_listeners():void
		{
			_btn_next.remove_listeners();
			_btn_back.remove_listeners();
		
		}
		
		private function add_listeners():void
		{
			_btn_next.add_listeners();
			_btn_back.add_listeners();
		
		}
		
		public function $hide():void
		{
		
		}
		
		public function $stop():void
		{
		
		}
		
		public function $set_params(obj:Object):void
		{
			_params = obj;
			
			if (_params != null) {
				_gesture_field.gesture_check = false;
			}
			else {
				_gesture_field.gesture_check = true;
			}
			
		}
		
		public function $resume():void
		{
		
		}
		
		public function $reset():void
		{
			_gesture_field.reset();
		
		}
		
		public function get mc_main():MovieClip
		{
			return _mc_main;
		}
	
	}

}