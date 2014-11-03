package app_magic.view.view_data 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Krzysztof Puchalski
	 */
	

	 
	 
	public interface View_i 
	{
		function $show():void;
		function $hide():void;
		function $stop():void
		function $set_params(obj:Object):void;
		function $resume():void
		function $reset():void
		function get mc_main():MovieClip;
	}
}