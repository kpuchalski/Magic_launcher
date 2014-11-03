package app_magic.view
{
	import app_magic.controller.App_c;
	import app_magic.model.Button_m;
	import app_magic.view.view_data.View_i;
	import app_magic.view.view_data.View_type;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Krzysztof Puchalski
	 */
	public class Start_v implements View_i
	{
		
		private var _btn_gesture:Button_m;
		private var _btn_config:Button_m;
		private var _mc_main:MovieClip;
		
		public function Start_v()
		{
			_btn_gesture = new Button_m("GESTURE", new Point(0, -60), change_to_draw);
			_btn_config = new Button_m("CONIG", new Point(0, +60), change_to_config);
			
			_mc_main = new MovieClip();
			_mc_main.addChild(_btn_gesture);
			_mc_main.addChild(_btn_config);
		}
		
		private function change_to_draw():void
		{
			remove_listeners();
			App_c.getInstance().$change_state(View_type.DRAW_V);
		}
		
		private function remove_listeners():void
		{
			_btn_gesture.remove_listeners();
			_btn_config.remove_listeners();
		}	
		
		private function add_listeners():void
		{
			_btn_gesture.add_listeners();
			_btn_config.add_listeners();
		}
		
		private function change_to_config():void
		{
			remove_listeners();
			App_c.getInstance().$change_state(View_type.CONFIG_V);
		}
		
		public function $show():void
		{
			add_listeners();
		}
		
		public function $hide():void
		{
		
		}
		
		public function $set_params(obj:Object):void
		{
		
		}
		
		public function $stop():void
		{
		
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