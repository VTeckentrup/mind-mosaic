package;

import haxe.io.Path;
import haxe.ui.components.HSlider;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;
import lime.system.System;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import AssetPreparation.Language;


class GlobalVars
{
    // maintenance
	public static var debug_mode:String = "off";
	public static var url_terms_of_service:String = "";
	
	// general settings
	public static var trials:Int = 150;
	public static var runs:Int = 31;
	public static var run_delay:Int = 2;
	
	// stage scaling
	public static var NOMINAL_WIDTH:Int = 1920;
	public static var NOMINAL_HEIGHT:Int = 1080;
	
	// setup variables database
	public static var host_address_url:String = "";
	public static var host_address:String;
	public static var host_database:String = "";
	public static var host_user:String = "";
	public static var host_PW:String = "";
	public static var db_port = 3306;
	// save variables database
	public static var db_address:String = "http://www.google.com";
	public static var trial_entry_list;
	public static var trial_entry;
	public static var run_entry_list;
	public static var run_entry;
	public static var trial_timestamps: Array<Float> = [];
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
	public static var _language:String;
		// run level
	public static var _global_score:Int;
	public static var _item_1:Null<Int>;
	public static var _item_2:Null<Int>;
	public static var _item_3:Null<Int>;
	public static var _item_4:Null<Int>;
	public static var _item_5:Null<Int>;
	public static var _item_6:Null<Int>;
	public static var _item_7:Null<Int>;
	public static var _item_8:Null<Int>;
	public static var _item_9:Null<Int>;
	public static var _item_10:Null<Int>;
	public static var _item_11:Null<Int>;
	public static var _item_12:Null<Int>;
	public static var _item_13:Null<Int>;
	public static var _item_14:Null<Int>;
	public static var _item_15:Null<Int>;
	public static var _item_16:Null<Int>;
	public static var _item_17:Null<Int>;
	public static var _item_18:Null<Int>;
	public static var _item_19:Null<Int>;
	public static var _item_20:Null<Int>;
	public static var _item_21:Null<Int>;
	public static var _item_22:Null<Int>;
	public static var _item_23:Null<Int>;
	public static var _item_24:Null<Int>;
	public static var _item_25:Null<Int>;
	public static var _item_26:Null<Int>;
	public static var _item_27:Null<Int>;
	public static var _item_28:Null<Int>;
	public static var _item_29:Null<Int>;
	public static var _item_30:Null<Int>;
	public static var _app_version:String = "0.0.7";
	public static var _num_runs_played:Int;
	public static var _date_last_run:String;
	public static var _timestamp_last_run:Float;
	public static var _minutes_to_wait:Int;
		// user info
	public static var _mail_address:String;
	public static var _password:String;
	public static var _cb_consent:Int;
	public static var _cb_contact:Int;
	public static var _keycode:Int;
	public static var _keycode_set:Int;
	
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
	
	// graphics
	// global current
	public static var img_run_background: Bitmap;
	public static var img_menu_background: Bitmap;
	public static var img_gallery_background: Bitmap;
	public static var input_background: Bitmap;
	public static var instruction_background: Bitmap;
	public static var img_feedback_correct: Bitmap;
	public static var img_feedback_wrong: Bitmap;
	public static var img_notepad_A: Bitmap;
	public static var img_notepad_B: Bitmap;
	public static var img_syringe_full_A: Bitmap;
	public static var img_syringe_empty_A: Bitmap;
	public static var img_syringe_full_B: Bitmap;
	public static var img_syringe_empty_B: Bitmap;
	public static var img_pathogen: Bitmap;
	public static var img_alternative_screen2: Bitmap;
	public static var img_instruction_1: Bitmap;
	public static var img_instruction_2: Bitmap;
	public static var img_instruction_gallery: Bitmap;
	public static var img_login_key: Bitmap;
	// background array
	public static var background_array:Array<Bitmap> = [];
	// notepad array
	public static var notepad_array_A:Array < Bitmap> = [];
	public static var notepad_array_B:Array < Bitmap> = [];
	// scoreboard array
	public static var scoreboard_array:Array < Bitmap> = [];
	//pathogen array
	public static var pathogen_array:Array<Bitmap> = [];
	
	public static var syringe_full_A_array:Array<Bitmap> = [];
	public static var syringe_full_B_array:Array<Bitmap> = [];
	public static var syringe_empty_A_array:Array<Bitmap> = [];
	public static var syringe_empty_B_array:Array<Bitmap> = [];
	// syringe array lab 1
	public static var syringe_1_full_array:Array<Bitmap> = [];
	public static var syringe_1_empty_array:Array<Bitmap> = [];
	// syringe array lab 2
	public static var syringe_2_full_array:Array<Bitmap> = [];
	public static var syringe_2_empty_array:Array<Bitmap> = [];
	// syringe array lab 3
	public static var syringe_3_full_array:Array<Bitmap> = [];
	public static var syringe_3_empty_array:Array<Bitmap> = [];
	// syringe array lab 4
	public static var syringe_4_full_array:Array<Bitmap> = [];
	public static var syringe_4_empty_array:Array<Bitmap> = [];
	// syringe array lab 5
	public static var syringe_5_full_array:Array<Bitmap> = [];
	public static var syringe_5_empty_array:Array<Bitmap> = [];
	// syringes bonus
	public static var syringe_bonus_full_array:Array<Bitmap> = [];
	public static var syringe_bonus_empty_array:Array<Bitmap> = [];
	// syringe counter
	public static var syringe_counter_A:Int;
	public static var syringe_counter_B:Int;
	// button images
	public static var menu_button_array: Array<Bitmap> = [];

	// Random walk quality control
	public static var avg_sum_abs_differences:Float;
	public static var rgw_qc:Bool;
	
	// color code array for feedback circle
	public static var circle_colors_A: Array<Int> = [];
	public static var circle_colors_B: Array<Int> = [];
	
	// questionnaire items
	public static var questionnaire_items:Array<String> = [];
	public static var anchors_likert:Array<String> = [];
	public static var quest_slider:HSlider;
	
	// instruction numbering
	public static var intro_screen_num:Int;
	public static var intro_screens_visited:Bool;
	
	// screens
	public static var game_screen:MainGameScreen;
	public static var menu_screen:Sprite;
	public static var start_screen:Sprite;
	public static var login_screen:Sprite;
	public static var language_screen:Sprite;
	public static var pw_reset_screen:Sprite;
	public static var registration_screen:Sprite;
	public static var questionnaire_screen:Sprite;
	public static var box_container:HBox;
	public static var vbox_container:VBox;
	public static var gallery_screen:Sprite;
	public static var level_screen:Sprite;
	public static var instruction_screen:Sprite;
	public static var keycode_screen:Sprite;
	public static var preferences_screen:Sprite;

	// language setup
	public static var language:Language;
}
