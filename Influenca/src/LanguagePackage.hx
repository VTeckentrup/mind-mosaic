/*package;

import openfl.Assets;
import haxe.Json;
import openfl.display.Bitmap;
import sys.io.File;


//nested structure of typedef
// in here there are only the screens
typedef Language = {
	
	var questionnaire_screen:Questionnaire;
	var button_texts:Buttons;
	var intro_screen:Intro;
	
	
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
}

// assignment to general buttons
typedef Buttons = {
	var back_button_text:String;
	var forward_button_text:String;
	var menu_button_text:String;
	var play_button_text:String;
}

typedef Intro = {
	
	var imgpath_intro1:String;
}

typedef Registration = {
	var registration_button:String;
}
	
class LanguagePackage {
	
	static public function assignLanguage(){	
		
		// according to choosen language (var choosen_language) choose different json language file
		
		/* already have that in the main now in onClick function
		 * if (choosen_language == "German"){
			//assigment of german json
			language_json_savepath = "lang/language_german_test.json";
		}else if (choosen_language == "English"){
			language_json_savepath = "lang/language_english.json";
		}else{
			// there needs to be an "else" case : maybe you need to choose a language? -> error elimination
			language_json_savepath = "lang/language_german_test.json";
		}
		
		
		var language_json = sys.io.File.getContent(language_json_savepath);
		// one object that takes a different json according to the choosen language
		var language_object:Language = Json.parse(language_json);
		
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
	
		//Can I change the location of this? -> leave it in AssetPreparation?
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
	
	
		

	
}*/