package pl.k_puchalski
{
	
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class ZAF_2D
	{
		
		public function ZAF_2D()
		{
		
		}
		
		public static function $getAngle(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			return Math.atan2(dy, dx);
		}
		
		public static function $toDegrees(radians:Number):Number
		{
			return radians * 180 / Math.PI;
		}
		
		public static function $fromDegrees(degrees:Number):Number
		{
			return degrees * Math.PI / 180;
		}
		
		public static function $HexToRGB(value:uint):Object
		{
			var rgb:Object = new Object();
			rgb.r = (value >> 16) & 0xFF
			rgb.g = (value >> 8) & 0xFF
			rgb.b = value & 0xFF
			return rgb;
		}
		
		public static function $color_bitmapdata(bd:BitmapData, colorik:uint):BitmapData
		{
			
			var color_tr:ColorTransform = new ColorTransform();
			color_tr.color = colorik;
			bd.colorTransform(new Rectangle(0, 0, bd.width, bd.height), color_tr);
			return bd;
		}
	
	}

}