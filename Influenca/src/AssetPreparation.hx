package;

import openfl.Assets;
import haxe.Json;
import openfl.display.Bitmap;
import sys.io.File;


//nested structure of typedef
// in here there are only the screens
typedef Language = {
	
	var questionnaire_screen:Questionnaire;
	var button_texts:Buttons;
	var menu_texts:Menu; 
	var variety_texts:Variety;
	var registration_text:Registration;
	var gameinfo_texts:GameInfo;
	var logreg_texts:LogReg;
	var PWreset_texts:PwReset;
	var keycode_texts:KeyCode;
	//var registration_screen:Registration;
	//var login_screen:Login;
	

			}

// typedef for the questionaire items
typedef Questionnaire = {
	//define typedef questionaire and define the strings in there
	var questionnaire_items_1:String;
	var questionnaire_items_2:String;
	var questionnaire_items_3:String;
	var questionnaire_items_4:String;
	var questionnaire_items_5:String;
	var questionnaire_items_6:String;
	var questionnaire_items_7:String;
	var questionnaire_items_8:String;
	var questionnaire_items_9:String;
	var questionnaire_items_10:String;
	var questionnaire_items_11:String;
	var questionnaire_items_12:String;
	var questionnaire_items_13:String;
	var questionnaire_items_14:String;
	var questionnaire_items_15:String;
	var questionnaire_items_16:String;
	var questionnaire_items_17:String;
	var questionnaire_items_18:String;
	var questionnaire_items_19:String;
	var questionnaire_items_20:String;
	var questionnaire_items_21:String;
	var questionnaire_items_22:String;
	var questionnaire_items_23:String;
	var questionnaire_items_24:String;
	var questionnaire_items_25:String;
	var questionnaire_items_26:String;
	
	var notatall:String;
	var alot:String;
	var yep:String;
	var nope:String;
	var notyet:String;
}

// assignment to general buttons
typedef Buttons = {
	var back_button_text:String;
	var forward_button_text:String;
	var menu_button_text:String;
	var play_button_text:String;
	var ok_button_text:String;
	var login_button_text:String;
}



typedef Registration = {
	var registration_button:String;
	var reset:String;
	var inf_text1:String;
	var inf_text2:String;
	var inf_text3:String;
	var inf_text4:String;
	var noInternet:String;
	var syncInf:String;
	var reg_mailused:String;
	var reg_empty:String;
	var consent_info:String;
	var inet_info:String;
	var mail_info:String;
	var pw_info:String;
	var entry_info:String;
}


typedef Menu = {
	var instr:String;
	var gal:String;
	var logout:String;
	var close:String;
	var loggedIn:String;
	var change_lang:String;
}

typedef Variety = {
	var compl_score:String;
	var level:String;
	var bonlevel:String;
	var score:String;
	var round:String;
	var of:String;
	var inftext:String;
}

typedef GameInfo = {
	var end_game:String;
	var limit_info:String;
}

typedef LogReg = {
	var log:String;
	var reg:String;
	var pw_reset:String;
	var mail:String;
	var passwt:String;
	var consent:String;
	var conditions:String;
	var check_info:String;
}

typedef PwReset = {
	var pwreset_info:String;
	var code:String;
	var newPW:String;
	var requestCode:String;
}

typedef KeyCode = {
	var keycodeinfo:String;
	var keycode_code:String;
	var keycode_accepted:String;
	var keycode_rejected:String;
	
}

class AssetPreparation {
	
	//goal: create an object that has the structure of the typedef Language and assign it with the values of the language.json file!
	
	//creates object of type Language (typedef)
	// public var german_object:Language;
	
	// method that initializes the chosen language
	static public function initializeLanguage(language_json_savepath:String):Language {
			
			var language_json = sys.io.File.getContent(language_json_savepath);
			// one object that takes a different json according to the choosen language
			var language_object:Language = Json.parse(language_json);
		
			return language_object;
	}
		
		
	
	static public function loadImage(imagepath:String):Bitmap {
		
		var asset_bd = Assets.getBitmapData(imagepath);
		var asset_b = new Bitmap(asset_bd);
		asset_b.smoothing = true;
		
		return asset_b;
		
	}
	
	static public function getButtonsText(){
		
	}
	
	static public function getRegistration(language: Language){
	
		
		
	}
	static public function getQuestionnaireItems(language_object: Language) {
		
	
		
		
	
		// according to choosen language (var choosen_language) choose different json language file
		
		/*if (choosen_language == "German"){
			//assigment of german json
			language_json_savepath = "lang/language_german_test.json";
		}else if (choosen_language == "English"){
			language_json_savepath = "lang/language_english.json";
		}else{
			// there needs to be an "else" case : maybe you need to choose a language? -> error elimination
			language_json_savepath = "lang/language_german_test.json";
		}*/
		//This should be changed later so we don't have to define it for every function
		//language_json_savepath = "lang/language_german_test.json";
		//var language_json = sys.io.File.getContent(language_json_savepath);
		// one object that takes a different json according to the choosen language
		//var language_object:Language = Json.parse(language_json);
		
		
		
		
		
		
		
		// assignment of the different elements of the json file to specific variables
		// nested structure requires this kind of call: _____.first_level.second_level
		questionnaire_items[1] = language_object.questionnaire_screen.questionnaire_items_1;
		questionnaire_items[2] =  language_object.questionnaire_screen.questionnaire_items_2;
		questionnaire_items[3] = language_object.questionnaire_screen.questionnaire_items_3;
		questionnaire_items[4] = language_object.questionnaire_screen.questionnaire_items_4;
		questionnaire_items[5] = language_object.questionnaire_screen.questionnaire_items_5;
		questionnaire_items[6] = language_object.questionnaire_screen.questionnaire_items_6;
		questionnaire_items[7] = language_object.questionnaire_screen.questionnaire_items_7;
		questionnaire_items[8] = language_object.questionnaire_screen.questionnaire_items_8;
		questionnaire_items[9] = language_object.questionnaire_screen.questionnaire_items_9;
		questionnaire_items[10] = language_object.questionnaire_screen.questionnaire_items_10;
		questionnaire_items[11] = language_object.questionnaire_screen.questionnaire_items_11;
		questionnaire_items[12] = language_object.questionnaire_screen.questionnaire_items_12;
		questionnaire_items[13] = language_object.questionnaire_screen.questionnaire_items_13;
		// EMA questions
		questionnaire_items[14] = language_object.questionnaire_screen.questionnaire_items_14;
		questionnaire_items[15] = language_object.questionnaire_screen.questionnaire_items_15;
		questionnaire_items[16] = language_object.questionnaire_screen.questionnaire_items_16;
		questionnaire_items[17] = language_object.questionnaire_screen.questionnaire_items_17;
		questionnaire_items[18] = language_object.questionnaire_screen.questionnaire_items_18;
		questionnaire_items[19] = language_object.questionnaire_screen.questionnaire_items_19;
		questionnaire_items[20] = language_object.questionnaire_screen.questionnaire_items_20;
		questionnaire_items[21] = language_object.questionnaire_screen.questionnaire_items_21;
		questionnaire_items[22] = language_object.questionnaire_screen.questionnaire_items_22;
		questionnaire_items[23] = language_object.questionnaire_screen.questionnaire_items_23;
		questionnaire_items[24] = language_object.questionnaire_screen.questionnaire_items_24;
		questionnaire_items[25] = language_object.questionnaire_screen.questionnaire_items_25;
		questionnaire_items[26] = language_object.questionnaire_screen.questionnaire_items_26;
	
		// Likert answer options
		anchors_likert[1] = "< 0,5h";
		anchors_likert[2] = "1h";
		anchors_likert[3] = "1,5h";
		anchors_likert[4] = "2h";
		anchors_likert[5] = "2,5h";
		anchors_likert[6] = "> 3h";
		
		anchors_likert[7] = "< 30 min";
		anchors_likert[8] = "0,5-1h";
		anchors_likert[9] = "1-2h";
		anchors_likert[10] = "2-4h";
		anchors_likert[11] = "4-8h";
		anchors_likert[12] = "> 8h";
		
		anchors_likert[13] = "< 20 min";
		anchors_likert[14] = "20 - 45\nmin";
		anchors_likert[15] = "45 - 70\nmin";
		anchors_likert[16] = "70 - 95\nmin";
		anchors_likert[17] = "95 - 120\nmin";
		anchors_likert[18] = "> 2h";
		
	}
	
	
	static public function getCircleColors() {
		
		circle_colors_A[1] = 0xffe700;
		circle_colors_A[2] = 0xffc707;
		circle_colors_A[3] = 0xe56c25;
		circle_colors_A[4] = 0x00a8e9;
		circle_colors_A[5] = 0x00a993;
		circle_colors_A[6] = 0x009a4e;
		circle_colors_A[7] = 0xfff200;
		circle_colors_A[8] = 0xef9d3c;
		circle_colors_A[9] = 0x00aaad;
		circle_colors_A[10] = 0xf15a22;
		circle_colors_A[11] = 0xab4a9c;
		circle_colors_A[12] = 0xec008c;
		circle_colors_A[13] = 0xfff200;
		circle_colors_A[14] = 0x00ffff;
		circle_colors_A[15] = 0xe65293;
		circle_colors_A[16] = 0x00ff00;
		circle_colors_A[17] = 0xb2d90a;
		circle_colors_A[18] = 0xa2dcab;
		circle_colors_A[19] = 0xef5061;
		circle_colors_A[20] = 0x00a04f;
		circle_colors_A[21] = 0xffeb00;
		circle_colors_A[22] = 0xb9da89;
		circle_colors_A[23] = 0x8d3f97;
		circle_colors_A[24] = 0x6b67ae;
		circle_colors_A[25] = 0xffff00;
		circle_colors_A[26] = 0xf8d155;
		circle_colors_A[27] = 0xde7c6d;
		circle_colors_A[28] = 0xf70a42;
		circle_colors_A[29] = 0x48f88a;
		circle_colors_A[30] = 0x34c400;
		circle_colors_A[31] = 0xe20052;
		
		circle_colors_B[1] = 0xba1a8d;
		circle_colors_B[2] = 0x863894;
		circle_colors_B[3] = 0x5c56a5;
		circle_colors_B[4] = 0x93c75e;
		circle_colors_B[5] = 0xe61e25;
		circle_colors_B[6] = 0xe62f50;
		circle_colors_B[7] = 0xff0000;
		circle_colors_B[8] = 0x79db2a;
		circle_colors_B[9] = 0xff3366;
		circle_colors_B[10] = 0xb2d235;
		circle_colors_B[11] = 0x149353;
		circle_colors_B[12] = 0x27e1ff;
		circle_colors_B[13] = 0xff00ff;
		circle_colors_B[14] = 0xf7941e;
		circle_colors_B[15] = 0xaadff1;
		circle_colors_B[16] = 0xed1c24;
		circle_colors_B[17] = 0xf15a22;
		circle_colors_B[18] = 0x00aeef;
		circle_colors_B[19] = 0x0ab3ef;
		circle_colors_B[20] = 0xf37a28;
		circle_colors_B[21] = 0xc81d8f;
		circle_colors_B[22] = 0xed2c2d;
		circle_colors_B[23] = 0xfec508;
		circle_colors_B[24] = 0x59c7ba;
		circle_colors_B[25] = 0xa674c4;
		circle_colors_B[26] = 0x91248b;
		circle_colors_B[27] = 0x6da6de;
		circle_colors_B[28] = 0x7cde62;
		circle_colors_B[29] = 0x0048ff;
		circle_colors_B[30] = 0x4ef6fd;
		circle_colors_B[31] = 0x00ed11;
		
	}
	
	
	static public function getPathogens() {
		
		for (i in 0...runs) {
			
			var imgpath_str = "img/pathogen_" + Std.string(i+1) + ".png";
			pathogen_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
	}
	
	
	static public function getBackgrounds() {
		
		var imgpath_str = "img/blank_key.png";
		img_login_key = AssetPreparation.loadImage(imgpath_str);
		
		imgpath_str = "img/menu_background.png";
		img_menu_background = AssetPreparation.loadImage(imgpath_str);
		
		imgpath_str = "img/gallery_background.png";
		img_gallery_background = AssetPreparation.loadImage(imgpath_str);
		
		imgpath_str = "img/input_background.png";
		input_background = AssetPreparation.loadImage(imgpath_str);
		
		imgpath_str = "img/correct.png";
		img_feedback_correct = AssetPreparation.loadImage(imgpath_str);
		
		imgpath_str = "img/wrong.png";
		img_feedback_wrong = AssetPreparation.loadImage(imgpath_str);

		imgpath_str = "img/alternative_screen2.png";
		img_alternative_screen2 = AssetPreparation.loadImage(imgpath_str);
		
		for (i in 0...runs) {
			
			imgpath_str = "img/lab_background_" + Std.string(i+1) + ".png";
			background_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
	}
	
	
	static public function getNotepads() {
		
		for (i in 0...6) {
			
			var imgpath_str = "img/notepad_" + Std.string(i+1) + ".png";
			notepad_array_A[i] = AssetPreparation.loadImage(imgpath_str);
			notepad_array_B[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
	}
	
	
	static public function getScoreBoards() {
		
		for (i in 0...6) {
			
			var imgpath_str = "img/scoreboard_lab_" + Std.string(i+1) + ".png";
			//var imgpath_str = "img/scoreboard_lab_3.png";
			scoreboard_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
	}
	
	
	static public function getSyringes() {
		
		// populate array for option A
		var counter_A = [1,3,5,7,9,11].iterator();
		for (i in counter_A) {
			
			var imgpath_str = "img/syringe_lab_1_full_" + Std.string(i) + ".png";
			syringe_full_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_1_empty_" + Std.string(i) + ".png";
			syringe_empty_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		var counter_A = [1,3,5,7,9,11].iterator();
		for (i in counter_A) {
			
			var imgpath_str = "img/syringe_lab_2_full_" + Std.string(i) + ".png";
			syringe_full_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_2_empty_" + Std.string(i) + ".png";
			syringe_empty_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		var counter_A = [1,3,5,7,9,11].iterator();
		for (i in counter_A) {
			
			var imgpath_str = "img/syringe_lab_3_full_" + Std.string(i) + ".png";
			syringe_full_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_3_empty_" + Std.string(i) + ".png";
			syringe_empty_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		var counter_A = [1,3,5,7,9,11].iterator();
		for (i in counter_A) {
			
			var imgpath_str = "img/syringe_lab_4_full_" + Std.string(i) + ".png";
			syringe_full_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_4_empty_" + Std.string(i) + ".png";
			syringe_empty_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		var counter_A = [1,3,5,7,9,11].iterator();
		for (i in counter_A) {
			
			var imgpath_str = "img/syringe_lab_5_full_" + Std.string(i) + ".png";
			syringe_full_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_5_empty_" + Std.string(i) + ".png";
			syringe_empty_A_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		// add 2 images for bonus lab at the end
		var imgpath_str = "img/syringe_bonus_full_" + Std.string(1) + ".png";
		syringe_full_A_array.push(AssetPreparation.loadImage(imgpath_str));
		var imgpath_str = "img/syringe_bonus_empty_" + Std.string(1) + ".png";
		syringe_empty_A_array.push(AssetPreparation.loadImage(imgpath_str));
		
		
		// populate array for option B
		var counter_B = [2, 4, 6, 8, 10, 12].iterator();
		for (i in counter_B) {
			
			var imgpath_str = "img/syringe_lab_1_full_" + Std.string(i) + ".png";
			syringe_full_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_1_empty_" + Std.string(i) + ".png";
			syringe_empty_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		var counter_B = [2, 4, 6, 8, 10, 12].iterator();
		for (i in counter_B) {
			
			var imgpath_str = "img/syringe_lab_2_full_" + Std.string(i) + ".png";
			syringe_full_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_2_empty_" + Std.string(i) + ".png";
			syringe_empty_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		var counter_B = [2, 4, 6, 8, 10, 12].iterator();
		for (i in counter_B) {
			
			var imgpath_str = "img/syringe_lab_3_full_" + Std.string(i) + ".png";
			syringe_full_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_3_empty_" + Std.string(i) + ".png";
			syringe_empty_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		var counter_B = [2, 4, 6, 8, 10, 12].iterator();
		for (i in counter_B) {
			
			var imgpath_str = "img/syringe_lab_4_full_" + Std.string(i) + ".png";
			syringe_full_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_4_empty_" + Std.string(i) + ".png";
			syringe_empty_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		var counter_B = [2, 4, 6, 8, 10, 12].iterator();
		for (i in counter_B) {
			
			var imgpath_str = "img/syringe_lab_5_full_" + Std.string(i) + ".png";
			syringe_full_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
			var imgpath_str = "img/syringe_lab_5_empty_" + Std.string(i) + ".png";
			syringe_empty_B_array.push(AssetPreparation.loadImage(imgpath_str));
			
		}
		
		// add 2 images for bonus lab at the end
		var imgpath_str = "img/syringe_bonus_full_" + Std.string(2) + ".png";
		syringe_full_B_array.push(AssetPreparation.loadImage(imgpath_str));
		var imgpath_str = "img/syringe_bonus_empty_" + Std.string(2) + ".png";
		syringe_empty_B_array.push(AssetPreparation.loadImage(imgpath_str));
		
		
		
		
		
		
	}
	
	//can probably be deleted!	
	public function assignLanguage() {
	
		

		/*    var s = '{
      "name": "Haxe",
      "tags": ["awesome"]
    }';
    var o:MyData = haxe.Json.parse(s);
    trace(o.name); // Haxe (a string)*/
	
	
	//assets
	
	//TRY OUT:
		//assignment of String values
		//is this syntax right? it highlights wring brakets?
		//%%%%%%%%%%%%%%%%%%%%%%%%  ???????? %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		/*var germanLanguage = {
			"questionnaire_items_1" = "Wie hungrig sind Sie im Moment?",
			"questionnaire_items_2" = "Wie satt sind Sie im Moment?"
		};
		*/
		//transfer in json object
		//german_object = haxe.Json.parse(germanLanguage);
		

		
		/*questionnaire_items[3] = "Wie durstig sind Sie im Moment?";
		questionnaire_items[4] = "Wann haben Sie die letzte Mahlzeit gegessen?";
		questionnaire_items[5] = "Haben Sie seit der letzten Mahlzeit noch genascht?";
		questionnaire_items[6] = "Haben Sie in den letzten 2h koffeinhaltige Getränke \n wie Kaffee getrunken?";
		questionnaire_items[7] = "Wie wach fühlen Sie sich im Moment?";
		questionnaire_items[8] = "Wie zufrieden fühlen Sie sich im Moment?";
		questionnaire_items[9] = "Wie niedergeschlagen fühlen Sie sich im Moment?";
		questionnaire_items[10] = "Wie gestresst fühlen Sie sich im Moment?";
		questionnaire_items[11] = "Wie stark fühlen Sie sich momentan durch Ihre \n Umgebung abgelenkt?";
		questionnaire_items[12] = "Wie stark fühlen Sie sich momentan durch Ihre \n Gedanken abgelenkt?";
		questionnaire_items[13] = "Hatten Sie seit der letzten Spielrunde einen Essanfall?";
		// EMA questions
		questionnaire_items[14] = "Hatten Sie das Gefühl von Kontrollverlust über \n die Art und Menge von Essen, oder das Gefühl \n nicht mit dem Essen aufhören zu können?";
		questionnaire_items[15] = "Haben Sie in einem abgrenzbaren Zeitraum \n (z.B. innerhalb von 2 Stunden) eine Menge an Essen gegessen, \n die andere als außerordentlich groß bezeichnen würden?";
		questionnaire_items[16] = "Haben Sie viel schneller gegessen als normal?";
		questionnaire_items[17] = "Haben Sie gegessen, bis Sie sich \n unangenehm voll gefühlt haben?";
		questionnaire_items[18] = "Haben Sie große Mengen Nahrung zu sich genommen, \n obwohl Sie sich nicht physisch hungrig gefühlt haben?";
		questionnaire_items[19] = "Haben Sie alleine gegessen, \n weil Sie sich dafür geschämt haben wie viel Sie gegessen haben?";
		questionnaire_items[20] = "Haben Sie sich nach dem Essanfall vor sich selbst geekelt, \n sich schuldig oder niedergeschlagen gefühlt?";
		questionnaire_items[21] = "Haben Sie versucht etwas zu tun, um die Folgen \n des Essanfalls zu verhindern? (z.B.  selbstverursachtes Erbrechen, \n Einnahme von Abführmitteln, exzessiver Sport...)";
		questionnaire_items[22] = "Wie stark war Ihr Drang etwas zu essen vor dem Essanfall?";
		questionnaire_items[23] = "Wie stark war Ihr Appetit vor dem Essanfall?";
		questionnaire_items[24] = "Wie intensiv war Ihr Essanfall?";
		questionnaire_items[25] = "Wann hatten Sie den letzten Essanfall?";
		questionnaire_items[26] = "Wie lange dauerte der letzte Essanfall?";
	*/
		
	}
}