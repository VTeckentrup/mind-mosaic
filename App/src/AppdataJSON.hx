package;

import haxe.Json;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

class AppdataJSON
{
	
	static public function AppdataSave () {
		
		// Check if save file path exists, if not create it
		if(!FileSystem.exists(save_path)) {
			FileSystem.createDirectory(save_path);
		}
		
		savepath_id = "./" + Std.string(_id) + "_appdata.json";
		json_savepath = Path.join([save_path, savepath_id]);
		
			
		appdata = {id:_id, run:_run_ind, score:_global_score, key:_keycode};
		
		appdata_json = haxe.Json.stringify(appdata);
		
		sys.io.File.saveContent(json_savepath, appdata_json);
		
	}
	
	
	static public function AppdataLoad () {
	
		// Generate respective save file path
		savepath_id = "./" + Std.string(_id) + "_appdata.json";
		json_savepath = Path.join([save_path, savepath_id]);
		// Check if save file for user exists, if not call save function for initial json file
		if(!FileSystem.exists(json_savepath)) {
			AppdataJSON.AppdataSave();
		} else {
		
		appdata_json = sys.io.File.getContent(json_savepath);
		
		appdata = Json.parse(appdata_json);
		
		_id = appdata.id;
		_run_ind = appdata.run;
		_global_score = appdata.score;
		_keycode = appdata.key;
	
		}
	
	}
	
	
	public static function saveLogin ()
	{
	
		// Generate respective save file path
		login_savepath = Path.join([save_path, login_file]);
		
		// Write ID to file
		iddata = {id:_id};
		
		// Convert to stringified format
		iddata_json = Json.stringify(iddata);
		
		// Write JSON file
		File.saveContent(login_savepath, iddata_json);
	
	}
	
	
	public static function loadLogin ()
	{
	
		// Generate respective save file path
		login_savepath = Path.join([save_path, login_file]);
		
		// Load logged in ID
		iddata_json = sys.io.File.getContent(login_savepath);
		
		// Read in
		iddata = Json.parse(iddata_json);
		
		// Set to global ID variable
		_id = iddata.id;
	
	}
	
	
	public static function removeLogin ()
	{
	
		// Generate respective save file path
		login_savepath = Path.join([save_path, login_file]);
		
		// Load logged in ID
		FileSystem.deleteFile(login_savepath);
	
	}
	
}