package;

import sys.db.Manager;
import sys.FileSystem;
import haxe.io.Path;

class DatabaseSync 
{
	
	static public function DBSync():Bool
	{
		
		var database_name_trial = "./" + _id + "_app_data_trial.db";
		if (FileSystem.exists(Path.join([database_path, database_name_trial]))) {
			
			// Generate SQLite connection
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, database_name_trial]));
			
			// Connect and initialize manager
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			// Retrieve list of all entries in the SQLite database
			trial_entry_list = AppDataTrial.manager.all(false);
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
			litecnx.close();
			
			// Sync to MySQL database
			// For every entry in the SQLite list, write the Object to the database
			for (entries in 0...trial_entry_list.length) {
				
				// Retrieve SQLite entry from generated list and convert back to date
				var entry_item = trial_entry_list.pop();
				var entry_item_str = entry_item.toString();
				var entry_item_str_mod = StringTools.replace(entry_item_str, "app_data_trial(subject_id_app:" + _id + ",timestamp:", "");
				var entry_item_str_mod2 = StringTools.replace(entry_item_str_mod, ")", "");
				var entry_time = Std.parseFloat(entry_item_str_mod2);
				//var entry_time = Date.fromString(entry_item_str_mod2);
				
				// Connect to SQLite database and retrieve entry
				// Generate SQLite connection
				var database_name_trial = "./" + _id + "_app_data_trial.db";
				var litecnx = sys.db.Sqlite.open(Path.join([database_path, database_name_trial]));
				
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
					database : "Canlab",
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
		
		var database_name_run = "./" + _id + "_app_data_run.db";
		if (FileSystem.exists(Path.join([database_path, database_name_run]))) {
			
			// Generate SQLite connection
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, database_name_run]));
			
			// Connect and initialize manager
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			// Retrieve list of all entries in the SQLite database
			run_entry_list = AppDataRun.manager.all(false);
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
			litecnx.close();
			
			// Sync to MySQL database
			// For every entry in the SQLite list, write the Object to the database
			for (entries in 0...run_entry_list.length) {
				
				// Retrieve SQLite entry from generated list and convert back to date
				var entry_item = run_entry_list.pop();
				var entry_item_str = entry_item.toString();
				var entry_item_str_mod = StringTools.replace(entry_item_str, "app_data_run(subject_id_app:" + _id + ",timestamp:", "");
				var entry_item_str_mod2 = StringTools.replace(entry_item_str_mod, ")", "");
				var entry_time = Std.parseFloat(entry_item_str_mod2);
				//var entry_time = Date.fromString(entry_item_str_mod2);
				
				// Connect to SQLite database and retrieve entry
				// Generate SQLite connection
				var database_name_run = "./" + _id + "_app_data_run.db";
				var litecnx = sys.db.Sqlite.open(Path.join([database_path, database_name_run]));
				
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
					database : "Canlab",
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
		
		return true;
		
	}
	

	
	static public function CheckRegistration (mail_entry:String, password: String, log_flag:Bool):Int
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : "134.2.127.118",
			port : 3306,
			database : "Canlab",
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
		var registration_status:Int;
		if (subj_mail == null) {
			
			// mail address is not registered
			registration_status = 0;
			
		} else {
			
			if (subj_mail.password == password){
			
				// password fits to database entry, but only set ID if call was made from the login function
				if (log_flag == true){
					
					// Set ID according to returned entry
					_id = subj_mail.subject_id_app;
					
				}
				
				registration_status = 2;
			
			} else {
				
				// mail address is registered, but password doesn't fit
				registration_status = 1;
				
			}
			
		}
		
		return registration_status;
			
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
			database : "Canlab",
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
		userinfo.timestamp = Sys.time() * 1000.0;
		//userinfo.timestamp = Date.now();
		_keycode = Random.int(100000, 999999);
		userinfo.keycode = _keycode;
		
		// Write registration info to participants table
		userinfo.insert();
		
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
			
		
	}
	
	
	/*static public function GetUserData (ID:Int)
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : "134.2.127.118",
			port : 3306,
			database : "Canlab",
			user : "APP",
			pass : "",
			socket : null
			
		});
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
			
		// Search for registered mail address
		var subj_data = AppDataRun.manager.search($subject_id_app == ID);
		
		// Set ID according to returned entry
		_id = subj_mail.subject_id_app;
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}*/
	
	static public function SyncUserData (identifier:Int,mail_entry:String)
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : "134.2.127.118",
			port : 3306,
			database : "Canlab",
			user : "APP",
			pass : "",
			socket : null
			
		});
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
			
		// Search for user id and completed level with highest level id
		var subj_data = AppDataRun.manager.search($subject_id_app == identifier);
		var subj_code = AppUserInfo.manager.select($mail_address == mail_entry);
		
		
		
		// Retrieve information for local JSON file
		
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}

	
}