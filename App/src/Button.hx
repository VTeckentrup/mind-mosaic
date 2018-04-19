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
		this.graphics.drawRect((Lib.application.window.width * 0.3) * 0.175, 0, Lib.application.window.width * 0.3, Lib.application.window.height * 0.1);
		this.graphics.endFill();

		//bd = new BitmapData(250, 50, true,0xFFFFFFFF);
        //bd = Assets.getBitmapData("img/logo.png");
		//b = new Bitmap(bd);
        //addChild(b);
		
		var button_textfield:TextField = new TextField();
		//overlay text on the button
		button_textfield.background = false;
		button_textfield.width = Lib.application.window.width * 0.3;
		button_textfield.height = Lib.application.window.height * 0.1;
		button_textfield.x = (Lib.application.window.width * 0.3) * 0.175;
		button_textfield.y = (Lib.application.window.height * 0.1) * 0.3;
		var button_text:TextFormat = new TextFormat("Arial", 30, 0xFFFFFF, true);
		button_text.align = TextFormatAlign.CENTER;
		button_textfield.defaultTextFormat = button_text;
		button_textfield.text = s;
		button_textfield.embedFonts = true;
		button_textfield.antiAliasType = "ADVANCED";
		button_textfield.selectable = false;
		addChild(button_textfield);
		
    }
}
