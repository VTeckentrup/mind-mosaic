package ;
import flash.display.Sprite;

class Selection_Circle extends Sprite
{

	public function new (color:Int)
	{
		super();
		
		this.graphics.beginFill(0x000000);
		this.graphics.drawCircle(0, 0, stageScale*Std.int(NOMINAL_WIDTH / 16));
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawCircle(0, 0, stageScale*Std.int(NOMINAL_WIDTH / 18));
		this.graphics.endFill();
		
	}
}