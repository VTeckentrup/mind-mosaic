package;

import flash.display.Sprite;
import openfl.text.*;
import openfl.display.SimpleButton;
import openfl.events.MouseEvent;

class Instruction extends Sprite {
	
	public function new () {
		
		super ();
        
		var instructiontext:String = "Unsere Städte werden von Krankheitserregern angegriffen. Nur die Wissenschaft kann sie nun noch aufhalten. Sie führen ein Labor und müssen das beste Medikament finden, um die Pandemie zu bekämpfen. Doch seien Sie vorsichtig: Die Krankheitserreger passen sich an. Können Sie die Welt retten?Das gesamte Spiel besteht aus 30 aufeinander aufbauenden Level. In jedem Level bekämpfen Sie einen weiteren fiesen Krankheitserreger mit neu entwickelten Medikamenten. Das Ziel ist herauszufinden, welches Medikament aktuell besser wirkt, also mehr Menschen tatsächlich rettet bzw. weniger Menschen tatsächlich schadet.
        Jedes Level beginnt mit der Vorstellung des fiesen Krankheitserregers, gegen den Sie nun das Medikament finden sollen. Nach der Beantwortung einiger für unsere Forschung interessanter Fragen beginnt das eigentliche Spiel. Die erfolgreiche Beendigung jedes Levels dauert etwa 15 Minuten. Bitte versuchen Sie, sich in dieser Zeit nur auf das Spiel zu konzentrieren. Wenn Sie ein Level mittendrin unterbrechen, müssen Sie beim nächsten Start dieses Level wieder neu beginnen und auch die Fragen vom Anfang wieder neu beantworten.
        In jeden Durchgang werden ihnen zwei verschiedene Medikamente angeboten, deren jeweilige Wirksamkeit zur Bekämpfung eines speziellen Krankheitserregers unterschiedlich hoch eingeschätzt wird. Das heißt, mit einer bestimmten Wahrscheinlichkeit können Sie alle Menschen, die mit diesem Medikament behandelt werden, heilen (d.h. den Gewinn Ihrer Kompetenz zu steigern). 
        Es gibt auch Medikamente, die wegen ihrer starken Nebenwirkungen verheerenden Schaden anrichten können. In solchen Fällen ist das Ziel, möglichst wenigen Menschen mit diesem Medikament zu schaden (d.h. den Verlust ihrer Kompetenz gering zu halten). 
        Ob Sie im aktuellen Durchgang die Wahrscheinlichkeit für den Nutzen oder Schaden der Medikamente angezeigt bekommen, erkennen Sie an _____________________.
        In jedem Durchgang sollen Sie sich für eines der beiden Medikamente entscheiden, das dann im Kampf gegen die Krankheitserreger eingesetzt wird. Klicken Sie einfach auf das jeweilige Rezept und schon wird das Medikament an einer Gruppe Testpersonen eingesetzt. Ob Ihre Therapie erfolgreich war oder nicht - oder ob Sie sogar Schaden angerichtet haben, erfahren Sie sofort nach der Entscheidung: durch die Veränderung Ihres Gesamtscores.
        Nach jedem erfolgreich absolvierten Level gelangen Sie in die Galerie, in der Sie die bereits bekämpften Krankheitserreger aufgereiht sehen können und Ihren aktuellen Gesamtscore finden. Von dort haben Sie die Möglichkeit, zurück zum Hauptmenü zu wechseln, oder direkt das nächste Level zu starten.
        ";

		var instruction_textfield:TextField = new TextField();
		instruction_textfield.background = false;
		//info_textfield.backgroundColor = 0x0066cc;
		
		instruction_textfield.border = true;
		//instruction_textfield.borderColor = 0x000000;
		instruction_textfield.multiline = true;
		instruction_textfield.wordWrap=true;
	    instruction_textfield.scrollV = 1;

		var instruction_text:TextFormat = new TextFormat("Arial", 45, 0x000000, true);
		instruction_text.align = TextFormatAlign.CENTER;

		instruction_textfield.defaultTextFormat = instruction_text;
		instruction_textfield.text = "\n\n" + instructiontext;
        
		instruction_textfield.height = NOMINAL_WIDTH/3;
		instruction_textfield.width = NOMINAL_WIDTH/3;
		//info_textfield.textColor = 0xFFFFFF;
		instruction_textfield.textColor = 0x000000;
		instruction_textfield.embedFonts = true;
		instruction_textfield.antiAliasType = "ADVANCED";
		//info_textfield.wordWrap = true;
		instruction_textfield.multiline = true;
		//info_textfield.autoSize = TextFieldAutoSize.CENTER;
		instruction_textfield.x = (1920 - instruction_textfield.width) / 2;
        instruction_textfield.y = (1080 - instruction_textfield.height) / 2;
		//info_textfield.x = pos1;
		//info_textfield.y = pos2;
		this.addChild(instruction_textfield);
		
		
				
		
	}
	
}