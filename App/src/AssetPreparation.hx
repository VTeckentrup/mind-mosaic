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
		
		for (i in 0...runs-1) {
			
			var imgpath_str = "img/pathogen_" + Std.string(i) + ".png";
			pathogen_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
	}
	
	
	static public function getBackgrounds() {
		
		for (i in 0...runs) {
			
			var imgpath_str = "img/lab_background_" + Std.string(i+1) + ".png";
			background_array[i] = AssetPreparation.loadImage(imgpath_str);
			
		}
		
		var imgpath_str = "img/menu_background.png";
		img_menu_background = AssetPreparation.loadImage(imgpath_str);
		
		var imgpath_str = "img/gallery_background.png";
		img_gallery_background = AssetPreparation.loadImage(imgpath_str);
		
		var imgpath_str = "img/correct.png";
		img_feedback_correct = AssetPreparation.loadImage(imgpath_str);
		
		var imgpath_str = "img/wrong.png";
		img_feedback_wrong = AssetPreparation.loadImage(imgpath_str);
		
	}
	
	
	static public function getNotepads() {
		
		for (i in 0...6) {
			
			var imgpath_str = "img/notepad_" + Std.string(i+1) + ".png";
			notepad_array_A[i] = AssetPreparation.loadImage(imgpath_str);
			notepad_array_B[i] = AssetPreparation.loadImage(imgpath_str);
			
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
	
}