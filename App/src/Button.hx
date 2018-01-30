package;
 
import openfl.display.Sprite;
import openfl.events.MouseEvent;



class Button extends Sprite
	{
    public function new()
    {
        super();
 
        drawBasicRect();
    }
 
    function drawBasicRect()
    {
        this.graphics.beginFill( 0xFF0000 );
        this.graphics.drawRoundRect( 0, 0, 80, 20, 10, 10 );
        this.graphics.endFill();
    }
	}