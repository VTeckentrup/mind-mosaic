package;

import sys.db.Manager;
import sys.FileSystem;
import haxe.io.Path;

class AppdataEntryLite
{

    public function new ()
    {
        // open connection to SQLite database
        //var litecnx = sys.db.Sqlite.open(Assets.getPath("database/appdata.db"));
		if(!FileSystem.exists(database_path)) {
            FileSystem.createDirectory(database_path);
        }
		
		var litecnx = sys.db.Sqlite.open(Path.join([database_path,"./appdata.db"]));
		//var litecnx = sys.db.Sqlite.open("appdata.db");
        
        // set connection as current manager
        sys.db.Manager.cnx = litecnx;

        sys.db.Manager.initialize();

        // create rounds table if non-existent
        if ( !sys.db.TableCreate.exists(AppdataDB.manager) ) {
			sys.db.TableCreate.create(AppdataDB.manager);
        }

        // write info to database
        var app_round = createDBentry();
		//Manager.cnx.startTransaction();
        app_round.insert();
		//Manager.cnx.commit();

        // close the connection and do some cleanup
		sys.db.Manager.cleanup();

		// Close the connection
        litecnx.close();

    }

    function createDBentry():AppdataDB
    {

        var app_round = new AppdataDB();
        app_round.subject_id = _id;
        app_round.round_index = _round_ind;
        app_round.blue_reward_prob = _blue_reward_prob;
        app_round.green_reward_prob = _green_reward_prob;
        app_round.round_reward_prob = _round_reward_prob;
        app_round.correct_choice = _choice_correct;
        app_round.reward_blue = _reward_blue;
        app_round.reward_green = _reward_green;
        app_round.choice_player = _choice_player;
        app_round.player_wins = _player_won;
        app_round.timestamp = _timestamp;
        return app_round;
    
    }

}