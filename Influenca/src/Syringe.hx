package ;
import flash.display.Sprite;

class Syringe extends Sprite
{	
	public function new (syringe_type:String, side:String) {
		
		super();
		
		if (syringe_type == "full") {
			
			if (side == "A") {
			
				this.addChild( syringe_full_A_array[_run_ind-1] );
				
			} else if (side == "B") {
				
				this.addChild( syringe_full_B_array[_run_ind-1] );
				
			}
			
		}
			
		else if (syringe_type == "empty") {
			
			if (side == "A") {
			
				this.addChild( syringe_empty_A_array[_run_ind-1] );
				
			} else if (side == "B") {
				
				this.addChild( syringe_empty_B_array[_run_ind-1] );
				
			}
									
		}
		
	}
	
}