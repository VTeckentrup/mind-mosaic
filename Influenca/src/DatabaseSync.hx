package;

import sys.db.Manager;
import sys.FileSystem;
import haxe.io.Path;
import haxe.crypto.Sha256;

class DatabaseSync 
{
	
	static public function DBSync():Bool
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : host_address,
			port : db_port,
			database : host_database,
			user : host_user,
			pass : host_PW,
			socket : null
			
		});
		
		var database_name_trial = "./" + _id + "_app_data_trial.db";
		if (FileSystem.exists(Path.join([database_path, database_name_trial]))) {
			
			// Generate SQLite connection
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, database_name_trial]));
			
			// Connect and initialize manager
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			// Get list of all entries stored in the SQLite database
			trial_entry_list = AppDataTrial.manager.all(false);
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
				
			// For every entry in the SQLite list, write the Object to the database
			for (entries in 0...trial_entry_list.length) {
				
				// Connect and initialize manager
				sys.db.Manager.cnx = litecnx;
				sys.db.Manager.initialize();
				
				// Grab first entry of SQLite database
				trial_entry = AppDataTrial.manager.select($subject_id_app == _id);
				
				// Clean-up and close connection
				sys.db.Manager.cleanup();
				
				// Connect to MariaDB and initialize manager
				sys.db.Manager.cnx = cnx;
				sys.db.Manager.initialize();
				
				// Test if entry in MariaDB exists that corresponds to extracted entry from SQLite
				var duplicate_data = AppDataTrial.manager.get({subject_id_app: trial_entry.subject_id_app, timestamp: trial_entry.timestamp});
				
				// If no duplicate exists in the database, sync data and delete entry in SQLite
				if (duplicate_data == null) {
					
					// Sync entry extracted from SQLite
					trial_entry.insert();
					
					// Clean-up and close connection to MariaDB
					sys.db.Manager.cleanup();
					
					// Connect and initialize manager
					sys.db.Manager.cnx = litecnx;
					sys.db.Manager.initialize();
					// delete from SQLite
					trial_entry.delete();
					
				
				// If duplicate exists in the database, don't sync data, but delete entry in SQLite
				} else {
					
					// Clean-up and close connection to MariaDB
					sys.db.Manager.cleanup();
					
					// Connect and initialize manager
					sys.db.Manager.cnx = litecnx;
					sys.db.Manager.initialize();
					// delete from SQLite
					trial_entry.delete();
					
				}
				
				// Clean-up connection
				sys.db.Manager.cleanup();
				
			}
			
			// Close connection to SQLite database
			litecnx.close();
			
		}
		
		var database_name_run = "./" + _id + "_app_data_run.db";
		if (FileSystem.exists(Path.join([database_path, database_name_run]))) {
			
			// Generate SQLite connection
			var litecnx = sys.db.Sqlite.open(Path.join([database_path, database_name_run]));
			
			// Connect and initialize manager
			sys.db.Manager.cnx = litecnx;
			sys.db.Manager.initialize();
			
			// Get list of all entries stored in the SQLite database
			run_entry_list = AppDataRun.manager.all(false);
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
				
			// For every entry in the SQLite list, write the Object to the database
			for (entries in 0...run_entry_list.length) {
				
				// Connect and initialize manager
				sys.db.Manager.cnx = litecnx;
				sys.db.Manager.initialize();
				
				// Grab first entry of SQLite database
				run_entry = AppDataRun.manager.select($subject_id_app == _id);
				
				// Clean-up and close connection
				sys.db.Manager.cleanup();
				
				// Connect to MariaDB and initialize manager
				sys.db.Manager.cnx = cnx;
				sys.db.Manager.initialize();
				
				// Test if entry in MariaDB exists that corresponds to extracted entry from SQLite
				var duplicate_data_run = AppDataRun.manager.get({subject_id_app: run_entry.subject_id_app, timestamp: run_entry.timestamp});
				
				// If no duplicate exists in the database, sync data and delete entry in SQLite
				if (duplicate_data_run == null) {
					
					// Sync entry extracted from SQLite
					run_entry.insert();
					
					// Clean-up and close connection to MariaDB
					sys.db.Manager.cleanup();
					
					// Connect and initialize manager
					sys.db.Manager.cnx = litecnx;
					sys.db.Manager.initialize();
					// delete from SQLite
					run_entry.delete();
					
				
				// If duplicate exists in the database, don't sync data, but delete entry in SQLite
				} else {
										
					// Clean-up and close connection to MariaDB
					sys.db.Manager.cleanup();
					
					// Connect and initialize manager
					sys.db.Manager.cnx = litecnx;
					sys.db.Manager.initialize();
					// delete from SQLite
					run_entry.delete();
					
				}
				
				// Clean-up connection
				sys.db.Manager.cleanup();
				
			}
			
			// Close connection to SQLite database
			litecnx.close();
			
		}
		
		if (_keycode_set == 1) {
				
			// Connect and initialize manager
			sys.db.Manager.cnx = cnx;
			sys.db.Manager.initialize();
			
			// Retrieve subject related information
			var subj_info = AppUserInfo.manager.get(_id);
			
			// Check if info needs to be updated
			if (subj_info.keycode_entered != 1) {
				
				subj_info.keycode_entered = 1;
				subj_info.update();
				
			}
			
			// Clean-up and close connection
			sys.db.Manager.cleanup();
			
		}
		
		// Close connection to MariaDB
		cnx.close();
		
		// Write out success return value
		return true;
		
	}
	

	
	static public function CheckRegistration (mail_entry:String, password: String, log_flag:Bool):Int
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : host_address,
			port : db_port,
			database : host_database,
			user : host_user,
			pass : host_PW,
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
			
			if (subj_mail.password == Sha256.encode(subj_mail.pw_salt + password)){
			
				// password fits to database entry, but only set ID, keycode and keycode entered state if call was made from the login function
				if (log_flag == true){
					
					// Set ID & keycode according to returned entry
					_id = subj_mail.subject_id_app;
					_keycode = subj_mail.keycode;
					_keycode_set = subj_mail.keycode_entered;
					
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
	
	
	static public function CheckPasswordReset (mail_entry:String)
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : host_address,
			port : db_port,
			database : host_database,
			user : host_user,
			pass : host_PW,
			socket : null
			
		});
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
			
		// Check if entered mail address is already registered
		var subj_mail = AppUserInfo.manager.select($mail_address == mail_entry);
		
		// If query returns empty, do nothing, else generate code for password reset
		if (subj_mail != null) {
			
			var mail_queue_entry = new AppMailQueue();
			mail_queue_entry.mail_address = mail_entry;
			mail_queue_entry.mail_type_id = 1;
			mail_queue_entry.code = Random.string(6);
			
			// Write mail request to queue table
			mail_queue_entry.insert();
			
		}
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}
	
	
	static public function ResetPassword (mail_entry:String, reset_password: String, resest_code:String):Int
	{
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : host_address,
			port : db_port,
			database : host_database,
			user : host_user,
			pass : host_PW,
			socket : null
			
		});
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
			
		// Check if entered mail address and code correspond -> grab latest queue entry corresponding to mail address
		var last_mail_entry = AppMailQueue.manager.select($mail_address == mail_entry,{ orderBy : -ID, limit : 1 });
		
		// If query returns empty, register new user
		var reset_status:Int;
		
		if (last_mail_entry == null) {
			
			// no entry found in mail queue
			reset_status = 0;
			
		} else {
			
			if (last_mail_entry.code == resest_code){
			
				// grab user related information, update salt and password
				var user_entry = AppUserInfo.manager.select($mail_address == mail_entry);
				user_entry.pw_salt = Random.string(20);
				user_entry.password = Sha256.encode(user_entry.pw_salt + reset_password);
				// write new information to database
				user_entry.update();
				
				// password successfully changed
				reset_status = 1;
			
			} else {
				
				// Code does not match 
				reset_status = 2;
				
			}
			
		}
		
		return reset_status;
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}
	
	
	static public function UserRegistration () {
		
		// Generate MariaDB connection
		var cnx : sys.db.Connection;
			
		// Setup connection to MariaDB
		cnx = sys.db.Mysql.connect({
				
			host : host_address,
			port : db_port,
			database : host_database,
			user : host_user,
			pass : host_PW,
			socket : null
			
		});
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
		
		// Generate database object
		var userinfo = new AppUserInfo();
        userinfo.mail_address = _mail_address;
		userinfo.pw_salt = Random.string(20);
        userinfo.password = Sha256.encode(userinfo.pw_salt + _password);		 
		userinfo.cb_consent = _cb_consent;
        userinfo.cb_contact = _cb_contact;
		userinfo.timestamp = Sys.time() * 1000.0;
		//userinfo.timestamp = Date.now();
		_keycode = Random.int(100000, 999999);
		userinfo.keycode = _keycode;
		userinfo.keycode_entered = 0;
		
		// Write registration info to participants table
		userinfo.insert();
		
		// Generate database object for mail queue to send questionnaire link
		var questlink = new AppMailQueue();
		questlink.mail_address = _mail_address;
		questlink.mail_type_id = 2;
			
		// Write mail request to queue table
		questlink.insert();
		
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
				
			host : host_address,
			port : db_port,
			database : host_database,
			user : host_user,
			pass : host_PW,
			socket : null
			
		});
		
		// Connect and initialize manager
		sys.db.Manager.cnx = cnx;
		sys.db.Manager.initialize();
			
		// Search for user id and completed level with highest level id
		var subj_data = AppDataRun.manager.select($subject_id_app == identifier, {orderBy: -run_ind, limit:1});
		
		// If result returns empty, no round was completed yet, so run infos need to be initialized
		if (subj_data == null) {
			
			// Set initial run value for appdata
			_run_ind = 1;
			// Set initial value for global score
			_global_score = 0;
			// Set initial value for indicator coding how many runs have been played on a given day
			_num_runs_played = 0;
			// Set initial value for date coding when the last run has been played
			_timestamp_last_run = DateTools.format(Date.now(), "%Y-%m-%d");
			
		} else {
			
			// Retrieve information for local JSON file
			_run_ind = subj_data.run_ind + 1;
			_global_score = subj_data.global_score;
			_num_runs_played = subj_data.runs_played_limit;
			_timestamp_last_run = subj_data.date_run;
			
		}
					
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		cnx.close();
		
	}

	
}