package;
 
import openfl.display.Sprite;
import openfl.text.*;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.Assets;



class Button extends Sprite
	{

    //private var bd:BitmapData;
    //private var b:Bitmap;

    public function new(color:Int,s:String)
    {
        super();
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, 250, 50);
		this.graphics.endFill();

     //bd = new BitmapData(250, 50, true,0xFFFFFFFF);
        /*bd = Assets.getBitmapData("img/logo.png");
		b = new Bitmap(bd);
        addChild(b);*/
		
		var button_textfield:TextField = new TextField();
		//overlay text on the button
		button_textfield.background = false;
		button_textfield.width = 250;
		button_textfield.height = 50;
		button_textfield.x = 0;
		button_textfield.y = 0;
		var button_text:TextFormat = new TextFormat("Verdana", 20, 0xbbbbbb, true);
		button_text.align = TextFormatAlign.CENTER;
		button_textfield.defaultTextFormat = button_text;
		button_textfield.text = s;
		button_textfield.selectable = false;
		addChild(button_textfield);
		
    }
}
