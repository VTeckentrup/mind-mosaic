package ;
import flash.display.Sprite;

class Selection_Circle extends Sprite
{

	public function new (color:Int)
	{
		super();
		
		this.graphics.beginFill(color);
		this.graphics.drawCircle(0, 0, 75);
		this.graphics.endFill();
		
	}
}