package;

import haxe.io.Path;
import lime.system.System;

class GlobalVars
{
    // stage scaling
	public static var NOMINAL_WIDTH:Int = 1920;
	public static var NOMINAL_HEIGHT:Int = 1080;
	
	// save variables database
	public static var db_address:String = "http://www.google.com";
	public static var trial_entry_list;
	public static var run_entry_list;
		// trial level
	public static var _id:Int;
	public static var _trial_ind:Int;
	public static var _run_ind:Int;   
    public static var _p_reward_A:Float;
    public static var _p_reward_B:Float;
    public static var _p_draw:Float;
    public static var _drawn_outcome:String;
    public static var _reward_A:Int;
    public static var _reward_B:Int;
    public static var _choice:String;
    public static var _win:Int;
	public static var _score:Int;
	public static var _run_finished:Int; 
    public static var _timestamp:Dynamic;
	public static var _device_type:String;
	public static var _device_os:String;
		// run level
	public static var _global_score:Int;
	public static var _item_1:Int;
	public static var _item_2:Int;
	public static var _item_3:Int;
	public static var _item_4:Int;
	public static var _item_5:Int;
	public static var _item_6:Int;
	public static var _item_7:Int;
	public static var _item_8:Int;
	public static var _item_9:Int;
	public static var _item_10:Int;
	public static var _item_11:Int;
	public static var _item_12:Int;
	public static var _item_13:Int;
	public static var _item_14:Int;
	public static var _item_15:Int;
	public static var _item_16:Int;
	public static var _item_17:Int;
	public static var _item_18:Int;
	public static var _item_19:Int;
	public static var _item_20:Int;
	public static var _item_21:Int;
	public static var _item_22:Int;
	public static var _item_23:Int;
	public static var _item_24:Int;
	public static var _item_25:Int;
	public static var _item_26:Int;
	public static var _item_27:Int;
	public static var _item_28:Int;
	public static var _item_29:Int;
	public static var _item_30:Int;
	public static var _app_version:String = "1.0.0";
		// user info
	public static var _mail_address:String;
	public static var _password:String;
	public static var _cb_consent:Int;
	public static var _cb_contact:Int;
	public static var _keycode:Int;
	
	// paths
	public static var database_path = Path.join([System.applicationStorageDirectory, "database"]);
	public static var save_path = Path.join([System.applicationStorageDirectory, "appdata"]);
	
	// save variables appdata
	public static var login_file:String = "./loggedin.json";
	public static var login_savepath:String;
	public static var savepath_id:String;
	public static var json_savepath;
	public static var appdata_json;
	public static var iddata_json;
	public static var iddata;
	public static var appdata;
	
	// Window scaling properties
    public static var stageScaleX:Float;
	public static var stageScaleY:Float;
	public static var stageScale:Float;
	
	// unfocus/refocus time stamps
	public static var timestamp_unfocus: Float;
	public static var timestamp_refocus: Float;
}