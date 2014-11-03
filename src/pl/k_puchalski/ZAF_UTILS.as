package pl.k_puchalski
{
	/**
	 * ...
	 * @author zafan
	 */
	
	import flash.geom.*;
	import flash.display.*;
	
	import flash.display.*;
	
	public class ZAF_UTILS
	{
		
		public function ZAF_UTILS()
		{
		
		}
		
		public static function duplicateImageAsSprite(original:DisplayObject):MovieClip
		{
			var bitmapData:BitmapData = new BitmapData(original.width, original.height, true, 0x000000);
			bitmapData.draw(original as IBitmapDrawable);
			
			var bitmap:Bitmap = new Bitmap(bitmapData);
			
			var returnSprite:MovieClip = new MovieClip();
			returnSprite.addChild(bitmap as DisplayObject);
			
			return returnSprite;
		}
		
		public static function duplicateDisplayObject(target:DisplayObject, autoAdd:Boolean = false):DisplayObject
		{
			
			var targetClass:Class = Object(target).constructor;
			var duplicate:DisplayObject = new targetClass();
			
			duplicate.transform = target.transform;
			duplicate.filters = target.filters;
			duplicate.cacheAsBitmap = target.cacheAsBitmap;
			duplicate.opaqueBackground = target.opaqueBackground;
			if (target.scale9Grid)
			{
				var rect:Rectangle = target.scale9Grid;
				
				duplicate.scale9Grid = rect;
			}
			
			if (autoAdd && target.parent)
			{
				target.parent.addChild(duplicate);
			}
			return duplicate;
		}
		
		public static function randomBoolean():Boolean
		{
			var ra:Number = randomNumberst(0, 1);
			
			if (ra == 1)
			{
				return true;
			}
			else
			{
				return false;
			}
			
		}
		
		public static function random_plus_minus():int
		{
			var ra:Number = randomNumberst(0, 1);
			
			if (ra == 1)
			{
				return 1;
			}
			else
			{
				return -1;
			}
		
		}
		
		public static function randomNumberst(low:Number = 0, high:Number = 1):Number
		{
			return Math.floor(Math.random() * (1 + high - low)) + low;
		}
		
		public function randomNumber(low:Number = 0, high:Number = 1):Number
		{
			return Math.floor(Math.random() * (1 + high - low)) + low;
		}
		
		public function randomizeArray(array:Array):Array
		{
			var newArray:Array = new Array();
			while (array.length > 0)
			{
				newArray.push(array.splice(Math.floor(Math.random() * array.length), 1));
			}
			return newArray;
		}
		
		public static function duplicateArray(array:Array):Array
		{
			var newArray:Array = new Array();
			for (var t:Number = 0; t < array.length; t++)
			{
				newArray[t] = array[t];
			}
			return newArray;
		}
		
		public static function $Dimensional_array(_dimension:int, _widht:int, _height:int):Array
		{
			
			var arrayka:Array = new Array();
			
			for (var row:int = 0; row <= _widht; row++)
			{
				var arrayka_tmp:Array = new Array();
				for (var column:int = 0; column <= _height; column++)
				{
					arrayka_tmp.push(0);
					
				}
				arrayka.push(arrayka_tmp);
			}
			
			return arrayka;
		}
		
		public static function fill_table(ile:Number):Array
		{
			var tz:Array = new Array();
			
			for (var t:int = 0; t < ile; t++)
			{
				tz[t] = t;
			}
			
			return tz;
		}
		
		public static function crop(_x:Number, _y:Number, _width:Number, _height:Number, displayObject:DisplayObject = null):Bitmap
		{
			var cropArea:Rectangle = new Rectangle(0, 0, _width, _height);
			var croppedBitmap:Bitmap = new Bitmap(new BitmapData(_width, _height), PixelSnapping.ALWAYS, true);
			croppedBitmap.bitmapData.draw(displayObject, new Matrix(1, 0, 0, 1, -_x, -_y), null, null, cropArea, true);
			return croppedBitmap;
		}
		
		public static function reset_display(mc:*, doktorego_miejsca:Number = 1):void
		{
			try
			{
				while (mc.numChildren > doktorego_miejsca)
				{
					mc.removeChildAt(doktorego_miejsca);
				}
				
			}
			catch (e:Error)
			{
				////Cc.log(e);
			}
		
		}
		
		public function crop_rec(recta:Rectangle, displayObject:DisplayObject = null):Bitmap
		{
			var cropArea:Rectangle = recta;
			////Cc.log(displayObject.width + "  " + displayObject.height);
			////Cc.log(recta.x + " " + recta.y + " " + recta.width + " " + recta.height);
			
			var tttt:BitmapData = new BitmapData(recta.width, recta.height, true, 0x00000000);
			var croppedBitmap:Bitmap = new Bitmap(tttt);
			var ema:Matrix = new Matrix();
			ema.tx = -recta.x;
			ema.ty = -recta.y;
			croppedBitmap.bitmapData.draw(displayObject, ema);
			
			return croppedBitmap;
		}
		
		public function getVisibleBounds(source:DisplayObject):Rectangle
		{
			
			var matrix:Matrix = new Matrix()
			matrix.tx = -source.getBounds(null).x;
			matrix.ty = -source.getBounds(null).y;
			
			var data:BitmapData = new BitmapData(source.width, source.height, true, 0x00000000);
			data.draw(source, matrix);
			var bounds:Rectangle = data.getColorBoundsRect(0xFFFFFFFF, 0x000000, false);
			data.dispose();
			
			return bounds;
		}
		
		public function SetRegistrationMc(ob:MovieClip, Xam:String = 'C', Yam:String = 'C', bor:Boolean = false):MovieClip
		{
			
			var t:MovieClip = new MovieClip();
			switch (Xam)
			{
				case 'T': 
					switch (Yam)
				{
					case 'L': 
					{
						//Cc.log("t , L");
						ob.x = +ob.width / 2;
						ob.y = +ob.height / 2;
					}
						break;
					case 'C': 
					{
						ob.x = 0;
						ob.y = +ob.height / 2;
						
						//Cc.log("t , c");
					}
						break;
					case 'R': 
					{
						ob.x = -ob.width / 2;
						ob.y = +ob.height / 2;
					}
						//Cc.log("t , R");
						break;
					
				}
					
					break;
				case 'C': 
					switch (Yam)
				{
					case 'L': 
					{
						//Cc.log("C , L");
						ob.y = 0;
						ob.x = -ob.width / 2;
						
					}
						break;
					case 'C': 
					{
						ob.x = 0;
						ob.y = 0;
						//Cc.log("t , c");
					}
						break;
					case 'R': 
					{
						ob.x = +ob.width / 2;
						ob.y = 0
						
						//Cc.log("t , b");
					}
						break;
					
				}
					break;
				case 'B': 
					switch (Yam)
				{
					case 'L': 
					{
						ob.x = +ob.width / 2;
						ob.y = -ob.height / 2;
						
						//Cc.log("t , b");
					}
						
						break;
					case 'C': 
					{
						ob.x = 0
						ob.y = -ob.height / 2;
						
						//Cc.log("t , b");
					}
						break;
					case 'R': 
					{
						ob.x = -ob.width / 2;
						ob.y = -ob.height / 2;
						
						//Cc.log("t , b");
					}
						break;
					
				}
			}
			if (bor == true)
			{
				var bord:Sprite = new Sprite();
				bord.graphics.beginFill(0xFF794B);
				bord.graphics.drawRect(ob.x - ob.width / 2 - 1, ob.y - ob.height / 2 - 1, ob.width + 2, ob.height + 2)
				bord.graphics.endFill();
				t.addChild(bord);
			}
			
			t.addChild(ob);
			return t;
		
		}
		
		public static function Bitmap_data_center(b_map:BitmapData, widtik:Number, heightel:Number):BitmapData
		{
			
			var bd:BitmapData = new BitmapData(widtik, heightel, true, 0x00FFFFFF);
			//Cc.log(widtik);
			//Cc.log(b_map.width);
			var m:Matrix = new Matrix();
			
			bd.draw(b_map, m);
			
			//Cc.log(bd.width)
			return bd;
		}
		
		public static function BitmapScaled(do_source:Bitmap, skala:Number, width:Number, height:Number):BitmapData
		{
			
			var matrix:Matrix = new Matrix();
			matrix.scale(skala, skala);
			
			// 'source' is the existing bitmap data we want to scale
			var width:Number = width;
			var height:Number = height;
			
			var data:BitmapData = new BitmapData(width, height);
			data.draw(do_source, matrix);
			return data;
		}
		
		private function liter_random():Object
		{
			var punkt:Object = new Object();
			var x:Number = randomNumber(0, 600);
			var y:Number = randomNumber(0, 400);
			
			punkt = ({parx: x, pary: y});
			
			return punkt;
		}
	}

}