package;


import lime.app.Config;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Config):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_roboto_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_opensans_regular_ttf);
		
		#end
		
		var data, manifest, library;
		
		Assets.libraryPaths["default"] = rootPath + "manifest/default.json";
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__styles_default_main_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_default_main_min_css extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_regular_eot extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_regular_svg extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_regular_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_regular_woff extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_regular_woff2 extends null { }
@:keep @:bind #if display private #end class __ASSET__img_alternative_screen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_alternative_screen2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_back_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_back_button_pressed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_correct_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_gallery_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_info_button_normal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_info_button_pressed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_input_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_13_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_14_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_15_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_16_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_17_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_18_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_19_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_20_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_21_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_22_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_23_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_25_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_26_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_27_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_28_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_29_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_30_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_31_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_lab_background_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_button_normal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_button_pressed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_notepad_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_notepad_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_notepad_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_notepad_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_notepad_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_notepad_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_13_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_14_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_15_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_16_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_17_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_18_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_19_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_20_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_21_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_22_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_23_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_25_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_26_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_27_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_28_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_29_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_30_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_31_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pathogen_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_bonus_empty_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_bonus_empty_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_bonus_full_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_bonus_full_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_empty_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_1_full_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_empty_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_2_full_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_empty_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_3_full_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_empty_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_4_full_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_empty_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_syringe_lab_5_full_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_wrong_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__fonts_opensans_regular_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("assets/img/alternative_screen.png") #if display private #end class __ASSET__img_alternative_screen_png extends lime.graphics.Image {}
@:keep @:image("assets/img/alternative_screen2.png") #if display private #end class __ASSET__img_alternative_screen2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/back_button.png") #if display private #end class __ASSET__img_back_button_png extends lime.graphics.Image {}
@:keep @:image("assets/img/back_button_pressed.png") #if display private #end class __ASSET__img_back_button_pressed_png extends lime.graphics.Image {}
@:keep @:image("assets/img/correct.png") #if display private #end class __ASSET__img_correct_png extends lime.graphics.Image {}
@:keep @:image("assets/img/gallery_background.png") #if display private #end class __ASSET__img_gallery_background_png extends lime.graphics.Image {}
@:keep @:image("assets/img/info_button_normal.png") #if display private #end class __ASSET__img_info_button_normal_png extends lime.graphics.Image {}
@:keep @:image("assets/img/info_button_pressed.png") #if display private #end class __ASSET__img_info_button_pressed_png extends lime.graphics.Image {}
@:keep @:image("assets/img/input_background.png") #if display private #end class __ASSET__img_input_background_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_1.png") #if display private #end class __ASSET__img_lab_background_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_10.png") #if display private #end class __ASSET__img_lab_background_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_11.png") #if display private #end class __ASSET__img_lab_background_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_12.png") #if display private #end class __ASSET__img_lab_background_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_13.png") #if display private #end class __ASSET__img_lab_background_13_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_14.png") #if display private #end class __ASSET__img_lab_background_14_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_15.png") #if display private #end class __ASSET__img_lab_background_15_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_16.png") #if display private #end class __ASSET__img_lab_background_16_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_17.png") #if display private #end class __ASSET__img_lab_background_17_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_18.png") #if display private #end class __ASSET__img_lab_background_18_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_19.png") #if display private #end class __ASSET__img_lab_background_19_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_2.png") #if display private #end class __ASSET__img_lab_background_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_20.png") #if display private #end class __ASSET__img_lab_background_20_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_21.png") #if display private #end class __ASSET__img_lab_background_21_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_22.png") #if display private #end class __ASSET__img_lab_background_22_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_23.png") #if display private #end class __ASSET__img_lab_background_23_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_24.png") #if display private #end class __ASSET__img_lab_background_24_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_25.png") #if display private #end class __ASSET__img_lab_background_25_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_26.png") #if display private #end class __ASSET__img_lab_background_26_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_27.png") #if display private #end class __ASSET__img_lab_background_27_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_28.png") #if display private #end class __ASSET__img_lab_background_28_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_29.png") #if display private #end class __ASSET__img_lab_background_29_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_3.png") #if display private #end class __ASSET__img_lab_background_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_30.png") #if display private #end class __ASSET__img_lab_background_30_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_31.png") #if display private #end class __ASSET__img_lab_background_31_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_4.png") #if display private #end class __ASSET__img_lab_background_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_5.png") #if display private #end class __ASSET__img_lab_background_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_6.png") #if display private #end class __ASSET__img_lab_background_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_7.png") #if display private #end class __ASSET__img_lab_background_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_8.png") #if display private #end class __ASSET__img_lab_background_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/lab_background_9.png") #if display private #end class __ASSET__img_lab_background_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/menu_background.png") #if display private #end class __ASSET__img_menu_background_png extends lime.graphics.Image {}
@:keep @:image("assets/img/menu_button_normal.png") #if display private #end class __ASSET__img_menu_button_normal_png extends lime.graphics.Image {}
@:keep @:image("assets/img/menu_button_pressed.png") #if display private #end class __ASSET__img_menu_button_pressed_png extends lime.graphics.Image {}
@:keep @:image("assets/img/notepad_1.png") #if display private #end class __ASSET__img_notepad_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/notepad_2.png") #if display private #end class __ASSET__img_notepad_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/notepad_3.png") #if display private #end class __ASSET__img_notepad_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/notepad_4.png") #if display private #end class __ASSET__img_notepad_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/notepad_5.png") #if display private #end class __ASSET__img_notepad_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/notepad_6.png") #if display private #end class __ASSET__img_notepad_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_1.png") #if display private #end class __ASSET__img_pathogen_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_10.png") #if display private #end class __ASSET__img_pathogen_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_11.png") #if display private #end class __ASSET__img_pathogen_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_12.png") #if display private #end class __ASSET__img_pathogen_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_13.png") #if display private #end class __ASSET__img_pathogen_13_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_14.png") #if display private #end class __ASSET__img_pathogen_14_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_15.png") #if display private #end class __ASSET__img_pathogen_15_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_16.png") #if display private #end class __ASSET__img_pathogen_16_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_17.png") #if display private #end class __ASSET__img_pathogen_17_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_18.png") #if display private #end class __ASSET__img_pathogen_18_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_19.png") #if display private #end class __ASSET__img_pathogen_19_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_2.png") #if display private #end class __ASSET__img_pathogen_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_20.png") #if display private #end class __ASSET__img_pathogen_20_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_21.png") #if display private #end class __ASSET__img_pathogen_21_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_22.png") #if display private #end class __ASSET__img_pathogen_22_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_23.png") #if display private #end class __ASSET__img_pathogen_23_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_24.png") #if display private #end class __ASSET__img_pathogen_24_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_25.png") #if display private #end class __ASSET__img_pathogen_25_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_26.png") #if display private #end class __ASSET__img_pathogen_26_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_27.png") #if display private #end class __ASSET__img_pathogen_27_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_28.png") #if display private #end class __ASSET__img_pathogen_28_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_29.png") #if display private #end class __ASSET__img_pathogen_29_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_3.png") #if display private #end class __ASSET__img_pathogen_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_30.png") #if display private #end class __ASSET__img_pathogen_30_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_31.png") #if display private #end class __ASSET__img_pathogen_31_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_4.png") #if display private #end class __ASSET__img_pathogen_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_5.png") #if display private #end class __ASSET__img_pathogen_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_6.png") #if display private #end class __ASSET__img_pathogen_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_7.png") #if display private #end class __ASSET__img_pathogen_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_8.png") #if display private #end class __ASSET__img_pathogen_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/pathogen_9.png") #if display private #end class __ASSET__img_pathogen_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_bonus_empty_1.png") #if display private #end class __ASSET__img_syringe_bonus_empty_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_bonus_empty_2.png") #if display private #end class __ASSET__img_syringe_bonus_empty_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_bonus_full_1.png") #if display private #end class __ASSET__img_syringe_bonus_full_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_bonus_full_2.png") #if display private #end class __ASSET__img_syringe_bonus_full_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_1.png") #if display private #end class __ASSET__img_syringe_lab_1_full_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_10.png") #if display private #end class __ASSET__img_syringe_lab_1_full_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_11.png") #if display private #end class __ASSET__img_syringe_lab_1_full_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_12.png") #if display private #end class __ASSET__img_syringe_lab_1_full_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_2.png") #if display private #end class __ASSET__img_syringe_lab_1_full_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_3.png") #if display private #end class __ASSET__img_syringe_lab_1_full_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_4.png") #if display private #end class __ASSET__img_syringe_lab_1_full_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_5.png") #if display private #end class __ASSET__img_syringe_lab_1_full_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_6.png") #if display private #end class __ASSET__img_syringe_lab_1_full_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_7.png") #if display private #end class __ASSET__img_syringe_lab_1_full_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_8.png") #if display private #end class __ASSET__img_syringe_lab_1_full_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_1_full_9.png") #if display private #end class __ASSET__img_syringe_lab_1_full_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_1.png") #if display private #end class __ASSET__img_syringe_lab_2_full_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_10.png") #if display private #end class __ASSET__img_syringe_lab_2_full_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_11.png") #if display private #end class __ASSET__img_syringe_lab_2_full_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_12.png") #if display private #end class __ASSET__img_syringe_lab_2_full_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_2.png") #if display private #end class __ASSET__img_syringe_lab_2_full_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_3.png") #if display private #end class __ASSET__img_syringe_lab_2_full_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_4.png") #if display private #end class __ASSET__img_syringe_lab_2_full_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_5.png") #if display private #end class __ASSET__img_syringe_lab_2_full_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_6.png") #if display private #end class __ASSET__img_syringe_lab_2_full_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_7.png") #if display private #end class __ASSET__img_syringe_lab_2_full_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_8.png") #if display private #end class __ASSET__img_syringe_lab_2_full_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_2_full_9.png") #if display private #end class __ASSET__img_syringe_lab_2_full_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_1.png") #if display private #end class __ASSET__img_syringe_lab_3_full_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_10.png") #if display private #end class __ASSET__img_syringe_lab_3_full_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_11.png") #if display private #end class __ASSET__img_syringe_lab_3_full_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_12.png") #if display private #end class __ASSET__img_syringe_lab_3_full_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_2.png") #if display private #end class __ASSET__img_syringe_lab_3_full_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_3.png") #if display private #end class __ASSET__img_syringe_lab_3_full_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_4.png") #if display private #end class __ASSET__img_syringe_lab_3_full_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_5.png") #if display private #end class __ASSET__img_syringe_lab_3_full_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_6.png") #if display private #end class __ASSET__img_syringe_lab_3_full_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_7.png") #if display private #end class __ASSET__img_syringe_lab_3_full_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_8.png") #if display private #end class __ASSET__img_syringe_lab_3_full_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_3_full_9.png") #if display private #end class __ASSET__img_syringe_lab_3_full_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_1.png") #if display private #end class __ASSET__img_syringe_lab_4_full_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_10.png") #if display private #end class __ASSET__img_syringe_lab_4_full_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_11.png") #if display private #end class __ASSET__img_syringe_lab_4_full_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_12.png") #if display private #end class __ASSET__img_syringe_lab_4_full_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_2.png") #if display private #end class __ASSET__img_syringe_lab_4_full_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_3.png") #if display private #end class __ASSET__img_syringe_lab_4_full_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_4.png") #if display private #end class __ASSET__img_syringe_lab_4_full_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_5.png") #if display private #end class __ASSET__img_syringe_lab_4_full_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_6.png") #if display private #end class __ASSET__img_syringe_lab_4_full_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_7.png") #if display private #end class __ASSET__img_syringe_lab_4_full_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_8.png") #if display private #end class __ASSET__img_syringe_lab_4_full_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_4_full_9.png") #if display private #end class __ASSET__img_syringe_lab_4_full_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_1.png") #if display private #end class __ASSET__img_syringe_lab_5_full_1_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_10.png") #if display private #end class __ASSET__img_syringe_lab_5_full_10_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_11.png") #if display private #end class __ASSET__img_syringe_lab_5_full_11_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_12.png") #if display private #end class __ASSET__img_syringe_lab_5_full_12_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_2.png") #if display private #end class __ASSET__img_syringe_lab_5_full_2_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_3.png") #if display private #end class __ASSET__img_syringe_lab_5_full_3_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_4.png") #if display private #end class __ASSET__img_syringe_lab_5_full_4_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_5.png") #if display private #end class __ASSET__img_syringe_lab_5_full_5_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_6.png") #if display private #end class __ASSET__img_syringe_lab_5_full_6_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_7.png") #if display private #end class __ASSET__img_syringe_lab_5_full_7_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_8.png") #if display private #end class __ASSET__img_syringe_lab_5_full_8_png extends lime.graphics.Image {}
@:keep @:image("assets/img/syringe_lab_5_full_9.png") #if display private #end class __ASSET__img_syringe_lab_5_full_9_png extends lime.graphics.Image {}
@:keep @:image("assets/img/wrong.png") #if display private #end class __ASSET__img_wrong_png extends lime.graphics.Image {}
@:keep @:font("assets/fonts/OpenSans-Regular.ttf") #if display private #end class __ASSET__fonts_opensans_regular_ttf extends lime.text.Font {}

@:keep #if display private #end class __ASSET__fonts_roboto_regular_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "fonts/Roboto-Regular.ttf"; name = "Roboto"; super (); }}


#else

@:keep @:expose('__ASSET__fonts_roboto_regular_ttf') #if display private #end class __ASSET__fonts_roboto_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "fonts/Roboto-Regular.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Roboto"; super (); }}
@:keep @:expose('__ASSET__fonts_opensans_regular_ttf') #if display private #end class __ASSET__fonts_opensans_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "fonts/OpenSans-Regular.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Open Sans Regular"; super (); }}


#end

#if (openfl && !flash)

@:keep @:expose('__ASSET__OPENFL__fonts_roboto_regular_ttf') #if display private #end class __ASSET__OPENFL__fonts_roboto_regular_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "fonts/Roboto-Regular.ttf"; #end name = "Roboto"; super (); }}
@:keep @:expose('__ASSET__OPENFL__fonts_opensans_regular_ttf') #if display private #end class __ASSET__OPENFL__fonts_opensans_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__fonts_opensans_regular_ttf ()); super (); }}


#end
#end