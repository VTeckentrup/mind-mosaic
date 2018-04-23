package;
 
import openfl.display.Sprite;
import openfl.text.*;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.Lib;



class Button extends Sprite
	{

    private var bd:BitmapData;
    private var b:Bitmap;

    public function new(color:Int,s:String)
    {
        super();
		this.graphics.beginFill(color);
		this.graphics.drawRect(-300, -75, 600, 150);
		this.graphics.endFill();
		this.scaleX = stageScale;
		this.scaleY = stageScale;

		//bd = new BitmapData(250, 50, true,0xFFFFFFFF);
        //bd = Assets.getBitmapData("img/logo.png");
		//b = new Bitmap(bd);
        //addChild(b);
		
		var button_textfield:TextField = new TextField();
		//overlay text on the button
		button_textfield.background = false;
		button_textfield.width = 600;
		button_textfield.height = 150;
		button_textfield.x = -300;
		button_textfield.y = -75;
		var button_text:TextFormat = new TextFormat("Arial", 45, 0xFFFFFF, true);
		button_text.align = TextFormatAlign.CENTER;
		button_textfield.defaultTextFormat = button_text;
		button_textfield.text = s;
		button_textfield.embedFonts = true;
		button_textfield.antiAliasType = "ADVANCED";
		button_textfield.selectable = false;
		addChild(button_textfield);
		
    }
}
