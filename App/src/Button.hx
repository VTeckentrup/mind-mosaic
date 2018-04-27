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

	//flexible Buttonsize with width & height
    public function new(color:Int,s:String,width:Int,height:Int)
    {
        super();
		//width = Std.int(width);
		//height = Std.int(height);
		this.graphics.beginFill(color);
		//this.graphics.drawRect(-300, -75, 600, 150);
		this.graphics.drawRect(- (width / 2), - (height / 2), width, height);
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
		button_textfield.width = width;
		button_textfield.height = height;
		button_textfield.x = - (width / 2);
		button_textfield.y = - (height / 2);
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
