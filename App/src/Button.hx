package;
 
import openfl.display.Sprite;
import openfl.text.*;



class Button extends Sprite
	{
    public function new(color:Int,s:String)
    {
        super();
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, 100, 50);
		this.graphics.endFill();
		
		var button_textfield:TextField = new TextField();
		//overlay text on the button
		button_textfield.background = false;
		button_textfield.width = 100;
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
