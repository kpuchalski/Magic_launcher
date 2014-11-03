package app_magic.view
{
	import app_magic.controller.App_c;
	import app_magic.model.Button_m;
	import app_magic.model.gesture.Gesture_m;
	import app_magic.model.gesture.Thumb_g_m;
	import app_magic.model.Gestures_m;
	import app_magic.service.Base_e;
	import app_magic.service.Base_s;
	import app_magic.view.view_data.View_i;
	import app_magic.view.view_data.View_type;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Krzysztof Puchalski
	 */
	public class Edit_v implements View_i
	{
		
		private var _mc_main:MovieClip;
		private var _btn_next:Button_m;
		private var _btn_prev:Button_m;
		private var _btn_back:Button_m;
		private var _thumb_gest:Thumb_g_m;
		private var _obj:Object;
		private var _act_gest:Gesture_m;
		
		private var _btn_edit_me:Button_m;
		private var _btn_delete:Button_m;
		
		public function Edit_v()
		{
			_mc_main = new MovieClip();
			_btn_next = new Button_m("NEXT ", new Point(-200, -150), _next_gesture);
			_btn_prev = new Button_m("PREV", new Point(+200, -150), _prev_gesture);
			
			_btn_edit_me = new Button_m("EDIT", new Point(0, +160), _edit_this_act);
			_btn_delete = new Button_m("DELETE", new Point(0, +240), _delete_this);
			_btn_back = new Button_m("BACK", new Point(0, +320), _back_to_main);
			
			_thumb_gest = new Thumb_g_m();
			_thumb_gest.mc.x = -100;
			_thumb_gest.mc.y = -100;
			
			_mc_main.addChild(_thumb_gest.mc);
			_mc_main.addChild(_btn_next);
			_mc_main.addChild(_btn_prev);
			_mc_main.addChild(_btn_edit_me);
			_mc_main.addChild(_btn_delete);
			_mc_main.addChild(_btn_back);
		}
		
		private function _edit_this_act():void
		{
			
			remove_listeners();
			var obj:Object = new Object();
			obj.draw = "draw_edit"
			
			App_c.getInstance().$change_state(View_type.DRAW_V,obj);
		}
		
		private function _delete_this():void
		{
		
			Gestures_m.getInstance().delete_active();
			$reset();
			App_c.getInstance().show_info_pop("GESTURE DELETED");
		}
		
		private function remove_listeners():void
		{
			_btn_next.remove_listeners();
			_btn_prev.remove_listeners();
			_btn_edit_me.remove_listeners();
			_btn_delete.remove_listeners();
			_btn_back.remove_listeners();
		}
		
		private function add_listeners():void
		{
			_btn_next.add_listeners();
			_btn_prev.add_listeners();
			_btn_edit_me.add_listeners();
			_btn_delete.add_listeners();
			_btn_back.add_listeners();
		}
		
		private function _back_to_main():void
		{
			
				remove_listeners();
			App_c.getInstance().$change_state(View_type.START_V);
		}
		
		private function _prev_gesture():void
		{
			remove_listeners();
			Gestures_m.getInstance().prev_active();
			$reset();
			TweenMax.delayedCall(0.3, add_listeners);	
		
		}
		
		private function _next_gesture():void
		{
			
			remove_listeners();
			Gestures_m.getInstance().next_active();
			$reset();
			TweenMax.delayedCall(0.3, add_listeners);
			
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
			_obj = obj;
		}
		
		public function $resume():void
		{
		
		}
		
		public function $reset():void
		{
			_act_gest = Gestures_m.getInstance().get_Active();
			this._thumb_gest.get_foto(_act_gest);
		}
		
		public function get mc_main():MovieClip
		{
			return _mc_main;
		}
	
	}

}