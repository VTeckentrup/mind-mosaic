package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.text.TextField;
import openfl.text.TextFieldType;
import flash.text.TextFormat;
import flash.text.Font;
import flash.text.FontStyle;
import flash.text.TextFormatAlign;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.display.SimpleButton;
import openfl.events.MouseEvent;
import Math.random;

enum GameState {
	
	Playing;
	Evaluate;
}

class Main extends Sprite 
{

	
	var inited:Bool;
	
	//set up Log in 
	private var username:TextField;
	private var passw:TextField;
	private var logIn_selection:TextField;

	// Set up game state variable
	private var currentGameState:GameState;
	
	// Set up number of rounds
	private var rounds:Int = 200;
	
	// Set up array for keys
	private var keys:Array<Bool>;

	// Definition of slot machine graphic elements
	private var slot_machine_blue:Machine_blue;
	private var slot_machine_green:Machine_green;
	
	// Definition of selection circle graphic element
	private var circle_selection:Selection_Circle;
	
	// Definition of choice frame graphic element
	private var frame_choice:Choice_Frame;
	private var frame_choice_side:Int;

	// Define vars for slot machine values and associated text fields
	private var blue_reward:Int;
	private var green_reward:Int;
	private var scoreField_blue:TextField;
	private var scoreField_green:TextField;

	var stageWidth:Int = Lib.current.stage.stageWidth;
    var stageHeight:Int = Lib.current.stage.stageHeight;
	
	// Define score text field
	private var scoreField:TextField;
	private var scorePlayer:Int;
	
	// Define array for reward probabilities
	var probArray:Array<Float> = [0.5];
	
	// Define vars for reward probabilities
	private var reward_prob_blue:Float;
	private var reward_prob_green:Float;
	
	private var reward_prob_round:Float;
	private var correct_choice:String;

    //Insert base stage size values
	private static inline var NOMINAL_WIDTH:Int = 800;
	private static inline var NOMINAL_HEIGHT:Int = 600;
	
	//Define buttons
	private var button:SimpleButton;
    

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	//first SetUp Image with the Log-in data & PW
	function getSetupImage(){
		//22.01.: displays 2 textfield where you can enter the username & pw
		//new Textfield for username insertion
		
		var username:TextField = new TextField();
		username.background = true;
		username.width = 200;
		username.height = 50;
		username.x = 300;
		username.y = 210;
		var name:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name.align = TextFormatAlign.CENTER;
		username.text = "Benutzername";
		username.defaultTextFormat = name;
		username.restrict = null;
		//user can edit the textfield
		username.type = TextFieldType.INPUT;
		//username.replaceSelectedText("Benutzername"); //LEADS TO CRASH OF NEKO
		this.addChild(username);


		//new Textfield for password insertion
		var passw:TextField = new TextField();
		//edited text is displayed as a password
		passw.displayAsPassword = true;
		passw.background = true;
		passw.width = 200;
		passw.height = 50;
		passw.x = 300;
		passw.y = 300;
		passw.restrict = null;
		//user can edit the textfield
		passw.type = TextFieldType.INPUT;
		var passw_format:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		passw_format.align = TextFormatAlign.CENTER;
		passw.defaultTextFormat = passw_format;
		this.addChild(passw);


		//draw Log-In button
		logIn_selection = new TextField();
		logIn_selection.width = 100;
		logIn_selection.height = 30;
		logIn_selection.x = 350;
		logIn_selection.y = 400;
		logIn_selection.text = "Login";
		var logIn_format:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		logIn_format.align = TextFormatAlign.CENTER;
		logIn_selection.defaultTextFormat = logIn_format;
		logIn_selection.selectable = true;
		logIn_selection.type = TextFieldType.DYNAMIC;
		this.addChild(logIn_selection);



	}

	//29.01.
	//creates the LogIn with login details
	function createLogInPage(){
		//Insertion of the full name
		var fullname:TextField = new TextField();
		fullname.background = true;
		fullname.width = 200;
		fullname.height = 50;
		fullname.x = 300;
		fullname.y = 50;

		var name1:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name1.align = TextFormatAlign.CENTER;
		fullname.text = "Name";
		fullname.defaultTextFormat = name1;
		fullname.restrict = null;
		//user can edit the textfield
		fullname.type = TextFieldType.INPUT;
		this.addChild(fullname);

		//birthdate
		var birthdate:TextField = new TextField();
		birthdate.background = true;
		birthdate.width = 200;
		birthdate.height = 50;
		birthdate.x = 300;
		birthdate.y = 100;

		var name2:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name2.align = TextFormatAlign.CENTER;
		//text is restricted to only enter the birthdate
		birthdate.text = "TT.MM.JJJJ";
		birthdate.defaultTextFormat = name2;
		birthdate.restrict = "0-9.TJM";
		//user can edit the textfield
		birthdate.type = TextFieldType.INPUT;
		this.addChild(birthdate);

		//Select your username
		var selecteduser:TextField = new TextField();
		selecteduser.background = true;
		selecteduser.width = 200;
		selecteduser.height = 50;
		selecteduser.x = 300;
		selecteduser.y = 150;

		var name2:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name2.align = TextFormatAlign.CENTER;
		selecteduser.text = "Benutzername";
		selecteduser.defaultTextFormat = name2;
		selecteduser.restrict = "0-9 a-z";
		selecteduser.type = TextFieldType.INPUT;
		this.addChild(selecteduser);


		//selection of password
		var selectedpw:TextField = new TextField();
		selectedpw.background = true;
		selectedpw.width = 200;
		selectedpw.height = 50;
		selectedpw.x = 300;
		selectedpw.y = 200;

		var name2:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name2.align = TextFormatAlign.CENTER;
		//text is restricted to only enter the birthdate
		selectedpw.text = "Passwort";
		selectedpw.defaultTextFormat = name2;
		selectedpw.restrict = null;
		selectedpw.type = TextFieldType.INPUT;
		this.addChild(selectedpw);

		//NEEEEEWWWWWW
		


	}
//--------------NEW
	//function to only draw the button - can be called for every button 
	//- you can pass text that the button has to display
	//pass  on function to start the new page --> passed onto onClick
	public function drawButton(s:String){

		var b1 = new Button(0x215ab7,s);
		var b2 = new Button(0xb72025,s);
		var b3 = new Button(0xfffb21,s);
		var b4 = new Button(0x36b71f,s);
		button = new SimpleButton(b1,b2,b3,b4);
	
		
        button.x = button.y = 20;
        button.addEventListener( MouseEvent.CLICK, onClick) );
 
        this.addChild(button);
	}
	//draws the Info page where you can choose from new game, About, Instructions, Score and Log-off
	// needs text
	
	//depending on the Buttontext you call a different function
	public function onClick (event: MouseEvent):Void {
		
		this.removeChild(button);
		//getSetupImage();
		if(passedText == "registration" ){

		}
		
	}


	public function drawInfopage(){
 
        
	
	}
	//---------------------------------NEWWWWWW





	//function that draws the Slotmachine
	function drawSlotmachine(){

		// Draw slot machines on screen
		slot_machine_blue = new Machine_blue();
		slot_machine_blue.x = 50;
		slot_machine_blue.y = 150;
		this.addChild(slot_machine_blue);

		slot_machine_green = new Machine_green();
		slot_machine_green.x = 550;
		slot_machine_green.y = 150;
		this.addChild(slot_machine_green);
		
		
		// Draw selection circle
		circle_selection = new Selection_Circle(0xc7ccd6);
		circle_selection.x = 400;
		circle_selection.y = 300;
		this.addChild(circle_selection);
		
		// Draw score text field and set starting score points to zero
		var scoreFormat:TextFormat = new TextFormat("Verdana", 24, 0xbbbbbb, true);
		scoreFormat.align = TextFormatAlign.CENTER;
		
		scoreField = new TextField();
		addChild(scoreField);
		scoreField.width = 800;
		scoreField.y = 30;
		scoreField.defaultTextFormat = scoreFormat;
		scoreField.selectable = false;
		
		scorePlayer = 0;
		scoreField.text = 'Score: $scorePlayer';


		// Define and format text fields displaying slot machine outcome
		// blue
		var scoreFormat_blue:TextFormat = new TextFormat("Verdana", 28, 0xfff61f, true);
		scoreFormat_blue.align = TextFormatAlign.CENTER;

		scoreField_blue = new TextField();
		addChild(scoreField_blue);
		scoreField_blue.width = 50;
		scoreField_blue.x = 125;
		scoreField_blue.y = 245;
		scoreField_blue.defaultTextFormat = scoreFormat_blue;
		scoreField_blue.selectable = false;

		// green
		var scoreFormat_green:TextFormat = new TextFormat("Verdana", 28, 0xfff61f, true);
		scoreFormat_green.align = TextFormatAlign.CENTER;

		scoreField_green = new TextField();
		addChild(scoreField_green);
		scoreField_green.width = 50;
		scoreField_green.x = 625;
		scoreField_green.y = 245;
		scoreField_green.defaultTextFormat = scoreFormat_green;
		scoreField_green.selectable = false;
		
		// Generate starting rewards
		//Gaussian random walk - normal distribution
		//blue_reward = 0 + Math.floor(((100 - 0 + 1) * Math.random()));
		//green_reward = 100 - blue_reward;
		blue_reward = Math.round(NormRandom.floatNormal(50,12));
		green_reward = 100 - blue_reward;
		scoreField_blue.text = Std.string(blue_reward);
		scoreField_green.text = Std.string(green_reward);
		
		//Initialise probabilities
		var step:Float;
		var probvalueadd:Float;
		
		// Generate values for a gaussian random walk and append them to the probability values array
		for (i in 0...rounds-1) {
			
			step = NormRandom.floatNormal(0,0.075);
			
			while (probArray[i] + step - 0.05 * (probArray[i] - 0.5) < 0 || probArray[i] + step - 0.05 * (probArray[i] - 0.5) > 1) {
				
				step = NormRandom.floatNormal(0,0.075);
				
			}
			
			probvalueadd = probArray[i] + step - 0.05 * (probArray[i] - 0.5);
			probArray.push(probvalueadd);
		}
		
		reward_prob_blue = probArray[0];
		reward_prob_green = 1 - reward_prob_blue;
		
		// Set game state
		currentGameState = Playing;		
		

	}

	function init() 
	{



		if (inited) return;
		inited = true;
		
		// Set up keys to select option: usually in init function 
		keys = [];
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		
		// Listen for input
		this.addEventListener(Event.ENTER_FRAME, everyFrame);

		//getSetupImage();
		//createLogInPage();
		drawInfopage();
		//drawSlotmachine();


		
	}

	
	/* SETUP */
	//Entry point of main function: treats it as an object
	public function new() 
	{
		super();	
		//addEventListener(Event.ADDED_TO_STAGE, added);

		stage.scaleMode = openfl.display.StageScaleMode.SHOW_ALL;
		#if flash
        stage.align = untyped "";
    	#else
        stage.addEventListener(Event.RESIZE, onResize);
        onResize(null);
		#end

		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}

	private function onResize(e:Event):Void {
    var stageScaleX:Float = stage.stageWidth / NOMINAL_WIDTH;
    var stageScaleY:Float = stage.stageHeight / NOMINAL_HEIGHT;
    
    var stageScale:Float = Math.min(stageScaleX, stageScaleY);
    
    Lib.current.x = 0;
    Lib.current.y = 0;
    Lib.current.scaleX = stageScale;
    Lib.current.scaleY = stageScale;
    
    if(stageScaleX > stageScaleY) {
        Lib.current.x = (stage.stageWidth - NOMINAL_WIDTH * stageScale) / 2;
    } else {
        Lib.current.y = (stage.stageHeight - NOMINAL_HEIGHT * stageScale) / 2;
    }
	}

	// Set keyboard keys actived/deactivated on key press/release
	private function onKeyDown(evt:KeyboardEvent):Void {
	keys[evt.keyCode] = true;
	}

	private function onKeyUp(evt:KeyboardEvent):Void {
	keys[evt.keyCode] = false;
	}


	private function everyFrame(event:Event):Void {
		
		// Only execute if the game is currently active to prevent excessive summation of rewards
		if (currentGameState == Playing) {
		
			if (keys[Keyboard.LEFT]) {
				// Draw frame indicating choice
				this.removeChild(frame_choice);
				frame_choice = new Choice_Frame(0xc7ccd6);
				frame_choice.x = 30;
				frame_choice.y = 130;
				frame_choice_side = 1;
				this.addChild(frame_choice);
			}
			
			if (keys[Keyboard.RIGHT]) {
				// Draw frame indicating choice
				this.removeChild(frame_choice);
				frame_choice = new Choice_Frame(0xc7ccd6);
				frame_choice.x = 530;
				frame_choice.y = 130;
				frame_choice_side = 2;
				this.addChild(frame_choice);
			}
			
			if (this.contains(frame_choice) && frame_choice_side == 1 && keys[Keyboard.ENTER]) {
				
				// Halt game for evaluation
				currentGameState = Evaluate;
				
				// Change color of choice frame and call function for evaluation
				this.removeChild(frame_choice);
				frame_choice = new Choice_Frame(0x8e8e8e);
				frame_choice.x = 30;
				frame_choice.y = 130;
				this.addChild(frame_choice);
				endRound('blue');
				
			}
			
			if (this.contains(frame_choice) && frame_choice_side == 2 && keys[Keyboard.ENTER]) {
				
				// Halt game for evaluation
				currentGameState = Evaluate;
				
				// Change color of choice frame and call function for evaluation
				this.removeChild(frame_choice);
				frame_choice = new Choice_Frame(0x8e8e8e);
				frame_choice.x = 530;
				frame_choice.y = 130;
				this.addChild(frame_choice);
				endRound('green');
				
			}
		
		}
		
	}
	
	
	private function endRound(machine_color:String):Void {
		
		// Get winning machine
		reward_prob_round = random();
		
		// Evaluate winning machine and set output accordingly
		if (reward_prob_round <= reward_prob_blue) {
			correct_choice = 'blue';
			this.removeChild(circle_selection);
			circle_selection = new Selection_Circle(0x0066cc);
			circle_selection.x = 400;
			circle_selection.y = 300;
			this.addChild(circle_selection);
			trace('$scorePlayer');
			
			// If the winning blue machine was selected add reward to score and update score field
			if (machine_color == 'blue') {
				
				scorePlayer = Std.int(scorePlayer + blue_reward);
				scoreField.text = 'Score: $scorePlayer';
				
			}
		
		} else {
			correct_choice = 'green';
			this.removeChild(circle_selection);
			circle_selection = new Selection_Circle(0x1f7c0a);
			circle_selection.x = 400;
			circle_selection.y = 300;
			this.addChild(circle_selection);
			trace('$scorePlayer');
						
			// If the winning green machine was selected add reward to score and update score field
			if (machine_color == 'green') {
				
				scorePlayer = Std.int(scorePlayer + green_reward);
				scoreField.text = 'Score: $scorePlayer';
				
			}
		}
		
		
		// Set timer to give player time to evaluate the outcome
		haxe.Timer.delay(newRound,1000);
		
	}
	
	
	private function newRound():Void {
		
		for (round_counter in 1...rounds) {
		
		// Set up new rewards
		//blue_reward = 0 + Math.floor(((100 - 0 + 1) * Math.random()));
		//green_reward = 100 - blue_reward;
		blue_reward = Math.round(NormRandom.floatNormal(50,12));
		green_reward = 100 - blue_reward;
		scoreField_blue.text = Std.string(blue_reward);
		scoreField_green.text = Std.string(green_reward);
		
		// Grab new reward probabilities
		trace(probArray[round_counter]);
		reward_prob_blue = probArray[round_counter];
		reward_prob_green = 1 - reward_prob_blue;
		
		// Reset selection circle
		this.removeChild(circle_selection);
		circle_selection = new Selection_Circle(0xc7ccd6);
		circle_selection.x = 400;
		circle_selection.y = 300;
		this.addChild(circle_selection);
		
		// Remove any selection frames
		this.removeChild(frame_choice);
		
		// Resume game
		currentGameState = Playing;
		
		}
		
	}
	
	
}
