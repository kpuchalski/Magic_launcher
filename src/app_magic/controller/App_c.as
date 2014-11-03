package app_magic.controller
{
	import app_magic.model.Gestures_m;
	import app_magic.model.info_m;
	import app_magic.model.View_m;
	import app_magic.service.Base_s;
	import app_magic.view.view_data.View_i;
	import app_magic.view.view_data.View_type;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import pl.k_puchalski.NewAlignmentManager;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class App_c
	{
		private var _main_mc:MovieClip
		private var _am:NewAlignmentManager;
		
		private var _actual_element:View_i;
		private var _next_element:View_i;
		private var _views:Vector.<View_m>;
		private var _first_element:Boolean = true;
		private static var _instance:App_c;
		private var _currnet:String;
		
		public function App_c(magic_launcher:Magic_launcher)
		{
			
			if (_instance)
			{
				throw new Error("Error: Instantiation failed");
			}
			
			_instance = this;
			
			_am = new NewAlignmentManager(magic_launcher);
			_main_mc = new MovieClip();
			magic_launcher.addChild(_main_mc);
			_am.addElement(_main_mc);
			
			_views = new Vector.<View_m>;
			_views.push(new View_m("Add_v", View_type.ADD_V));
			_views.push(new View_m("Draw_v", View_type.DRAW_V));
			_views.push(new View_m("Start_v", View_type.START_V,true));
			_views.push(new View_m("Edit_v", View_type.EDIT_V));
			_views.push(new View_m("Config_v", View_type.CONFIG_V));
			
			Base_s.getInstance().initDB();
			
		}
		
		private function _find_view(vec:Vector.<View_m>, ele_to_find:String):View_m
		{
			for each (var item:View_m in vec)
			{
				if (item.type == ele_to_find)
				{
					return item;
				}
			}
			return null;
		}
		
		/**
		 *
		 * @param	what_view
		 */
		public function $change_state(what_view:String, param:Object = null):void
		{
			if (_currnet == what_view) {
				return;
			}
			
			var view_model:View_m = _find_view(_views, what_view);
			var view_ele:View_i = view_model.view_element;
			_currnet = what_view;
			swap_screen(view_ele, param);
		}
		
		private function swap_screen(view:View_i, param:Object = null):void
		{
			set_new(view, param);
		}
		
		private function set_new(view:View_i, param:Object = null):void
		{
			if (_first_element == true)
			{
				_first_element = false;
			}
			else
			{
				remove_last();
				
				TweenMax.delayedCall(0.3, _delete_next);
			}
			_actual_element = view;
			
			TweenMax.to(_actual_element.mc_main, 0, {alpha: 0, blurFilter: {blurX: 30, blurY: 30, quality: 1}});
			_actual_element.$reset();
			_actual_element.$set_params(param);
			
			TweenMax.delayedCall(0.1, _actual_element.$show);
			_main_mc.addChild(_actual_element.mc_main);
			TweenMax.to(_actual_element.mc_main, 0.3, {alpha: 1, blurFilter: {blurX: 0, blurY: 0, quality: 1, remove: true}});
		
		}
		
		public function show_info_pop(str:String):void
		{
			var pop:info_m = new info_m(str);
			pop.x = -pop.width / 2;
			pop.y = -pop.height / 2;
			this._main_mc.addChildAt(pop, _main_mc.numChildren);
		}
		
		private function remove_last():void
		{
			
			if (_actual_element != null)
			{
				_next_element = _actual_element;
				_next_element.$hide();
				TweenMax.to(_next_element.mc_main, 0.3, {alpha: 0, blurFilter: {blurX: 30, blurY: 30, quality: 1, remove: true}});
			}
		}
		
		private function _delete_next():void
		{
			
			if (_next_element.mc_main.parent != null)
			{
				_next_element.mc_main.parent.removeChild(_next_element.mc_main);
			}
		
		}
		
		public static function getInstance():App_c
		{
			return _instance;
		}
	
	}

}