package ;
import flash.display.Sprite;

class NotepadLeft extends Sprite
{	
	public function new () {
		
		super();
		
		if (_run_ind >= 1 && _run_ind <= 6) {
		
			this.addChild( notepad_array_A[0] );
			
		} else if (_run_ind >= 7 && _run_ind <= 12) {
			
			this.addChild( notepad_array_A[1] );
			
		} else if (_run_ind >= 13 && _run_ind <= 18) {
			
			this.addChild( notepad_array_A[2] );
			
		} else if (_run_ind >= 19 && _run_ind <= 24) {
			
			this.addChild( notepad_array_A[3] );
			
		} else if (_run_ind >= 25 && _run_ind <= 30) {
			
			this.addChild( notepad_array_A[4] );
			
		} else if (_run_ind == 31) {
			
			this.addChild( notepad_array_A[5] );
			
		}
		
	}
	
}