package ;
import flash.display.Sprite;

class Choice_Frame extends Sprite
{

	public function new (color:Int)
	{
		super();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, 240, 20);
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, 20, 340);
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 320, 240, 20);
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(220, 0, 20, 340);
		this.graphics.endFill();
	}
}