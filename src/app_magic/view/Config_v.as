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
	public class Config_v implements View_i
	{
		
		private var _btn_add:Button_m;
		private var _btn_edit:Button_m;
		private var _btn_back:Button_m;
		private var _mc_main:MovieClip;
		
		public function Config_v()
		{
			_btn_add = new Button_m("ADD NEW", new Point(0, -100), change_to_add);
			_btn_edit = new Button_m("EDIT GESTURES", new Point(0, +0), change_to_edit);
			_btn_back = new Button_m("BACK", new Point(0, +100), change_to_main);
			
			_mc_main = new MovieClip();
			
			_mc_main.addChild(_btn_add);
			_mc_main.addChild(_btn_edit);
			_mc_main.addChild(_btn_back);
		
		}
		
		
				private function remove_listeners():void
		{
			_btn_add.remove_listeners();
			_btn_edit.remove_listeners();
			_btn_back.remove_listeners();
		}	
		
		private function add_listeners():void
		{
			_btn_add.add_listeners();
			_btn_edit.add_listeners();
			_btn_back.add_listeners();
		}
		
		
		private function change_to_edit():void 
		{
					remove_listeners();
				App_c.getInstance().$change_state(View_type.EDIT_V);
		}
		
		private function change_to_add():void 
		{
			remove_listeners();
			var obj:Object = new Object();
			obj.draw = "draw_new"
			App_c.getInstance().$change_state(View_type.DRAW_V,obj);
		}
		
		private function change_to_main():void
		{
			
				remove_listeners();
			App_c.getInstance().$change_state(View_type.START_V);
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