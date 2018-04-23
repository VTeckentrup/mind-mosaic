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
	public static var entry_list;
	public static var _id:Int;
	public static var _round_ind:Int;
    public static var _score:Int;
    public static var _level:Int;
    public static var _blue_reward_prob:Float;
    public static var _green_reward_prob:Float;
    public static var _round_reward_prob:Float;
    public static var _choice_correct:String;
    public static var _reward_blue:Int;
    public static var _reward_green:Int;
    public static var _choice_player:String;
    public static var _player_won:Int;
    public static var _timestamp:Dynamic;
	public static var _subj_mail:String;
	public static var _user_pw:String;
	public static var _contact_cb:Bool;
	
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
}