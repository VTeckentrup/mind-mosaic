package ;
import flash.display.Sprite;
//import openfl.Lib;

class Machine_blue extends Sprite
{

	public function new() 
	{
		super();
		/*this.graphics.beginFill(0x0066cc);
		this.graphics.drawRect(0, 0, Lib.current.stage.stageWidth * 0.25, Lib.current.stage.stageHeight * 0.7);
		this.graphics.endFill();
		this.graphics.beginFill(0x000000);
		this.graphics.drawRect( (Lib.current.stage.stageWidth * 0.25) * 0.25, 75, Lib.current.stage.stageWidth * 0.08, Lib.current.stage.stageWidth * 0.08);
		this.graphics.endFill();*/

		this.graphics.beginFill(0x0066cc);
		this.graphics.drawRect(0, 0, 200, 300);
		this.graphics.endFill();
		this.graphics.beginFill(0x000000);
		this.graphics.drawRect(60,75,75,75);
		this.graphics.endFill();
	}
}