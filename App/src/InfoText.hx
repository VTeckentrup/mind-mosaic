package;

import flash.display.Sprite;
import openfl.text.*;
import openfl.display.SimpleButton;

class InfoText extends Sprite {
	
	public function new (infotext:String) {
		
		super ();
		
		var info_textfield:TextField = new TextField();
		info_textfield.background = true;
		//info_textfield.backgroundColor = 0x0066cc;
		info_textfield.backgroundColor = 0xFFFFFF;
		info_textfield.border = true;
		info_textfield.borderColor = 0x000000;
		

		var info_text:TextFormat = new TextFormat("Arial", 45, 0x000000, true);
		info_text.align = TextFormatAlign.CENTER;

		info_textfield.defaultTextFormat = info_text;
		info_textfield.text = "\n\n" + infotext;
		info_textfield.height = info_textfield.textHeight + 200;
		info_textfield.width = info_textfield.textWidth + 100;
		//info_textfield.textColor = 0xFFFFFF;
		info_textfield.textColor = 0x000000;
		info_textfield.embedFonts = true;
		info_textfield.antiAliasType = "ADVANCED";
		//info_textfield.wordWrap = true;
		info_textfield.multiline = true;
		//info_textfield.autoSize = TextFieldAutoSize.CENTER;
		info_textfield.x = (1920 - info_textfield.width) / 2;
        info_textfield.y = (1080 - info_textfield.height) / 2;
		//info_textfield.x = pos1;
		//info_textfield.y = pos2;
		this.addChild(info_textfield);
		
		// add button to info textfield
		var textfield_button:SimpleButton = Button.drawButton("OK", NOMINAL_WIDTH / 2, ((1080 - info_textfield.height) / 2) + info_textfield.height - 75, "info");
		
        addChild(textfield_button);
				
		
	}
	
}