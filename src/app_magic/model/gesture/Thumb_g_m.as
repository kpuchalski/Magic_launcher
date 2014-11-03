package app_magic.model.gesture
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class Thumb_g_m
	{
		
		private var _mc:MovieClip;
		private var _queue:LoaderMax;
		private var _gesture:Gesture_m;
		
		public function Thumb_g_m()
		{
			_mc = new MovieClip();
			add_test();
		}
		
		public function get_foto(act_gest:Gesture_m):void
		{
			_gesture = act_gest;
			load_img();
		}
		
		private function add_test():void
		{
			
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(0xFFFFFF);
			sp.graphics.drawRect(0, 0, 200, 200);
			sp.graphics.endFill();
			this._mc.addChild(sp);
		
		}
		
		private function load_img():void
		{
			
			_queue = new LoaderMax();
			_queue.append(new ImageLoader(_gesture.foto_data, {name: "foto", onComplete: completeHandler, onError: errorHandler}));
			_queue.load();
		}
		
	private function errorHandler(event:LoaderEvent):void
		{
					
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(0xFF0000);
			sp.graphics.drawRect(0, 0, 100, 100);
			sp.graphics.endFill();
			sp.x = sp.width / 2 ;
			sp.y = sp.height / 2 ;
			
			this._mc.addChild(sp);
		}
		
		private function completeHandler(event:LoaderEvent):void
		{
			var tz:Bitmap = event.currentTarget.rawContent;
			tz.width = 200;
			tz.height = 200;
			
			this.mc.addChild(tz);
		
		}
		
		public function get mc():MovieClip
		{
			return _mc;
		}
	
	}

}