package;

import sys.db.Manager;
import sys.FileSystem;
import haxe.io.Path;

class DatabaseSync 
{
	
	static public function loadSQLite ()
	{
		
		if (FileSystem.exists(Path.join([database_path, "./appdata.db"]))) {
			
			// Generate SQLite connection
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./appdata.db"]));
			
			// Connect and initialize manager
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			// Retrieve list of all entries in the SQLite database
			entry_list = AppdataDB.manager.all(false);
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
			litecnx.close();
			
			// Call database sync function
			DBSync();
			
		}
		
	}
	
	static public function DBSync ()
	{
		
		// For every entry in the SQLite list, write the Object to the database
		//Manager.cnx.startTransaction();
		for (entries in 1...entry_list.length) {
			
			// Retrieve SQLite entry from generated list and convert back to date
			var entry_item = entry_list.pop();
			var entry_item_str = entry_item.toString();
			var entry_item_str_mod = StringTools.replace(entry_item_str, "app_data#", "");
			var entry_time = Date.fromString(entry_item_str_mod);
			
			// Connect to SQLite database and retrieve entry
			// Generate SQLite connection
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./appdata.db"]));
			
			// Connect and initialize manager
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			//var app_round = new AppdataDB();
			var app_round = AppdataDB.manager.get(entry_time);
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
			litecnx.close();
			
			// Connect to MariaDB and write new entry
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
		
			// Connect and initialize manager
			sys.db.Manager.cnx = cnx;
			sys.db.Manager.initialize();
			
			// Insert object into MariaDB
			app_round.insert();
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
			cnx.close();
			
		}
		
	}
	
}