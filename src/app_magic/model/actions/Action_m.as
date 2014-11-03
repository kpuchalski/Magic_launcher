package app_magic.model.actions
{
	import app_magic.controller.App_c;
	import app_magic.view.view_data.View_type;
	import flash.desktop.NativeApplication;
	import flash.media.Camera;
	import flash.net.*;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class Action_m
	{
		
		public static const AC_1:String = "AC_1";
		public static const AC_2:String = "AC_2";
		public static const AC_3:String = "AC_3";
		
		private static var _instance:Action_m;
		
		public function Action_m()
		{
			if (_instance)
			{
				throw new Error("Error: Instantiation failed");
			}
		}
		
		public static function getInstance():Action_m
		{
			if (_instance == null)
			{
				_instance = new Action_m();
			}
			return _instance;
		}
		
		public function show_action(action:String):void
		{
			
			switch (action)
			{
				case Action_m.AC_1: 
					open_browser();
					break;
				case Action_m.AC_2: 
					open_camera();
					break;
				case Action_m.AC_3: 
					send_mail();
					break;
			}
			
			App_c.getInstance().$change_state(View_type.START_V);
		}
		
		private function open_browser():void
		{
			var url:String = "http://www.onet.pl";
			var urlReq:URLRequest = new URLRequest(url);
			navigateToURL(urlReq);
		}
		
		private function open_camera():void
		{
			navigateToURL(new URLRequest("camera"));
		}
		
		private function send_mail():void
		{
			var url:String = "mailto:";
			var urlReq:URLRequest = new URLRequest(url);
			navigateToURL(urlReq);
		
		}
	
	}

}