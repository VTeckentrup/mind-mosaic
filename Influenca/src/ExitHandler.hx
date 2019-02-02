package;

class ExitHandler {
	
	public static function setExitHandler(func:Void->Void):Void {
		
		openfl.Lib.current.stage.application.onExit.add(function(code) {
        
		func();
		
		});
		
	}
	
}