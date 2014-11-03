package app_magic.service
{
	
	import app_magic.model.gesture.Gesture_m;
	import app_magic.model.Gestures_m;
	import app_magic.service.tables.Gesture_s;
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class Base_s extends EventDispatcher
	{
		private static var _instance:Base_s;
		private var _dbConnection:SQLConnection;
		private var _gesture_s:Gesture_s;
		
		public function Base_s()
		{
			
			if (_instance)
			{
				throw new Error("Error: Instantiation failed");
			}
			
	
		
		}
		
		public function initDB():void
		{
			var embededSessionDB:File = File.applicationDirectory.resolvePath("assets/gesture.db");
			_dbConnection = new SQLConnection;
			_dbConnection.addEventListener(SQLEvent.OPEN, onOpen,false,0,true);
			var writeSessionDB:File = File.applicationStorageDirectory.resolvePath("assets/gesture.db");
			if (!writeSessionDB.exists)
			{
				embededSessionDB.copyTo(writeSessionDB);
			}
			var dbFile:File = embededSessionDB;
			_dbConnection.openAsync(dbFile);
			
		
		}
		
		private function onOpen(e:Event):void 
		{
			trace("connection on");
			_gesture_s = new Gesture_s(_dbConnection,this);
			Gestures_m.getInstance();
		
		}
		
		public static function getInstance():Base_s
		{
			if (_instance == null)
			{
				_instance = new Base_s();
				
			}
			return _instance;
		}
		
		public function get_gestures():void
		{
			 _gesture_s.get_gestures();
		}
		
		public function save_gesture(gesture:Gesture_m):void 
		{
			 _gesture_s.add_gesture(gesture);
		}
		
		public function delete_gesture(gesture:Gesture_m):void 
		{
				 _gesture_s.remove_gesture(gesture);
		}
		
		public function edit_gesture(gesture:Gesture_m):void 
		{
				 _gesture_s.edit_gesture(gesture);
		}
	
	}

}