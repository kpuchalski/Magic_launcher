package app_magic.service
{
	import com.adobe.images.JPGEncoder;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Image_s
	{
		private static var _instance:Image_s;
		
		public function Image_s()
		{
			if (_instance)
			{
				throw new Error("Error: Instantiation failed");
			}
		
		}
		
		public static function getInstance():Image_s
		{
			if (_instance == null)
			{
				_instance = new Image_s();
				
			}
			return _instance;
		}
		
		public function createDirIfNotExists(path:String):Boolean
		{
			var ret:Boolean = true;
			var debugText:String = "";
			debugText += File.applicationDirectory.nativePath + "\n";
			debugText += File.applicationStorageDirectory.nativePath + "\n";
			debugText += File.documentsDirectory.nativePath + "\n";
			debugText += File.userDirectory.nativePath + "\n";
			
			var file:File = File.applicationStorageDirectory.resolvePath(path);
			try
			{
				file.createDirectory();
			}
			catch (e:Error)
			{
				debugText += e.message;
			}
			
			trace(debugText);
			return ret;
		}
		
		public function save_img_andorid(imageArea:Sprite, size:Number):String
		{
			createDirIfNotExists("assets");
			
			var theImage:BitmapData = new BitmapData(size, size);
			theImage.draw(imageArea);
			
			var jpgEncoder:JPGEncoder = new JPGEncoder(80);
			
			var jpgStream:ByteArray = jpgEncoder.encode(theImage);
			var fileName:String = "gest_" + int(Math.random() * 10000) + ".jpg";
			
			while (File.applicationStorageDirectory.resolvePath("assets/" + fileName).exists)
				fileName = "pf_" + int(Math.random() * 10000) + ".jpg";
			
			trace(fileName);
			var fl:File = File.applicationStorageDirectory.resolvePath("assets/" + fileName);
			var fs:FileStream = new FileStream();
			trace(fl.url);
			try
			{
				fs.open(fl, FileMode.WRITE);
				fs.writeBytes(jpgStream);
				fs.close();
			}
			catch (e:Error)
			{
				trace(e.message);
			}
			
			return fl.url;
		}
		
		public function save_img_desktop(imageArea:Sprite, size:Number):String
		{
			
			var theImage:BitmapData = new BitmapData(size, size);
			theImage.draw(imageArea);
			
			var jpgEncoder:JPGEncoder = new JPGEncoder(80);
			var byteArray:ByteArray = jpgEncoder.encode(theImage);
			
			var fileReference:FileReference = new FileReference();
			fileReference.save(byteArray, "test.jpg");
			
			return "test.jpg";
		}
	
	}

}