package ;
import flash.display.Sprite;

class Choice_Frame extends Sprite
{

	public function new (color:Int)
	{
		super();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, Std.int(NOMINAL_WIDTH/8), Std.int(NOMINAL_WIDTH/96));
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, Std.int(NOMINAL_WIDTH/96), Std.int(NOMINAL_HEIGHT/3.2));
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, Std.int(NOMINAL_HEIGHT/3.4), Std.int(NOMINAL_WIDTH/8), Std.int(NOMINAL_HEIGHT/54));
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(Std.int(NOMINAL_WIDTH/8.7), 0, Std.int(NOMINAL_WIDTH/96), Std.int(NOMINAL_HEIGHT/3.2));
		this.graphics.endFill();

		/*
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, Std.int(NOMINAL_WIDTH/8), Std.int(NOMINAL_WIDTH/96));
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, Std.int(NOMINAL_WIDTH/96), Std.int(NOMINAL_HEIGHT/3.2));
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, Std.int(NOMINAL_HEIGHT/3.4), Std.int(NOMINAL_WIDTH/8), Std.int(NOMINAL_HEIGHT/54));
		this.graphics.endFill();
		
		this.graphics.beginFill(color);
		this.graphics.drawRect(Std.int(NOMINAL_WIDTH/8.7), 0, Std.int(NOMINAL_WIDTH/96), Std.int(NOMINAL_HEIGHT/3.2));
		this.graphics.endFill();




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
		*/
	}
}