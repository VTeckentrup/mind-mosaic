package;

import openfl.Assets;
import openfl.display.Bitmap;

class AssetPreparation {
	
	static public function loadImage(imagepath:String):Bitmap {
		
		var asset_bd = Assets.getBitmapData(imagepath);
		var asset_b = new Bitmap(asset_bd);
		asset_b.smoothing = true;
		
		return asset_b;
		
	}
	
	
	static public function getPathogens() {
		
		for (i in 1...runs) {
			
			var imgpath_str = "img/pathogen_" + Std.string(i) + ".png";
			pathogen_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
	}
	
	
	static public function getBackgrounds() {
		
		for (i in 1...runs) {
			
			var imgpath_str = "img/lab_background_" + Std.string(i) + ".png";
			background_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
		var imgpath_str = "img/menu_background.png";
		img_menu_background = AssetPreparation.loadImage(imgpath_str);
		
		var imgpath_str = "img/gallery_background.png";
		img_gallery_background = AssetPreparation.loadImage(imgpath_str);
		
	}
	
	
	static public function getNotepads() {
		
		for (i in 1...6) {
			
			var imgpath_str = "img/notepad_" + Std.string(i) + ".png";
			notepad_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
	}
	
	
	static public function getSyringes() {
		
		// load 12 syringe images for standard runs
		for (i in 1...12) {
			
			var imgpath_str = "img/syringe_lab_1_full_" + Std.string(i) + ".png";
			syringe_1_full_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_2_full_" + Std.string(i) + ".png";
			syringe_2_full_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_3_full_" + Std.string(i) + ".png";
			syringe_3_full_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_4_full_" + Std.string(i) + ".png";
			syringe_4_full_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_5_full_" + Std.string(i) + ".png";
			syringe_5_full_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_1_empty_" + Std.string(i) + ".png";
			syringe_1_empty_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_2_empty_" + Std.string(i) + ".png";
			syringe_2_empty_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_3_empty_" + Std.string(i) + ".png";
			syringe_3_empty_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_4_empty_" + Std.string(i) + ".png";
			syringe_4_empty_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_lab_5_empty_" + Std.string(i) + ".png";
			syringe_5_empty_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
		// load 2 syringe images for bonus run
		for (i in 1...2) {
		
			var imgpath_str = "img/syringe_bonus_full_" + Std.string(i) + ".png";
			syringe_bonus_full_array[i] = AssetPreparation.loadImage(imgpath_str);
			
			var imgpath_str = "img/syringe_bonus_empty_" + Std.string(i) + ".png";
			syringe_bonus_empty_array[i] = AssetPreparation.loadImage(imgpath_str);
		
		}
		
	}
	
}