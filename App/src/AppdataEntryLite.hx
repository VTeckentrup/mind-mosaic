package;

import GlobalDBVars.*;
import openfl.Assets;
import sys.db.Manager;
import sys.FileSystem;

class AppdataEntryLite
{

    public function new ()
    {
        // open connection to SQLite database
        //var litecnx = sys.db.Sqlite.open(Assets.getPath("database/appdata.db"));
		if(!FileSystem.exists("database")) {
            FileSystem.createDirectory("database");
        }
		
		var litecnx = sys.db.Sqlite.open("database/appdata.db");
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
        app_round.uid = _id;
        app_round.round_ind = _round_ind;
        app_round.blue_reward_prob = _blue_reward_prob;
        app_round.green_reward_prob = _green_reward_prob;
        app_round.round_reward_prob = _round_reward_prob;
        app_round.choice_correct = _choice_correct;
        app_round.reward_blue = _reward_blue;
        app_round.reward_green = _reward_green;
        app_round.choice_player = _choice_player;
        app_round.player_won = _player_won;
        app_round.timestamp = _timestamp;
        return app_round;
    
    }

}