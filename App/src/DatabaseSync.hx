package;

import sys.db.Manager;
import sys.FileSystem;
import haxe.io.Path;

class DatabaseSync 
{
	
	static public function loadSQLite ()
	{
		
		if (FileSystem.exists(Path.join([database_path, "./app_data_trial.db"]))) {
			
			// Generate SQLite connection
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./app_data_trial.db"]));
			
			// Connect and initialize manager
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			// Retrieve list of all entries in the SQLite database
			trial_entry_list = AppDataTrial.manager.all(false);
			
			trace(trial_entry_list);
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
			litecnx.close();
			
			// Call database sync function
			DBSync("trial");
			
		}
		
		if (FileSystem.exists(Path.join([database_path, "./app_data_run.db"]))) {
			
			// Generate SQLite connection
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./app_data_run.db"]));
			
			// Connect and initialize manager
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			// Retrieve list of all entries in the SQLite database
			run_entry_list = AppDataRun.manager.all(false);
			
			trace(run_entry_list);
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
			litecnx.close();
			
			// Call database sync function
			DBSync("run");
			
		}
		
	}
	
	static public function DBSync (sqlite_type:String)
	{
		if (sqlite_type == "trial") {
			
			// For every entry in the SQLite list, write the Object to the database
			for (entries in 0...trial_entry_list.length) {
				
				// Retrieve SQLite entry from generated list and convert back to date
				var entry_item = trial_entry_list.pop();
				var entry_item_str = entry_item.toString();
				var entry_item_str_mod = StringTools.replace(entry_item_str, "app_data_trial(subject_id_app:" + _id + ",timestamp:", "");
				var entry_item_str_mod2 = StringTools.replace(entry_item_str_mod, ")", "");
				var entry_time = Date.fromString(entry_item_str_mod2);
				
				// Connect to SQLite database and retrieve entry
				// Generate SQLite connection
				var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./app_data_trial.db"]));
				
				// Connect and initialize manager
				sys.db.Manager.cnx = litecnx;
				sys.db.Manager.initialize();
				
				var app_trial = AppDataTrial.manager.get({subject_id_app: _id, timestamp: entry_time});
				
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
				app_trial.insert();
				
				// Clean-up and close connection
				sys.db.Manager.cleanup();
				cnx.close();
				
			}
			
		}
		
		
		if (sqlite_type == "run") {
			
			// For every entry in the SQLite list, write the Object to the database
			for (entries in 0...run_entry_list.length) {
				
				// Retrieve SQLite entry from generated list and convert back to date
				var entry_item = run_entry_list.pop();
				var entry_item_str = entry_item.toString();
				var entry_item_str_mod = StringTools.replace(entry_item_str, "app_data_run(subject_id_app:" + _id + ",timestamp:", "");
				var entry_item_str_mod2 = StringTools.replace(entry_item_str_mod, ")", "");
				var entry_time = Date.fromString(entry_item_str_mod);
				
				// Connect to SQLite database and retrieve entry
				// Generate SQLite connection
				var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./app_data_run.db"]));
				
				// Connect and initialize manager
				sys.db.Manager.cnx = litecnx;
				sys.db.Manager.initialize();
				
				var app_run = AppDataRun.manager.get({subject_id_app: _id, timestamp: entry_time});
				
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
				app_run.insert();
				
				// Clean-up and close connection
				sys.db.Manager.cleanup();
				cnx.close();
				
			}
			
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
		var subj_mail = AppUserInfo.manager.select($mail_address == mail_entry);
		
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
		var userinfo = new AppUserInfo();
        userinfo.mail_address = _mail_address;
        userinfo.password = _password;
		userinfo.cb_consent = _cb_consent;
        userinfo.cb_contact = _cb_contact;
		userinfo.timestamp = Date.now();
		
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
			
		// Search for registered mail address
		var subj_mail = AppUserInfo.manager.select($mail_address == mail_entry);
		
		// Set ID according to returned entry
		_id = subj_mail.subject_id_app;
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}
	
	static public function SyncUserData (identifier:Int)
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
			
		// Search for user id and completed level with highest level id
		var subj_data = AppDataTrial.manager.select($subject_id_app == identifier);
		
		// Retrieve information for local JSON file
		_trial_ind = subj_data.trial_ind;
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}

	
}