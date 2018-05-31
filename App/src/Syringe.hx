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
			
			/*if (_run_ind >= 1 && _run_ind <= 6) {
			
				this.addChild( syringe_1_full_array[syringe_counter] );
				
			} else if (_run_ind >= 7 && _run_ind <= 12) {
				
				this.addChild( syringe_2_full_array[syringe_counter] );
				
			} else if (_run_ind >= 13 && _run_ind <= 18) {
				
				this.addChild( syringe_3_full_array[syringe_counter] );
				
			} else if (_run_ind >= 19 && _run_ind <= 24) {
				
				this.addChild( syringe_4_full_array[syringe_counter] );
				
			} else if (_run_ind >= 25 && _run_ind <= 30) {
				
				this.addChild( syringe_5_full_array[syringe_counter] );
				
			} else if (_run_ind == 31) {
				
				this.addChild( syringe_bonus_full_array[syringe_counter] );
				
			}*/
			
		}
			
		else if (syringe_type == "empty") {
			
			if (side == "A") {
			
				this.addChild( syringe_empty_A_array[_run_ind-1] );
				
			} else if (side == "B") {
				
				this.addChild( syringe_empty_B_array[_run_ind-1] );
				
			}
			
			/*if (_run_ind >= 1 && _run_ind <= 6) {
			
				this.addChild( syringe_1_empty_array[syringe_counter] );
				
			} else if (_run_ind >= 7 && _run_ind <= 12) {
				
				this.addChild( syringe_2_empty_array[syringe_counter] );
				
			} else if (_run_ind >= 13 && _run_ind <= 18) {
				
				this.addChild( syringe_3_empty_array[syringe_counter] );
				
			} else if (_run_ind >= 19 && _run_ind <= 24) {
				
				this.addChild( syringe_4_empty_array[syringe_counter] );
				
			} else if (_run_ind >= 25 && _run_ind <= 30) {
				
				this.addChild( syringe_5_empty_array[syringe_counter] );
				
			} else if (_run_ind == 31) {
				
				this.addChild( syringe_bonus_empty_array[syringe_counter] );
				
			}*/
									
		}
		
	}
	
}