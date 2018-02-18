package;
 
import openfl.display.Sprite;



class Button extends Sprite
	{
    public function new(color:Int)
    {
        super();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, 100, 50);
		this.graphics.endFill();
		
    }
}