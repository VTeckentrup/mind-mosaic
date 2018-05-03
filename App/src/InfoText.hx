package;

import flash.display.Sprite;
import openfl.text.*;
import openfl.display.SimpleButton;
import openfl.events.MouseEvent;

class InfoText extends Sprite {
	
	public function new (infotext:String, pos1:Int, pos2:Int) {
		
		super ();
		
		var info_textfield:TextField = new TextField();
		info_textfield.background = false;
		//info_textfield.backgroundColor = 0x0066cc;
		//info_textfield.backgroundColor = 0xFFFFFF;
		info_textfield.border = true;
		info_textfield.borderColor = 0x000000;
		info_textfield.height = 100;
		info_textfield.width = 100;

		var info_text:TextFormat = new TextFormat("Arial", 45, 0x000000, true);
		info_text.align = TextFormatAlign.CENTER;

		info_textfield.defaultTextFormat = info_text;
		info_textfield.text = infotext;
		info_textfield.textColor = 0xFFFFFF;
		//info_textfield.textColor = 0x000000;
		info_textfield.embedFonts = true;
		info_textfield.antiAliasType = "ADVANCED";
		info_textfield.wordWrap = true;
		info_textfield.multiline = true;
		info_textfield.autoSize = TextFieldAutoSize.CENTER;
		info_textfield.x = pos1;
		info_textfield.y = pos2;
		addChild(info_textfield);
		
		/*var OK_pseudobutton:TextField = new TextField();
		OK_pseudobutton.background = true;
		OK_pseudobutton.backgroundColor = 0xFFFFFF;
		OK_pseudobutton.border = true;
		OK_pseudobutton.borderColor = 0x000000;
		OK_pseudobutton.defaultTextFormat = info_text;
		OK_pseudobutton.text = "OK";
		OK_pseudobutton.textColor = 0x000000;
		OK_pseudobutton.embedFonts = true;
		OK_pseudobutton.antiAliasType = "ADVANCED";
		OK_pseudobutton.addEventListener(MouseEvent.CLICK, toggleMessage)
		addchild(OK_pseudobutton);*/
		
		/*var b1 = new Button(0x215ab7, "OK");
		var b2 = new Button(0xb72025, "OK");
		var b3 = new Button(0xfffb21, "OK");
		var b4 = new Button(0x36b71f, "OK");
		var textfield_button = new SimpleButton(b1,b2,b3,b4);
		
        textfield_button.x = 0;
		textfield_button.y = 0;

        this.addChild(textfield_button);
		
		textfield_button.addEventListener(MouseEvent.CLICK, InfoText.toggleMessage)*/
		
		
		/*this.scaleX = stageScale;
		this.scaleY = stageScale;*/
		
		
	}
	
}