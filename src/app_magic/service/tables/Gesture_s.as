package app_magic.service.tables
{
	import app_magic.model.gesture.Gesture_m;
	import app_magic.model.Gestures_m;
	import app_magic.service.Base_e;
	import app_magic.service.Base_s;
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.SQLEvent;
	import flash.net.Responder;
	
	/**
	 * ...
	 * @author Zafan
	 */
	public class Gesture_s
	{
		private var _dbConnection:SQLConnection;
		private var _base_c:Base_s;
		
		public function Gesture_s(dbConnection:SQLConnection, base_s:Base_s)
		{
			_dbConnection = dbConnection;
		}
		
		public function get_gestures():void
		{
			var sql:SQLStatement = new SQLStatement();
			sql.sqlConnection = _dbConnection;
			sql.text = "SELECT * FROM magic_gesture WHERE visible=1";
			sql.execute(-1, new Responder(selectItems));
		}
		
		private function selectItems(ev:SQLResult):void
		{
			Gestures_m.getInstance().update(ev.data);
		}
		
		public function add_gesture(gesture:Gesture_m):void
		{
			var sql:SQLStatement = new SQLStatement();
			sql.sqlConnection = _dbConnection;
			sql.text = "INSERT INTO magic_gesture (name, data, action,preview,visible) VALUES (@name, @data, @action, @preview, @visible)";
			sql.parameters["@name"] = "name";
			sql.parameters["@data"] = gesture.data.to_string();
			sql.parameters["@action"] = gesture.action;
			sql.parameters["@preview"] = gesture.foto_data;
			sql.parameters["@visible"] = 1;
			sql.execute(-1, new Responder(add_item));
		}
		
		private function add_item(ev:SQLResult):void
		{
			get_gestures();
		}
		
		public function remove_gesture(gesture:Gesture_m):void
		{
			var sql:SQLStatement = new SQLStatement();
			sql.sqlConnection = _dbConnection;
			sql.text = "UPDATE magic_gesture SET visible=0 WHERE _id="+gesture.gesture_id;
			sql.execute(-1, new Responder(remove_item));
		}
				
		public function edit_gesture(gesture:Gesture_m):void
		{
			var sql:SQLStatement = new SQLStatement();
			sql.sqlConnection = _dbConnection;
			sql.text = "UPDATE magic_gesture SET data="+gesture.data.to_string()+",action="+gesture.action+",preview="+gesture.foto_data+"  WHERE _id="+gesture.gesture_id;
			sql.execute(-1, new Responder(edit_item));
		}
		
		private function edit_item():void 
		{
			get_gestures();
		}
		
		private function remove_item(ev:SQLResult):void 
		{
			trace("item_removed");
		}
	
	}

}