package;

import haxe.Json;
import haxe.io.Path;
import sys.FileSystem;

class AppdataSave
{
	
	public function new()
	{
		
		// Check if save file path exists, if not create it
		if(!FileSystem.exists(save_path)) {
			FileSystem.createDirectory(save_path);
		}
		
		savepath_id = "./" + Std.string(_id) + "_appdata.json";
		json_savepath = Path.join([save_path, savepath_id]);
		
			
		appdata = {id:_id, level:_level, score:_score};
		
		appdata_json = haxe.Json.stringify(appdata);
		
		sys.io.File.saveContent(json_savepath, appdata_json);
		
		
	}
	
}

