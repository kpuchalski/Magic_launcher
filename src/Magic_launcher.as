package
{
	import app_magic.controller.App_c;
	import app_magic.view.view_data.View_type;
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import pl.k_puchalski.ZAF_UTILS;
	
	/**
	 * ...
	 * @author Zafan
	 */
	
	
	[SWF(backgroundColor="0x000000")]
	public class Magic_launcher extends MovieClip
	{
		private var _app_c:App_c;
		private static var _instance:Magic_launcher;
		
		public function Magic_launcher():void
		{
			
			_instance = this;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			_app_c = new App_c(this);
			stage.addEventListener(Event.ACTIVATE, activate);
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				_app_c.$change_state(View_type.START_V);
		
	
		}
		
		
		public function activate(e:Event):void {
			
		}
		
		private function deactivate(e:Event):void
		{
		//	NativeApplication.nativeApplication.exit();
		}
		
		static public function get instance():Magic_launcher 
		{
			return _instance;
		}
	
	}

}