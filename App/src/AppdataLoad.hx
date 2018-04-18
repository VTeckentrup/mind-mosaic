package;

import haxe.Json;
import haxe.io.Path;
import sys.FileSystem;

class AppdataLoad
{
	
	public function new()
	{
	
		// Generate respective save file path
		savepath_id = "./" + Std.string(_id) + "_appdata.json";
		json_savepath = Path.join([save_path, savepath_id]);
		trace(json_savepath);
		// Check if save file for user exists, if not call save function for initial json file
		if(!FileSystem.exists(json_savepath)) {
			new AppdataSave();
		} else {
		
		appdata_json = sys.io.File.getContent(json_savepath);
		
		appdata = Json.parse(appdata_json);
		
		_id = appdata.id;
		_level = appdata.level;
		_score = appdata.score;
	
		}
	
	}
	
}