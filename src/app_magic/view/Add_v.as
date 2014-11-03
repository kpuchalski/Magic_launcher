package app_magic.view
{
	import app_magic.controller.App_c;
	import app_magic.model.actions.Action_m;
	import app_magic.model.Button_m;
	import app_magic.model.gesture.Gesture_m;
	import app_magic.model.Gestures_m;
	import app_magic.service.Base_s;
	import app_magic.service.Image_s;
	import app_magic.view.view_data.View_i;
	import app_magic.view.view_data.View_type;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Krzysztof Puchalski
	 */
	public class Add_v implements View_i
	{
		private var _mc_main:MovieClip;
		private var _params:Object;
		private var _btn_act_1:Button_m;
		private var _btn_act_2:Button_m;
		private var _btn_act_3:Button_m;
		
		public function Add_v()
		{
			_mc_main = new MovieClip();
			
			_btn_act_1 = new Button_m("OPEN BROWSER", new Point(0, -100), save_add_1);
			_btn_act_2 = new Button_m("CAMERA", new Point(0, +0), save_add_2);
			_btn_act_3 = new Button_m("SEND MAIL", new Point(0, +100), save_add_3);
			
			_mc_main.addChild(_btn_act_1);
			_mc_main.addChild(_btn_act_2);
			_mc_main.addChild(_btn_act_3);
		
		}
		
		private function save_add_1():void
		{
			save_gest(_params as Gesture_m, Action_m.AC_1);
		}
		
		private function save_gest(gesture:Gesture_m, ac1:String):void
		{
			
			remove_listeners();
			gesture.action = ac1;
			
			if (gesture.gesture_id != "-1")
			{
				Base_s.getInstance().edit_gesture(gesture);
			}
			else
			{
				Base_s.getInstance().save_gesture(gesture);
			}
			
			App_c.getInstance().$change_state(View_type.START_V);
			
			if (gesture.gesture_id != "-1")
			{
				App_c.getInstance().show_info_pop("GESTURE MODIFIED");
			}
			else
			{
				App_c.getInstance().show_info_pop("GESTURE ADDED");
			}
			
		}
		
		private function save_add_2():void
		{
			save_gest(_params as Gesture_m, Action_m.AC_2);
		}
		
		private function save_add_3():void
		{
			save_gest(_params as Gesture_m, Action_m.AC_3);
		}
		
		private function remove_listeners():void
		{
			_btn_act_1.remove_listeners();
			_btn_act_2.remove_listeners();
			_btn_act_3.remove_listeners();
		}
		
		private function add_listeners():void
		{
			_btn_act_1.add_listeners();
			_btn_act_2.add_listeners();
			_btn_act_3.add_listeners();
		}
		
		private function save_img():void
		{
		
		}
		
		public function $show():void
		{
			add_listeners();
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
		}
		
		public function $resume():void
		{
		
		}
		
		public function $reset():void
		{
		
		}
		
		public function get mc_main():MovieClip
		{
			return _mc_main;
		}
	
	}

}