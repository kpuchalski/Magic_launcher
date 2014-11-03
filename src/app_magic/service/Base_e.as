package app_magic.service
{
	import flash.events.Event;
	
	public class Base_e extends Event
	{
		
		public static const BASE_GET_VISIBLE:String = "BASE_GET_VISIBLE";
		
		public var params:Object
		
		public function Base_e(type:String, params:Object = null, bubbles:Boolean = false, cancelable:Boolean = false):void
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}
	}
}