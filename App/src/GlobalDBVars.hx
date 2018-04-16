package;

import haxe.io.Path;

class GlobalDBVars
{
    public static var _id:Int;
	public static var _round_ind:Int;
    public static var _blue_reward_prob:Float;
    public static var _green_reward_prob:Float;
    public static var _round_reward_prob:Float;
    public static var _choice_correct:String;
    public static var _reward_blue:Int;
    public static var _reward_green:Int;
    public static var _choice_player:String;
    public static var _player_won:Int;
    public static var _timestamp:Dynamic;
	public static var database_path = Path.join([Path.directory(Sys.programPath()), "database"]);
}