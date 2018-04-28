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
		
		data = '{"name":null,"assets":"aoy4:sizei384307y4:typey5:IMAGEy9:classNamey34:__ASSET__img_background_medium_pngy2:idy27:img%2Fbackground_medium.pnggoR0i26754R1y6:BINARYR3y27:__ASSET__img_logo_kopie_xcfR5y22:img%2Flogo%20Kopie.xcfgoR0i2597R1R2R3y23:__ASSET__img_virus1_pngR5y16:img%2Fvirus1.pnggoR0i2791R1R2R3y23:__ASSET__img_virus2_pngR5y16:img%2Fvirus2.pnggoR0i87124R1R2R3y23:__ASSET__img_virus3_pngR5y16:img%2Fvirus3.pnggh","version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind #if display private #end class __ASSET__img_background_medium_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_logo_kopie_xcf extends null { }
@:keep @:bind #if display private #end class __ASSET__img_virus1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_virus2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_virus3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("assets/img/background_medium.png") #if display private #end class __ASSET__img_background_medium_png extends lime.graphics.Image {}
@:file("assets/img/logo Kopie.xcf") #if display private #end class __ASSET__img_logo_kopie_xcf extends haxe.io.Bytes {}
@:image("assets/img/virus1.png") #if display private #end class __ASSET__img_virus1_png extends lime.graphics.Image {}
@:image("assets/img/virus2.png") #if display private #end class __ASSET__img_virus2_png extends lime.graphics.Image {}
@:image("assets/img/virus3.png") #if display private #end class __ASSET__img_virus3_png extends lime.graphics.Image {}
@:file("bin/neko/obj/tmp/manifest/default.json") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)



#end
#end