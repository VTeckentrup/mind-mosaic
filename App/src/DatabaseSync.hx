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
				
				host : "134.2.127.118",
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
	
	
	
	static public function CheckRegistration (mail_entry:String):Bool
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : "134.2.127.118",
			port : 3306,
			database : "neuromadlab",
			user : "APP",
			pass : "",
			socket : null
			
		});
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
			
		// Check if entered mail address is already registered
		var subj_mail = ParticipantsDB.manager.select($mail_address == mail_entry);
		
		// If query returns empty, register new user
		var isDBelement:Bool;
		if (subj_mail == null) {
			
			isDBelement = false;
			
		} else {
			
			isDBelement = true;
			
		}
		
		return isDBelement;
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}
	
	
	static public function UserRegistration () {
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : "134.2.127.118",
			port : 3306,
			database : "neuromadlab",
			user : "APP",
			pass : "",
			socket : null
			
		});		
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
		
		// Generate database object
		var userinfo = new ParticipantsDB();
        userinfo.subject_id = _id;
        userinfo.mail_address = _subj_mail;
        userinfo.PW = _user_pw;
        userinfo.contact_cb = _contact_cb;
		
		// Write registration info to participants table
		userinfo.insert();
		
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
			
		
	}
	
	
	static public function GetUserID (mail_entry:String)
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : "134.2.127.118",
			port : 3306,
			database : "neuromadlab",
			user : "APP",
			pass : "",
			socket : null
			
		});
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
			
		// Check if entered mail address is already registered
		var subj_mail = ParticipantsDB.manager.select($mail_address == mail_entry);
		
		// Set ID according to returned entry
		_id = subj_mail.subject_id;
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}

	
}