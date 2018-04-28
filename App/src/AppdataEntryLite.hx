package;

import sys.db.Manager;
import sys.FileSystem;
import haxe.io.Path;

class AppdataEntryLite
{

    static public function writeLiteTrialEntry ()
    {
        // open connection to SQLite database
		if(!FileSystem.exists(database_path)) {
            FileSystem.createDirectory(database_path);
        }
		
		var litecnx = sys.db.Sqlite.open(Path.join([database_path,"./app_data_trial.db"]));
        
        // set connection as current manager
        sys.db.Manager.cnx = litecnx;

        sys.db.Manager.initialize();

        // create app_data_trial table if non-existent
        if ( !sys.db.TableCreate.exists(AppDataTrial.manager) ) {
			sys.db.TableCreate.create(AppDataTrial.manager);
        }

        // write info to database
        var app_trial = createLiteTrialEntry();
        app_trial.insert();

        // close the connection and do some cleanup
		sys.db.Manager.cleanup();

		// Close the connection
        litecnx.close();

    }
	
	static public function createLiteTrialEntry():AppDataTrial
	{

		var app_trial = new AppDataTrial();
		app_trial.subject_id = _id;
		app_trial.trial_ind = _trial_ind;
		app_trial.run_ind = _run_ind;
		app_trial.p_reward_A = _p_reward_A;
		app_trial.p_reward_B = _p_reward_B;
		app_trial.p_draw = _p_draw;
		app_trial.drawn_outcome = _drawn_outcome;
		app_trial.reward_A = _reward_A;
		app_trial.reward_B = _reward_B;
		app_trial.choice = _choice;
		app_trial.win = _win;
		app_trial.score = _score;
		app_trial.run_finished = _run_finished;
		app_trial.timestamp = _timestamp;
		app_trial.device_type = _device_type;
		app_trial.device_os = _device_os;
		return app_trial;
    
	}
	
	
	
	static public function writeLiteRunEntry ()
    {
        // open connection to SQLite database
		if(!FileSystem.exists(database_path)) {
            FileSystem.createDirectory(database_path);
        }
		
		var litecnx = sys.db.Sqlite.open(Path.join([database_path,"./app_data_run.db"]));
        
        // set connection as current manager
        sys.db.Manager.cnx = litecnx;

        sys.db.Manager.initialize();

        // create app_data_run table if non-existent
        if ( !sys.db.TableCreate.exists(AppDataRun.manager) ) {
			sys.db.TableCreate.create(AppDataRun.manager);
        }

        // write info to database
        var app_run = createLiteRunEntry();
        app_run.insert();

        // close the connection and do some cleanup
		sys.db.Manager.cleanup();

		// Close the connection
        litecnx.close();

    }
	
	static public function createLiteRunEntry():AppDataRun
	{

		var app_run = new AppDataRun();
		app_run.subject_id = _id;
		app_run.run_ind = _run_ind;
		app_run.global_score = _global_score;
		app_run.item_1 = _item_1;
		app_run.item_2 = _item_2;
		app_run.item_3 = _item_3;
		app_run.item_4 = _item_4;
		app_run.item_5 = _item_5;
		app_run.item_6 = _item_6;
		app_run.item_7 = _item_7;
		app_run.item_8 = _item_8;
		app_run.item_9 = _item_9;
		app_run.item_10 = _item_10;
		app_run.item_11 = _item_11;
		app_run.item_12 = _item_12;
		app_run.item_13 = _item_13;
		app_run.item_14 = _item_14;
		app_run.item_15 = _item_15;
		app_run.item_16 = _item_16;
		app_run.item_17 = _item_17;
		app_run.item_18 = _item_18;
		app_run.item_19 = _item_19;
		app_run.item_20 = _item_20;
		app_run.item_21 = _item_21;
		app_run.item_22 = _item_22;
		app_run.item_23 = _item_23;
		app_run.item_24 = _item_24;
		app_run.item_25 = _item_25;
		app_run.item_26 = _item_26;
		app_run.item_27 = _item_27;
		app_run.item_28 = _item_28;
		app_run.item_29 = _item_29;
		app_run.item_30 = _item_30;
		app_run.app_version = _app_version;
		app_run.timestamp = Date.now();
		return app_run;
    
	}
	
	
	
	static public function modifyLiteTrialEntry ()
	{
		
		// Generate SQLite connection
		var litecnx = sys.db.Sqlite.open(Path.join([database_path, "./app_data_trial.db"]));
			
		// Connect and initialize manager
		sys.db.Manager.cnx = litecnx;
		sys.db.Manager.initialize();
			
		// Retrieve list of all entries related to the current run in the SQLite database
		trial_entry_list = AppDataTrial.manager.search($run_ind == _run_ind);
		
		for (entries in 0...trial_entry_list.length) {
			
			// Retrieve SQLite entry from generated list and convert back to date
			var entry_item = trial_entry_list.pop();
			var entry_item_str = entry_item.toString();
			var entry_item_str_mod = StringTools.replace(entry_item_str, "app_data_trial(subject_id:" + _id + ",timestamp:", "");
			var entry_item_str_mod2 = StringTools.replace(entry_item_str_mod, ")", "");
			var entry_time = Date.fromString(entry_item_str_mod2);
			
			// Fetch entry from list
			var app_trial = AppDataTrial.manager.get({subject_id: _id, timestamp: entry_time});
			
			// Change run_finished entry
			app_trial.run_finished = 1;
			
			// Update entry in SQLite database
			app_trial.update();
			
		}
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		litecnx.close();
		
	}

    

}