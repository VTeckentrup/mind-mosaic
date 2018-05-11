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
		
		#end
		
		var data, manifest, library;
		
		data = '{"name":null,"assets":"aoy4:sizei6795y4:typey5:IMAGEy9:classNamey24:__ASSET__img_correct_pngy2:idy17:img%2Fcorrect.pnggoR0i346474R1R2R3y35:__ASSET__img_gallery_background_pngR5y28:img%2Fgallery_background.pnggoR0i7805R1R2R3y35:__ASSET__img_info_button_normal_pngR5y28:img%2Finfo_button_normal.pnggoR0i11940R1R2R3y36:__ASSET__img_info_button_pressed_pngR5y29:img%2Finfo_button_pressed.pnggoR0i618840R1R2R3y33:__ASSET__img_input_background_pngR5y26:img%2Finput_background.pnggoR0i246703R1R2R3y33:__ASSET__img_lab_background_1_pngR5y26:img%2Flab_background_1.pnggoR0i317852R1R2R3y34:__ASSET__img_lab_background_10_pngR5y27:img%2Flab_background_10.pnggoR0i300561R1R2R3y34:__ASSET__img_lab_background_11_pngR5y27:img%2Flab_background_11.pnggoR0i330611R1R2R3y34:__ASSET__img_lab_background_12_pngR5y27:img%2Flab_background_12.pnggoR0i227572R1R2R3y34:__ASSET__img_lab_background_13_pngR5y27:img%2Flab_background_13.pnggoR0i214299R1R2R3y34:__ASSET__img_lab_background_14_pngR5y27:img%2Flab_background_14.pnggoR0i134874R1R2R3y34:__ASSET__img_lab_background_15_pngR5y27:img%2Flab_background_15.pnggoR0i190576R1R2R3y34:__ASSET__img_lab_background_16_pngR5y27:img%2Flab_background_16.pnggoR0i237025R1R2R3y34:__ASSET__img_lab_background_17_pngR5y27:img%2Flab_background_17.pnggoR0i269089R1R2R3y34:__ASSET__img_lab_background_18_pngR5y27:img%2Flab_background_18.pnggoR0i198567R1R2R3y34:__ASSET__img_lab_background_19_pngR5y27:img%2Flab_background_19.pnggoR0i244840R1R2R3y33:__ASSET__img_lab_background_2_pngR5y26:img%2Flab_background_2.pnggoR0i199233R1R2R3y34:__ASSET__img_lab_background_20_pngR5y27:img%2Flab_background_20.pnggoR0i254854R1R2R3y34:__ASSET__img_lab_background_21_pngR5y27:img%2Flab_background_21.pnggoR0i341219R1R2R3y34:__ASSET__img_lab_background_22_pngR5y27:img%2Flab_background_22.pnggoR0i328683R1R2R3y34:__ASSET__img_lab_background_23_pngR5y27:img%2Flab_background_23.pnggoR0i347147R1R2R3y34:__ASSET__img_lab_background_24_pngR5y27:img%2Flab_background_24.pnggoR0i219484R1R2R3y34:__ASSET__img_lab_background_25_pngR5y27:img%2Flab_background_25.pnggoR0i288381R1R2R3y34:__ASSET__img_lab_background_26_pngR5y27:img%2Flab_background_26.pnggoR0i312588R1R2R3y34:__ASSET__img_lab_background_27_pngR5y27:img%2Flab_background_27.pnggoR0i350360R1R2R3y34:__ASSET__img_lab_background_28_pngR5y27:img%2Flab_background_28.pnggoR0i458754R1R2R3y34:__ASSET__img_lab_background_29_pngR5y27:img%2Flab_background_29.pnggoR0i220571R1R2R3y33:__ASSET__img_lab_background_3_pngR5y26:img%2Flab_background_3.pnggoR0i466928R1R2R3y34:__ASSET__img_lab_background_30_pngR5y27:img%2Flab_background_30.pnggoR0i435612R1R2R3y34:__ASSET__img_lab_background_31_pngR5y27:img%2Flab_background_31.pnggoR0i213075R1R2R3y33:__ASSET__img_lab_background_4_pngR5y26:img%2Flab_background_4.pnggoR0i257512R1R2R3y33:__ASSET__img_lab_background_5_pngR5y26:img%2Flab_background_5.pnggoR0i275609R1R2R3y33:__ASSET__img_lab_background_6_pngR5y26:img%2Flab_background_6.pnggoR0i242595R1R2R3y33:__ASSET__img_lab_background_7_pngR5y26:img%2Flab_background_7.pnggoR0i277723R1R2R3y33:__ASSET__img_lab_background_8_pngR5y26:img%2Flab_background_8.pnggoR0i333854R1R2R3y33:__ASSET__img_lab_background_9_pngR5y26:img%2Flab_background_9.pnggoR0i1137148R1R2R3y32:__ASSET__img_menu_background_pngR5y25:img%2Fmenu_background.pnggoR0i13262R1R2R3y35:__ASSET__img_menu_button_normal_pngR5y28:img%2Fmenu_button_normal.pnggoR0i18690R1R2R3y36:__ASSET__img_menu_button_pressed_pngR5y29:img%2Fmenu_button_pressed.pnggoR0i18275R1R2R3y26:__ASSET__img_notepad_1_pngR5y19:img%2Fnotepad_1.pnggoR0i19216R1R2R3y26:__ASSET__img_notepad_2_pngR5y19:img%2Fnotepad_2.pnggoR0i16094R1R2R3y26:__ASSET__img_notepad_3_pngR5y19:img%2Fnotepad_3.pnggoR0i14967R1R2R3y26:__ASSET__img_notepad_4_pngR5y19:img%2Fnotepad_4.pnggoR0i27618R1R2R3y26:__ASSET__img_notepad_5_pngR5y19:img%2Fnotepad_5.pnggoR0i36855R1R2R3y26:__ASSET__img_notepad_6_pngR5y19:img%2Fnotepad_6.pnggoR0i24492R1R2R3y38:__ASSET__img_syringe_bonus_empty_1_pngR5y31:img%2Fsyringe_bonus_empty_1.pnggoR0i24681R1R2R3y38:__ASSET__img_syringe_bonus_empty_2_pngR5y31:img%2Fsyringe_bonus_empty_2.pnggoR0i19776R1R2R3y37:__ASSET__img_syringe_bonus_full_1_pngR5y30:img%2Fsyringe_bonus_full_1.pnggoR0i21261R1R2R3y37:__ASSET__img_syringe_bonus_full_2_pngR5y30:img%2Fsyringe_bonus_full_2.pnggoR0i41305R1R2R3y38:__ASSET__img_syringe_lab_1_empty_1_pngR5y31:img%2Fsyringe_lab_1_empty_1.pnggoR0i41638R1R2R3y39:__ASSET__img_syringe_lab_1_empty_10_pngR5y32:img%2Fsyringe_lab_1_empty_10.pnggoR0i41300R1R2R3y39:__ASSET__img_syringe_lab_1_empty_11_pngR5y32:img%2Fsyringe_lab_1_empty_11.pnggoR0i41317R1R2R3y39:__ASSET__img_syringe_lab_1_empty_12_pngR5y32:img%2Fsyringe_lab_1_empty_12.pnggoR0i41654R1R2R3y38:__ASSET__img_syringe_lab_1_empty_2_pngR5y31:img%2Fsyringe_lab_1_empty_2.pnggoR0i41624R1R2R3y38:__ASSET__img_syringe_lab_1_empty_3_pngR5y31:img%2Fsyringe_lab_1_empty_3.pnggoR0i41748R1R2R3y38:__ASSET__img_syringe_lab_1_empty_4_pngR5y31:img%2Fsyringe_lab_1_empty_4.pnggoR0i41528R1R2R3y38:__ASSET__img_syringe_lab_1_empty_5_pngR5y31:img%2Fsyringe_lab_1_empty_5.pnggoR0i41547R1R2R3y38:__ASSET__img_syringe_lab_1_empty_6_pngR5y31:img%2Fsyringe_lab_1_empty_6.pnggoR0i41317R1R2R3y38:__ASSET__img_syringe_lab_1_empty_7_pngR5y31:img%2Fsyringe_lab_1_empty_7.pnggoR0i41621R1R2R3y38:__ASSET__img_syringe_lab_1_empty_8_pngR5y31:img%2Fsyringe_lab_1_empty_8.pnggoR0i41286R1R2R3y38:__ASSET__img_syringe_lab_1_empty_9_pngR5y31:img%2Fsyringe_lab_1_empty_9.pnggoR0i37164R1R2R3y37:__ASSET__img_syringe_lab_1_full_1_pngR5y30:img%2Fsyringe_lab_1_full_1.pnggoR0i36548R1R2R3y38:__ASSET__img_syringe_lab_1_full_10_pngR5y31:img%2Fsyringe_lab_1_full_10.pnggoR0i36599R1R2R3y38:__ASSET__img_syringe_lab_1_full_11_pngR5y31:img%2Fsyringe_lab_1_full_11.pnggoR0i37056R1R2R3y38:__ASSET__img_syringe_lab_1_full_12_pngR5y31:img%2Fsyringe_lab_1_full_12.pnggoR0i37016R1R2R3y37:__ASSET__img_syringe_lab_1_full_2_pngR5y30:img%2Fsyringe_lab_1_full_2.pnggoR0i37314R1R2R3y37:__ASSET__img_syringe_lab_1_full_3_pngR5y30:img%2Fsyringe_lab_1_full_3.pnggoR0i37130R1R2R3y37:__ASSET__img_syringe_lab_1_full_4_pngR5y30:img%2Fsyringe_lab_1_full_4.pnggoR0i36908R1R2R3y37:__ASSET__img_syringe_lab_1_full_5_pngR5y30:img%2Fsyringe_lab_1_full_5.pnggoR0i36982R1R2R3y37:__ASSET__img_syringe_lab_1_full_6_pngR5y30:img%2Fsyringe_lab_1_full_6.pnggoR0i37144R1R2R3y37:__ASSET__img_syringe_lab_1_full_7_pngR5y30:img%2Fsyringe_lab_1_full_7.pnggoR0i37623R1R2R3y37:__ASSET__img_syringe_lab_1_full_8_pngR5y30:img%2Fsyringe_lab_1_full_8.pnggoR0i37163R1R2R3y37:__ASSET__img_syringe_lab_1_full_9_pngR5y30:img%2Fsyringe_lab_1_full_9.pnggoR0i36646R1R2R3y38:__ASSET__img_syringe_lab_2_empty_1_pngR5y31:img%2Fsyringe_lab_2_empty_1.pnggoR0i36374R1R2R3y39:__ASSET__img_syringe_lab_2_empty_10_pngR5y32:img%2Fsyringe_lab_2_empty_10.pnggoR0i36722R1R2R3y39:__ASSET__img_syringe_lab_2_empty_11_pngR5y32:img%2Fsyringe_lab_2_empty_11.pnggoR0i36837R1R2R3y39:__ASSET__img_syringe_lab_2_empty_12_pngR5y32:img%2Fsyringe_lab_2_empty_12.pnggoR0i36823R1R2R3y38:__ASSET__img_syringe_lab_2_empty_2_pngR5y31:img%2Fsyringe_lab_2_empty_2.pnggoR0i36865R1R2R3y38:__ASSET__img_syringe_lab_2_empty_3_pngR5y31:img%2Fsyringe_lab_2_empty_3.pnggoR0i36712R1R2R3y38:__ASSET__img_syringe_lab_2_empty_4_pngR5y31:img%2Fsyringe_lab_2_empty_4.pnggoR0i36690R1R2R3y38:__ASSET__img_syringe_lab_2_empty_5_pngR5y31:img%2Fsyringe_lab_2_empty_5.pnggoR0i37024R1R2R3y38:__ASSET__img_syringe_lab_2_empty_6_pngR5y31:img%2Fsyringe_lab_2_empty_6.pnggoR0i36415R1R2R3y38:__ASSET__img_syringe_lab_2_empty_7_pngR5y31:img%2Fsyringe_lab_2_empty_7.pnggoR0i36713R1R2R3y38:__ASSET__img_syringe_lab_2_empty_8_pngR5y31:img%2Fsyringe_lab_2_empty_8.pnggoR0i36175R1R2R3y38:__ASSET__img_syringe_lab_2_empty_9_pngR5y31:img%2Fsyringe_lab_2_empty_9.pnggoR0i33338R1R2R3y37:__ASSET__img_syringe_lab_2_full_1_pngR5y30:img%2Fsyringe_lab_2_full_1.pnggoR0i32765R1R2R3y38:__ASSET__img_syringe_lab_2_full_10_pngR5y31:img%2Fsyringe_lab_2_full_10.pnggoR0i34251R1R2R3y38:__ASSET__img_syringe_lab_2_full_11_pngR5y31:img%2Fsyringe_lab_2_full_11.pnggoR0i34383R1R2R3y38:__ASSET__img_syringe_lab_2_full_12_pngR5y31:img%2Fsyringe_lab_2_full_12.pnggoR0i34596R1R2R3y37:__ASSET__img_syringe_lab_2_full_2_pngR5y30:img%2Fsyringe_lab_2_full_2.pnggoR0i34571R1R2R3y37:__ASSET__img_syringe_lab_2_full_3_pngR5y30:img%2Fsyringe_lab_2_full_3.pnggoR0i34271R1R2R3y37:__ASSET__img_syringe_lab_2_full_4_pngR5y30:img%2Fsyringe_lab_2_full_4.pnggoR0i34183R1R2R3y37:__ASSET__img_syringe_lab_2_full_5_pngR5y30:img%2Fsyringe_lab_2_full_5.pnggoR0i34359R1R2R3y37:__ASSET__img_syringe_lab_2_full_6_pngR5y30:img%2Fsyringe_lab_2_full_6.pnggoR0i33924R1R2R3y37:__ASSET__img_syringe_lab_2_full_7_pngR5y30:img%2Fsyringe_lab_2_full_7.pnggoR0i34587R1R2R3y37:__ASSET__img_syringe_lab_2_full_8_pngR5y30:img%2Fsyringe_lab_2_full_8.pnggoR0i32129R1R2R3y37:__ASSET__img_syringe_lab_2_full_9_pngR5y30:img%2Fsyringe_lab_2_full_9.pnggoR0i32189R1R2R3y38:__ASSET__img_syringe_lab_3_empty_1_pngR5y31:img%2Fsyringe_lab_3_empty_1.pnggoR0i32783R1R2R3y39:__ASSET__img_syringe_lab_3_empty_10_pngR5y32:img%2Fsyringe_lab_3_empty_10.pnggoR0i33542R1R2R3y39:__ASSET__img_syringe_lab_3_empty_11_pngR5y32:img%2Fsyringe_lab_3_empty_11.pnggoR0i32958R1R2R3y39:__ASSET__img_syringe_lab_3_empty_12_pngR5y32:img%2Fsyringe_lab_3_empty_12.pnggoR0i32965R1R2R3y38:__ASSET__img_syringe_lab_3_empty_2_pngR5y31:img%2Fsyringe_lab_3_empty_2.pnggoR0i32661R1R2R3y38:__ASSET__img_syringe_lab_3_empty_3_pngR5y31:img%2Fsyringe_lab_3_empty_3.pnggoR0i32677R1R2R3y38:__ASSET__img_syringe_lab_3_empty_4_pngR5y31:img%2Fsyringe_lab_3_empty_4.pnggoR0i32697R1R2R3y38:__ASSET__img_syringe_lab_3_empty_5_pngR5y31:img%2Fsyringe_lab_3_empty_5.pnggoR0i32812R1R2R3y38:__ASSET__img_syringe_lab_3_empty_6_pngR5y31:img%2Fsyringe_lab_3_empty_6.pnggoR0i32700R1R2R3y38:__ASSET__img_syringe_lab_3_empty_7_pngR5y31:img%2Fsyringe_lab_3_empty_7.pnggoR0i32205R1R2R3y38:__ASSET__img_syringe_lab_3_empty_8_pngR5y31:img%2Fsyringe_lab_3_empty_8.pnggoR0i32542R1R2R3y38:__ASSET__img_syringe_lab_3_empty_9_pngR5y31:img%2Fsyringe_lab_3_empty_9.pnggoR0i29837R1R2R3y37:__ASSET__img_syringe_lab_3_full_1_pngR5y30:img%2Fsyringe_lab_3_full_1.pnggoR0i30778R1R2R3y38:__ASSET__img_syringe_lab_3_full_10_pngR5y31:img%2Fsyringe_lab_3_full_10.pnggoR0i31494R1R2R3y38:__ASSET__img_syringe_lab_3_full_11_pngR5y31:img%2Fsyringe_lab_3_full_11.pnggoR0i30609R1R2R3y38:__ASSET__img_syringe_lab_3_full_12_pngR5y31:img%2Fsyringe_lab_3_full_12.pnggoR0i30549R1R2R3y37:__ASSET__img_syringe_lab_3_full_2_pngR5y30:img%2Fsyringe_lab_3_full_2.pnggoR0i30776R1R2R3y37:__ASSET__img_syringe_lab_3_full_3_pngR5y30:img%2Fsyringe_lab_3_full_3.pnggoR0i30932R1R2R3y37:__ASSET__img_syringe_lab_3_full_4_pngR5y30:img%2Fsyringe_lab_3_full_4.pnggoR0i31053R1R2R3y37:__ASSET__img_syringe_lab_3_full_5_pngR5y30:img%2Fsyringe_lab_3_full_5.pnggoR0i31468R1R2R3y37:__ASSET__img_syringe_lab_3_full_6_pngR5y30:img%2Fsyringe_lab_3_full_6.pnggoR0i28929R1R2R3y37:__ASSET__img_syringe_lab_3_full_7_pngR5y30:img%2Fsyringe_lab_3_full_7.pnggoR0i30058R1R2R3y37:__ASSET__img_syringe_lab_3_full_8_pngR5y30:img%2Fsyringe_lab_3_full_8.pnggoR0i30098R1R2R3y37:__ASSET__img_syringe_lab_3_full_9_pngR5y30:img%2Fsyringe_lab_3_full_9.pnggoR0i29694R1R2R3y38:__ASSET__img_syringe_lab_4_empty_1_pngR5y31:img%2Fsyringe_lab_4_empty_1.pnggoR0i29788R1R2R3y39:__ASSET__img_syringe_lab_4_empty_10_pngR5y32:img%2Fsyringe_lab_4_empty_10.pnggoR0i29685R1R2R3y39:__ASSET__img_syringe_lab_4_empty_11_pngR5y32:img%2Fsyringe_lab_4_empty_11.pnggoR0i29946R1R2R3y39:__ASSET__img_syringe_lab_4_empty_12_pngR5y32:img%2Fsyringe_lab_4_empty_12.pnggoR0i29863R1R2R3y38:__ASSET__img_syringe_lab_4_empty_2_pngR5y31:img%2Fsyringe_lab_4_empty_2.pnggoR0i29792R1R2R3y38:__ASSET__img_syringe_lab_4_empty_3_pngR5y31:img%2Fsyringe_lab_4_empty_3.pnggoR0i29705R1R2R3y38:__ASSET__img_syringe_lab_4_empty_4_pngR5y31:img%2Fsyringe_lab_4_empty_4.pnggoR0i29817R1R2R3y38:__ASSET__img_syringe_lab_4_empty_5_pngR5y31:img%2Fsyringe_lab_4_empty_5.pnggoR0i29563R1R2R3y38:__ASSET__img_syringe_lab_4_empty_6_pngR5y31:img%2Fsyringe_lab_4_empty_6.pnggoR0i29768R1R2R3y38:__ASSET__img_syringe_lab_4_empty_7_pngR5y31:img%2Fsyringe_lab_4_empty_7.pnggoR0i29768R1R2R3y38:__ASSET__img_syringe_lab_4_empty_8_pngR5y31:img%2Fsyringe_lab_4_empty_8.pnggoR0i29636R1R2R3y38:__ASSET__img_syringe_lab_4_empty_9_pngR5y31:img%2Fsyringe_lab_4_empty_9.pnggoR0i23598R1R2R3y37:__ASSET__img_syringe_lab_4_full_1_pngR5y30:img%2Fsyringe_lab_4_full_1.pnggoR0i23873R1R2R3y38:__ASSET__img_syringe_lab_4_full_10_pngR5y31:img%2Fsyringe_lab_4_full_10.pnggoR0i23728R1R2R3y38:__ASSET__img_syringe_lab_4_full_11_pngR5y31:img%2Fsyringe_lab_4_full_11.pnggoR0i23453R1R2R3y38:__ASSET__img_syringe_lab_4_full_12_pngR5y31:img%2Fsyringe_lab_4_full_12.pnggoR0i23532R1R2R3y37:__ASSET__img_syringe_lab_4_full_2_pngR5y30:img%2Fsyringe_lab_4_full_2.pnggoR0i23553R1R2R3y37:__ASSET__img_syringe_lab_4_full_3_pngR5y30:img%2Fsyringe_lab_4_full_3.pnggoR0i23600R1R2R3y37:__ASSET__img_syringe_lab_4_full_4_pngR5y30:img%2Fsyringe_lab_4_full_4.pnggoR0i23489R1R2R3y37:__ASSET__img_syringe_lab_4_full_5_pngR5y30:img%2Fsyringe_lab_4_full_5.pnggoR0i23768R1R2R3y37:__ASSET__img_syringe_lab_4_full_6_pngR5y30:img%2Fsyringe_lab_4_full_6.pnggoR0i24074R1R2R3y37:__ASSET__img_syringe_lab_4_full_7_pngR5y30:img%2Fsyringe_lab_4_full_7.pnggoR0i23537R1R2R3y37:__ASSET__img_syringe_lab_4_full_8_pngR5y30:img%2Fsyringe_lab_4_full_8.pnggoR0i23780R1R2R3y37:__ASSET__img_syringe_lab_4_full_9_pngR5y30:img%2Fsyringe_lab_4_full_9.pnggoR0i25909R1R2R3y38:__ASSET__img_syringe_lab_5_empty_1_pngR5y31:img%2Fsyringe_lab_5_empty_1.pnggoR0i25951R1R2R3y39:__ASSET__img_syringe_lab_5_empty_10_pngR5y32:img%2Fsyringe_lab_5_empty_10.pnggoR0i26027R1R2R3y39:__ASSET__img_syringe_lab_5_empty_11_pngR5y32:img%2Fsyringe_lab_5_empty_11.pnggoR0i25889R1R2R3y39:__ASSET__img_syringe_lab_5_empty_12_pngR5y32:img%2Fsyringe_lab_5_empty_12.pnggoR0i26016R1R2R3y38:__ASSET__img_syringe_lab_5_empty_2_pngR5y31:img%2Fsyringe_lab_5_empty_2.pnggoR0i25945R1R2R3y38:__ASSET__img_syringe_lab_5_empty_3_pngR5y31:img%2Fsyringe_lab_5_empty_3.pnggoR0i26066R1R2R3y38:__ASSET__img_syringe_lab_5_empty_4_pngR5y31:img%2Fsyringe_lab_5_empty_4.pnggoR0i26003R1R2R3y38:__ASSET__img_syringe_lab_5_empty_5_pngR5y31:img%2Fsyringe_lab_5_empty_5.pnggoR0i25994R1R2R3y38:__ASSET__img_syringe_lab_5_empty_6_pngR5y31:img%2Fsyringe_lab_5_empty_6.pnggoR0i26026R1R2R3y38:__ASSET__img_syringe_lab_5_empty_7_pngR5y31:img%2Fsyringe_lab_5_empty_7.pnggoR0i26028R1R2R3y38:__ASSET__img_syringe_lab_5_empty_8_pngR5y31:img%2Fsyringe_lab_5_empty_8.pnggoR0i26027R1R2R3y38:__ASSET__img_syringe_lab_5_empty_9_pngR5y31:img%2Fsyringe_lab_5_empty_9.pnggoR0i22659R1R2R3y37:__ASSET__img_syringe_lab_5_full_1_pngR5y30:img%2Fsyringe_lab_5_full_1.pnggoR0i23995R1R2R3y38:__ASSET__img_syringe_lab_5_full_10_pngR5y31:img%2Fsyringe_lab_5_full_10.pnggoR0i24528R1R2R3y38:__ASSET__img_syringe_lab_5_full_11_pngR5y31:img%2Fsyringe_lab_5_full_11.pnggoR0i23719R1R2R3y38:__ASSET__img_syringe_lab_5_full_12_pngR5y31:img%2Fsyringe_lab_5_full_12.pnggoR0i24562R1R2R3y37:__ASSET__img_syringe_lab_5_full_2_pngR5y30:img%2Fsyringe_lab_5_full_2.pnggoR0i24072R1R2R3y37:__ASSET__img_syringe_lab_5_full_3_pngR5y30:img%2Fsyringe_lab_5_full_3.pnggoR0i24780R1R2R3y37:__ASSET__img_syringe_lab_5_full_4_pngR5y30:img%2Fsyringe_lab_5_full_4.pnggoR0i24472R1R2R3y37:__ASSET__img_syringe_lab_5_full_5_pngR5y30:img%2Fsyringe_lab_5_full_5.pnggoR0i24434R1R2R3y37:__ASSET__img_syringe_lab_5_full_6_pngR5y30:img%2Fsyringe_lab_5_full_6.pnggoR0i24465R1R2R3y37:__ASSET__img_syringe_lab_5_full_7_pngR5y30:img%2Fsyringe_lab_5_full_7.pnggoR0i24542R1R2R3y37:__ASSET__img_syringe_lab_5_full_8_pngR5y30:img%2Fsyringe_lab_5_full_8.pnggoR0i24513R1R2R3y37:__ASSET__img_syringe_lab_5_full_9_pngR5y30:img%2Fsyringe_lab_5_full_9.pnggoR0i7228R1R2R3y22:__ASSET__img_wrong_pngR5y15:img%2Fwrong.pnggh","version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

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
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("assets/img/correct.png") #if display private #end class __ASSET__img_correct_png extends lime.graphics.Image {}
@:image("assets/img/gallery_background.png") #if display private #end class __ASSET__img_gallery_background_png extends lime.graphics.Image {}
@:image("assets/img/info_button_normal.png") #if display private #end class __ASSET__img_info_button_normal_png extends lime.graphics.Image {}
@:image("assets/img/info_button_pressed.png") #if display private #end class __ASSET__img_info_button_pressed_png extends lime.graphics.Image {}
@:image("assets/img/input_background.png") #if display private #end class __ASSET__img_input_background_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_1.png") #if display private #end class __ASSET__img_lab_background_1_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_10.png") #if display private #end class __ASSET__img_lab_background_10_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_11.png") #if display private #end class __ASSET__img_lab_background_11_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_12.png") #if display private #end class __ASSET__img_lab_background_12_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_13.png") #if display private #end class __ASSET__img_lab_background_13_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_14.png") #if display private #end class __ASSET__img_lab_background_14_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_15.png") #if display private #end class __ASSET__img_lab_background_15_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_16.png") #if display private #end class __ASSET__img_lab_background_16_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_17.png") #if display private #end class __ASSET__img_lab_background_17_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_18.png") #if display private #end class __ASSET__img_lab_background_18_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_19.png") #if display private #end class __ASSET__img_lab_background_19_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_2.png") #if display private #end class __ASSET__img_lab_background_2_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_20.png") #if display private #end class __ASSET__img_lab_background_20_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_21.png") #if display private #end class __ASSET__img_lab_background_21_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_22.png") #if display private #end class __ASSET__img_lab_background_22_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_23.png") #if display private #end class __ASSET__img_lab_background_23_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_24.png") #if display private #end class __ASSET__img_lab_background_24_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_25.png") #if display private #end class __ASSET__img_lab_background_25_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_26.png") #if display private #end class __ASSET__img_lab_background_26_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_27.png") #if display private #end class __ASSET__img_lab_background_27_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_28.png") #if display private #end class __ASSET__img_lab_background_28_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_29.png") #if display private #end class __ASSET__img_lab_background_29_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_3.png") #if display private #end class __ASSET__img_lab_background_3_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_30.png") #if display private #end class __ASSET__img_lab_background_30_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_31.png") #if display private #end class __ASSET__img_lab_background_31_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_4.png") #if display private #end class __ASSET__img_lab_background_4_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_5.png") #if display private #end class __ASSET__img_lab_background_5_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_6.png") #if display private #end class __ASSET__img_lab_background_6_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_7.png") #if display private #end class __ASSET__img_lab_background_7_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_8.png") #if display private #end class __ASSET__img_lab_background_8_png extends lime.graphics.Image {}
@:image("assets/img/lab_background_9.png") #if display private #end class __ASSET__img_lab_background_9_png extends lime.graphics.Image {}
@:image("assets/img/menu_background.png") #if display private #end class __ASSET__img_menu_background_png extends lime.graphics.Image {}
@:image("assets/img/menu_button_normal.png") #if display private #end class __ASSET__img_menu_button_normal_png extends lime.graphics.Image {}
@:image("assets/img/menu_button_pressed.png") #if display private #end class __ASSET__img_menu_button_pressed_png extends lime.graphics.Image {}
@:image("assets/img/notepad_1.png") #if display private #end class __ASSET__img_notepad_1_png extends lime.graphics.Image {}
@:image("assets/img/notepad_2.png") #if display private #end class __ASSET__img_notepad_2_png extends lime.graphics.Image {}
@:image("assets/img/notepad_3.png") #if display private #end class __ASSET__img_notepad_3_png extends lime.graphics.Image {}
@:image("assets/img/notepad_4.png") #if display private #end class __ASSET__img_notepad_4_png extends lime.graphics.Image {}
@:image("assets/img/notepad_5.png") #if display private #end class __ASSET__img_notepad_5_png extends lime.graphics.Image {}
@:image("assets/img/notepad_6.png") #if display private #end class __ASSET__img_notepad_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_bonus_empty_1.png") #if display private #end class __ASSET__img_syringe_bonus_empty_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_bonus_empty_2.png") #if display private #end class __ASSET__img_syringe_bonus_empty_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_bonus_full_1.png") #if display private #end class __ASSET__img_syringe_bonus_full_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_bonus_full_2.png") #if display private #end class __ASSET__img_syringe_bonus_full_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_1_empty_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_1.png") #if display private #end class __ASSET__img_syringe_lab_1_full_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_10.png") #if display private #end class __ASSET__img_syringe_lab_1_full_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_11.png") #if display private #end class __ASSET__img_syringe_lab_1_full_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_12.png") #if display private #end class __ASSET__img_syringe_lab_1_full_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_2.png") #if display private #end class __ASSET__img_syringe_lab_1_full_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_3.png") #if display private #end class __ASSET__img_syringe_lab_1_full_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_4.png") #if display private #end class __ASSET__img_syringe_lab_1_full_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_5.png") #if display private #end class __ASSET__img_syringe_lab_1_full_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_6.png") #if display private #end class __ASSET__img_syringe_lab_1_full_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_7.png") #if display private #end class __ASSET__img_syringe_lab_1_full_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_8.png") #if display private #end class __ASSET__img_syringe_lab_1_full_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_1_full_9.png") #if display private #end class __ASSET__img_syringe_lab_1_full_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_2_empty_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_1.png") #if display private #end class __ASSET__img_syringe_lab_2_full_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_10.png") #if display private #end class __ASSET__img_syringe_lab_2_full_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_11.png") #if display private #end class __ASSET__img_syringe_lab_2_full_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_12.png") #if display private #end class __ASSET__img_syringe_lab_2_full_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_2.png") #if display private #end class __ASSET__img_syringe_lab_2_full_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_3.png") #if display private #end class __ASSET__img_syringe_lab_2_full_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_4.png") #if display private #end class __ASSET__img_syringe_lab_2_full_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_5.png") #if display private #end class __ASSET__img_syringe_lab_2_full_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_6.png") #if display private #end class __ASSET__img_syringe_lab_2_full_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_7.png") #if display private #end class __ASSET__img_syringe_lab_2_full_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_8.png") #if display private #end class __ASSET__img_syringe_lab_2_full_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_2_full_9.png") #if display private #end class __ASSET__img_syringe_lab_2_full_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_3_empty_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_1.png") #if display private #end class __ASSET__img_syringe_lab_3_full_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_10.png") #if display private #end class __ASSET__img_syringe_lab_3_full_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_11.png") #if display private #end class __ASSET__img_syringe_lab_3_full_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_12.png") #if display private #end class __ASSET__img_syringe_lab_3_full_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_2.png") #if display private #end class __ASSET__img_syringe_lab_3_full_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_3.png") #if display private #end class __ASSET__img_syringe_lab_3_full_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_4.png") #if display private #end class __ASSET__img_syringe_lab_3_full_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_5.png") #if display private #end class __ASSET__img_syringe_lab_3_full_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_6.png") #if display private #end class __ASSET__img_syringe_lab_3_full_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_7.png") #if display private #end class __ASSET__img_syringe_lab_3_full_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_8.png") #if display private #end class __ASSET__img_syringe_lab_3_full_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_3_full_9.png") #if display private #end class __ASSET__img_syringe_lab_3_full_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_4_empty_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_1.png") #if display private #end class __ASSET__img_syringe_lab_4_full_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_10.png") #if display private #end class __ASSET__img_syringe_lab_4_full_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_11.png") #if display private #end class __ASSET__img_syringe_lab_4_full_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_12.png") #if display private #end class __ASSET__img_syringe_lab_4_full_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_2.png") #if display private #end class __ASSET__img_syringe_lab_4_full_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_3.png") #if display private #end class __ASSET__img_syringe_lab_4_full_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_4.png") #if display private #end class __ASSET__img_syringe_lab_4_full_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_5.png") #if display private #end class __ASSET__img_syringe_lab_4_full_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_6.png") #if display private #end class __ASSET__img_syringe_lab_4_full_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_7.png") #if display private #end class __ASSET__img_syringe_lab_4_full_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_8.png") #if display private #end class __ASSET__img_syringe_lab_4_full_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_4_full_9.png") #if display private #end class __ASSET__img_syringe_lab_4_full_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_1.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_10.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_11.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_12.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_2.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_3.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_4.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_5.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_6.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_7.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_8.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_empty_9.png") #if display private #end class __ASSET__img_syringe_lab_5_empty_9_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_1.png") #if display private #end class __ASSET__img_syringe_lab_5_full_1_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_10.png") #if display private #end class __ASSET__img_syringe_lab_5_full_10_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_11.png") #if display private #end class __ASSET__img_syringe_lab_5_full_11_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_12.png") #if display private #end class __ASSET__img_syringe_lab_5_full_12_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_2.png") #if display private #end class __ASSET__img_syringe_lab_5_full_2_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_3.png") #if display private #end class __ASSET__img_syringe_lab_5_full_3_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_4.png") #if display private #end class __ASSET__img_syringe_lab_5_full_4_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_5.png") #if display private #end class __ASSET__img_syringe_lab_5_full_5_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_6.png") #if display private #end class __ASSET__img_syringe_lab_5_full_6_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_7.png") #if display private #end class __ASSET__img_syringe_lab_5_full_7_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_8.png") #if display private #end class __ASSET__img_syringe_lab_5_full_8_png extends lime.graphics.Image {}
@:image("assets/img/syringe_lab_5_full_9.png") #if display private #end class __ASSET__img_syringe_lab_5_full_9_png extends lime.graphics.Image {}
@:image("assets/img/wrong.png") #if display private #end class __ASSET__img_wrong_png extends lime.graphics.Image {}
@:file("bin/neko/obj/tmp/manifest/default.json") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)



#end
#end