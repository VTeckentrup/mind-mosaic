package ;
import flash.display.Sprite;
//import openfl.Lib;

class Machine_green extends Sprite
{

	public function new() 
	{
		super();
		this.graphics.beginFill(0x1f7c0a);
		this.graphics.drawRect(0, 0, 200, 300);
		this.graphics.endFill();
		this.graphics.beginFill(0x000000);
		this.graphics.drawRect(60,75,75,75);
		this.graphics.endFill();
	}
}