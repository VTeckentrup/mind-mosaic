package;

import sys.db.Manager;
import sys.FileSystem;
import haxe.io.Path;

class DatabaseSync 
{
	
	static public function loadSQLite ()
	{
		
		if (FileSystem.exists(Path.join([database_path, "./appdata.db"]))) {
			
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./appdata.db"]));
			
			sys.db.Manager.cnx = litecnx;

			sys.db.Manager.initialize();
			
			entry_list = AppdataDB.manager.all(false);
			
			litecnx.close();
			
			// Call database sync function
			DBSync();
			
		}
		
	}
	
	static public function DBSync ()
	{
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
		
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
            host : "",
            port : 3306,
            database : "neuromadlab",
            user : "APP",
            pass : "",
            socket : null
        });
		
		// Generate SQLite connection
		var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./appdata.db"]));
		
		// Connect manager
		//sys.db.Manager.cnx = cnx;
		
		// Initialize manager
		//sys.db.Manager.initialize();
		
		
		// For every entry in the SQLite list, write the Object to the database
		//Manager.cnx.startTransaction();
		for (entries in 1...entry_list.length) {
			
			var entry_item = entry_list.pop();
			var entry_item_str = entry_item.toString();
			var entry_item_str_mod = StringTools.replace(entry_item_str, "app_data#", "");
			var entry_time = Date.fromString(entry_item_str_mod);
			
			// Connect to SQLite database and retrieve entry
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			var app_round:AppdataDB = AppdataDB.manager.get({timestamp: entry_time});
			
			//sys.db.Manager.cleanup();
			litecnx.close();
			
			// Connect to MariaDB and write new entry
			sys.db.Manager.cnx = cnx;
			sys.db.Manager.initialize();
			
			app_round.insert();
			
			//sys.db.Manager.cleanup();
			cnx.close();
			
			//trace(entry_time);
			//trace(app_round);
			
		}
		
		//Manager.cnx.commit();
		
		
		// close the connection and do some cleanup
		//sys.db.Manager.cleanup();

		// Close the connection
		//cnx.close();
		
	}
	
}