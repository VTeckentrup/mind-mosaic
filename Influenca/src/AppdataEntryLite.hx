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
		
		var database_name = "./" + _id + "_app_data_trial.db";
		var litecnx = sys.db.Sqlite.open(Path.join([database_path,database_name]));
        
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
		app_trial.subject_id_app = _id;
		app_trial.trial_ind = _trial_ind;
		app_trial.run_ind = _run_ind;
		app_trial.p_reward_a = _p_reward_A;
		app_trial.p_reward_b = _p_reward_B;
		app_trial.p_draw_a = _p_draw;
		app_trial.drawn_outcome = _drawn_outcome;
		app_trial.reward_a = _reward_A;
		app_trial.reward_b = _reward_B;
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
		
		var database_name = "./" + _id + "_app_data_run.db";
		var litecnx = sys.db.Sqlite.open(Path.join([database_path,database_name]));
        
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
		
		// Clear item entries
		_item_1 = null;
		_item_2 = null;
		_item_3 = null;
		_item_4 = null;
		_item_5 = null;
		_item_6 = null;
		_item_7 = null;
		_item_8 = null;
		_item_9 = null;
		_item_10 = null;
		_item_11 = null;
		_item_12 = null;
		_item_13 = null;
		_item_14 = null;
		_item_15 = null;
		_item_16 = null;
		_item_17 = null;
		_item_18 = null;
		_item_19 = null;
		_item_20 = null;
		_item_21 = null;
		_item_22 = null;
		_item_23 = null;
		_item_24 = null;
		_item_25 = null;
		_item_26 = null;
		/*_item_27 = null;
		_item_28 = null;
		_item_29 = null;
		_item_30 = null;*/

    }
	
	static public function createLiteRunEntry():AppDataRun
	{

		var app_run = new AppDataRun();
		app_run.subject_id_app = _id;
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
		/*app_run.item_27 = _item_27;
		app_run.item_28 = _item_28;
		app_run.item_29 = _item_29;
		app_run.item_30 = _item_30;*/
		app_run.app_version = _app_version;
		//app_run.timestamp = Date.now();
		app_run.timestamp = Sys.time() * 1000.0;
		app_run.runs_played_limit = _num_runs_played;
		app_run.date_run = _date_last_run;
		app_run.timestamp_run = _timestamp_last_run;
		return app_run;
    
	}
	
	
	
	static public function modifyLiteTrialEntry (timestamps:Array<Float>)
	{
		
		// Generate SQLite connection
		var database_name = "./" + _id + "_app_data_trial.db";
		var litecnx = sys.db.Sqlite.open(Path.join([database_path, database_name]));
			
		// Connect and initialize manager
		sys.db.Manager.cnx = litecnx;
		sys.db.Manager.initialize();
		
		// Loop through all trials
		for (entries in 1...trials+1) {
			
			// Fetch entry according to trial timestamp in array
			trial_entry = AppDataTrial.manager.get({subject_id_app: _id, timestamp: timestamps[entries]});
			
			// Change run_finished entry
			trial_entry.run_finished = 1;
				
			// Update entry in SQLite database
			trial_entry.update();
			
		}		
			
		// Clean-up and close connection
		sys.db.Manager.cleanup();
		litecnx.close();
		
	}

}