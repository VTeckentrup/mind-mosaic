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
		this.graphics.drawRect((NOMINAL_WIDTH / 8) * -0.5, (NOMINAL_HEIGHT / 3) * -0.5, NOMINAL_WIDTH / 9, NOMINAL_HEIGHT / 3);
		//this.graphics.drawRect(Std.int((NOMINAL_WIDTH / 8) * -0.5), Std.int((NOMINAL_HEIGHT / 3) * -0.5), Std.int(NOMINAL_WIDTH / 9), Std.int(NOMINAL_HEIGHT / 3);
		this.graphics.endFill();
		this.graphics.beginFill(0x000000);
		//this.graphics.drawRect(60,75,75,75);
		this.graphics.drawRect(- Std.int(NOMINAL_WIDTH / 36),- Std.int(NOMINAL_HEIGHT / 18),Std.int(NOMINAL_WIDTH / 18),Std.int(NOMINAL_HEIGHT / 9));
		this.graphics.endFill();
	}
}