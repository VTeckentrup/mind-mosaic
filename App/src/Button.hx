package;
 
import openfl.display.Sprite;
import openfl.text.*;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.display.SimpleButton;



class Button extends Sprite
	{


    public function new(s:String,type:String,image:String)
    {
        super();
		//width = Std.int(width);
		//height = Std.int(height);
		//this.graphics.beginFill(0x000000);
		//this.graphics.drawRect(-250, -72, 500, 145);
		//this.graphics.drawRect(- (width / 2), - (height / 2), width, height);
		//this.graphics.endFill();
		//this.scaleX = stageScale;
		//this.scaleY = stageScale;
		
		// ask for type to determine size of the buttons according to bitmap size -> menu buttons are bigger than infotext buttons
		if (type == "menu") {
			
			// define if button state is normal or pressed to associate correct bitmap
			if (image == "normal") {
				
				var asset_bd = Assets.getBitmapData("img/menu_button_normal.png");
				var asset_b = new Bitmap(asset_bd);
				asset_b.smoothing = true;
				asset_b.x = -asset_b.width / 2;
				asset_b.y = -asset_b.height / 2;
				
				this.addChild( asset_b );
				
			} else if (image == "pressed") {
				
				var asset_bd = Assets.getBitmapData("img/menu_button_pressed.png");
				var asset_b = new Bitmap(asset_bd);
				asset_b.smoothing = true;
				asset_b.x = -asset_b.width / 2;
				asset_b.y = -asset_b.height / 2;
				
				this.addChild( asset_b );		
			}
			
		} else if (type == "info") {
			
			// define if button state is normal or pressed to associate correct bitmap
			if (image == "normal") {
				
				var asset_bd = Assets.getBitmapData("img/info_button_normal.png");
				var asset_b = new Bitmap(asset_bd);
				asset_b.smoothing = true;
				asset_b.x = -asset_b.width / 2;
				asset_b.y = -asset_b.height / 2;
				
				this.addChild( asset_b );
				
			} else if (image == "pressed") {
				
				var asset_bd = Assets.getBitmapData("img/info_button_pressed.png");
				var asset_b = new Bitmap(asset_bd);
				asset_b.smoothing = true;
				asset_b.x = -asset_b.width / 2;
				asset_b.y = -asset_b.height / 2;
				
				this.addChild( asset_b );		
			}
			
		}
		
		
		//overlay text on the button
		var button_textfield:TextField = new TextField();
		
		// define width and height of textfield according to button dimensions
		if (type == "menu") {
			
			width = 500;
			height = 145;
			
		} else if (type == "info") {
			
			width = 300;
			height = 100;
			
		}
		
		button_textfield.background = false;
		button_textfield.width = width;
		button_textfield.height = height;
		button_textfield.x = -(width / 2) + width/12;
		
		if (type == "menu") {
			button_textfield.y = -(height / 2) + height / 3;
		} else if (type == "info") {
			button_textfield.y = -(height / 2) + height / 4;
		}
		
		var button_text:TextFormat = new TextFormat("Arial", 40, 0x000000, true);
		button_text.align = TextFormatAlign.CENTER;
		button_textfield.defaultTextFormat = button_text;
		button_textfield.text = s;
		button_textfield.embedFonts = true;
		button_textfield.antiAliasType = "ADVANCED";
		button_textfield.selectable = false;
		addChild(button_textfield);
		
    }
	
	// generic function to create a button, accessible from all other files
	public static function drawButton(text:String,pos1:Float,pos2:Float,type:String):SimpleButton{

		var b1 = new Button(text, type, "normal");
		var b2 = new Button(text, type, "normal");
		var b3 = new Button(text, type, "pressed");
		var b4 = new Button(text, type, "normal");
		var button:SimpleButton = new SimpleButton(b1,b2,b3,b4);
		
        button.x = pos1;
		button.y = pos2;
		
		button.useHandCursor = true;
		return(button);
		
	}
		
}
