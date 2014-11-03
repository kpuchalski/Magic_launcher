package app_magic.model {
	import app_magic.view.Add_v;
	import app_magic.view.Config_v;
	import app_magic.view.Draw_v;
	import app_magic.view.Edit_v;
	import app_magic.view.Start_v;
	import app_magic.view.view_data.View_i;
	import flash.utils.getDefinitionByName;

	
	/**
	 * ...
	 * @author Krzysztof Puchalski
	 */
	public class View_m 
	{
		
		private var _from_new:Boolean;
		private var _view_element:View_i;
		private var _type:String;
		private var _class_name:String;
		private var _params:Object = null;
		private var _views_patch:String = "app_magic.view.";
		
		private var _start_var1:Add_v;
		private var _start_var2:Draw_v;
		private var _start_var3:Edit_v;
		private var _start_var4:Start_v;
		private var _start_var5:Config_v;
		
		public function View_m(class_name:String, type_:String,new_:Boolean=false) 
		{
			_class_name = class_name;
			_type = type_;
			_from_new = new_; 
		}
		
		public function get view_element():View_i 
		{
			var	myClass:Class;
			var class_patch:String = _views_patch + "" + _class_name;
			if (_from_new == true){
			myClass = getDefinitionByName(class_patch) as Class;
			_view_element = new myClass();
			}
			else
			{
				if (_view_element == null) {
					myClass = getDefinitionByName(class_patch) as Class;
					_view_element = new myClass();
				}
			}
			return _view_element;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function get params():Object 
		{
			return _params;
		}
		
		public function set params(value:Object):void 
		{
			_params = value;
		}
		
	}

}