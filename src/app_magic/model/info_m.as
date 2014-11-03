package app_magic.model 
{
	import app_magic.copy_simple;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	/**
	 * ...
	 * @author ...
	 */
	public class info_m extends Sprite
	{
		private var btn_ok:Button_m;

		public function info_m(str:String) 
		{
			this.graphics.beginFill(0x000000,0.9);
			this.graphics.drawRect(0,0,2000,2000);
			this.graphics.endFill();
			
			var copy:copy_simple = new copy_simple();
			copy._copy.text = str;
			copy.x = 2000 / 2;
			copy.y = 2000 / 2 - 100;
			this.addChild(copy);
			
			btn_ok = new Button_m("OK", new Point(2000/2, 2000 / 2), _end_this);
			btn_ok.add_listeners();
			this.addChild(btn_ok);
		}
		
		private function _end_this():void 
		{
			this.parent.removeChild(this);
		}
		
	}

}