package;

import flash.display.Sprite;
import openfl.text.*;
import openfl.events.MouseEvent;
import openfl.Assets;

class Instruction extends Sprite {
	
	public var instruction_textfield:TextField; 
	
	public function new () {
		
		super ();
        
		var instructiontext:String = "Unsere Städte werden von Krankheitserregern angegriffen. Nur die Wissenschaft kann sie nun noch aufhalten. Sie führen ein Labor und müssen das beste Medikament finden, um die Pandemie zu bekämpfen. Doch seien Sie vorsichtig: Die Krankheitserreger passen sich an. Können Sie die Welt retten?\n
		Um die Anleitung bis zum Ende zu lesen, können Sie mit der Maus durch den Text scrollen.\n
		Das gesamte Spiel besteht aus 30 aufeinander aufbauenden Level. In jedem Level bekämpfen Sie einen weiteren fiesen Krankheitserreger mit neu entwickelten Medikamenten. Das Ziel ist herauszufinden, welches Medikament aktuell besser wirkt, also mehr Menschen tatsächlich rettet bzw. weniger Menschen tatsächlich schadet.\n
		Jedes Level beginnt mit der Beantwortung einiger für unsere Forschung interessanter Fragen. Danach beginnt das eigentliche Spiel. Die erfolgreiche Beendigung jedes Levels dauert etwa 3 Minuten. Bitte versuchen Sie, sich in dieser Zeit nur auf das Spiel zu konzentrieren. Wenn Sie ein Level nicht beenden und die App für zu lange Zeit verlassen, müssen Sie beim nächsten Start dieses Level wieder neu beginnen und auch die Fragen vom Anfang wieder neu beantworten. Dies ist notwendig, um sicherzustellen, dass Ihre Entscheidungen innerhalb eines Levels vergleichbar sind.\n
		Innerhalb eines Levels spielen Sie 150 Durchgänge. In jedem Durchgang werden ihnen zwei verschiedene Medikamente angeboten, deren jeweilige geschätzte Wirksamkeit zur Bekämpfung des Krankheitserregers unterschiedlich hoch eingeschätzt wird. Diese geschätzte Wirksamkeit wird Ihnen in Prozent auf einem Notizblock eingeblendet, der über dem jeweiligen Medikament angezeigt wird. Wichtig ist: In jedem Durchgang  wirkt tatsächlich nur eines der Medikamente gegen den Krankheitserreger, das andere Medikament hingegen wird Ihren Patienten schaden. Da die Krankheitserreger sich fortlaufend an Ihre Bemühungen zur Eindämmung anpassen, kann es sein, dass das bisher wirksame Medikament über den Verlauf eines Levels unwirksam wird und ein Wechsel notwendig ist. Ebenso ist es durch seltene Genvarianten bei den Krankheitserregern möglich, dass das eigentlich schädliche Medikament in diesem Fall heilend wirkt.\n
		Wenn Sie sich für ein Medikament entschieden haben, klicken Sie einfach auf die jeweilige Spritze unter dem Notizblock. Haben Sie das richtige Medikament ausgewählt, sehen Sie den Erfolg direkt an der Einblendung eines grünen Hakens sowie der Steigerung Ihres Kompetenzscores, der in der oberen linken Ecke angezeigt wird. Haben Sie hingegen das falsche Medikament gewählt, wird Ihnen ein rotes Kreuz angezeigt und Ihr Kompetenzscore sinkt.\n
		Nach jedem absolvierten Level gelangen Sie in die Galerie, in der Sie die bereits bekämpften Krankheitserreger aufgereiht sehen können und Ihren aktuellen Gesamtscore finden. Von dort haben Sie die Möglichkeit, zurück zum Hauptmenü zu wechseln, oder direkt das nächste Level zu starten. Mit der Zunahme Ihres Gesamtscore erhalten Sie über die Zeit fortschrittlicheres Equipment und ein besser ausgestattetes Labor. Das ist auch dringend notwendig, denn die Krankheitserreger entwickeln sich stetig weiter!";

		instruction_textfield = new TextField();
		instruction_textfield.background = false;
		//info_textfield.backgroundColor = 0x0066cc;
		
		instruction_textfield.border = false;
		//instruction_textfield.borderColor = 0x000000;
		instruction_textfield.multiline = true;
		instruction_textfield.wordWrap=true;
	    instruction_textfield.scrollV = 1;

		var instruction_text:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 45, 0x000000, true);
		instruction_text.align = TextFormatAlign.CENTER;

		instruction_textfield.defaultTextFormat = instruction_text;
		instruction_textfield.text = instructiontext;
        
		instruction_textfield.height = 700;
		instruction_textfield.width = 1800;
		//info_textfield.textColor = 0xFFFFFF;
		instruction_textfield.textColor = 0x000000;
		instruction_textfield.embedFonts = true;
		instruction_textfield.antiAliasType = "ADVANCED";
		//info_textfield.wordWrap = true;
		instruction_textfield.multiline = true;
		//info_textfield.autoSize = TextFieldAutoSize.CENTER;
		instruction_textfield.x = (1920 - instruction_textfield.width) / 2;
        instruction_textfield.y = 100;
		//info_textfield.x = pos1;
		//info_textfield.y = pos2;
		instruction_textfield.addEventListener(MouseEvent.MOUSE_WHEEL, onTextFieldScroll);
		
		this.addChild(instruction_textfield);		
		
	}
	
	private function onTextFieldScroll(e:MouseEvent) {
	if (e.delta < 0)
    instruction_textfield.scrollV++;
	else if (e.delta > 0)
    instruction_textfield.scrollV--;
	};	
	
}