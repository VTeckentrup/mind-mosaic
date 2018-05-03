package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.text.TextField;
import openfl.text.TextFieldType;
import openfl.system.Capabilities;
import flash.text.TextFormat;
import flash.text.Font;
import flash.text.FontStyle;
import flash.text.TextFormatAlign;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.display.SimpleButton;
import openfl.events.MouseEvent;
import Math.random;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import sys.FileSystem;
import haxe.io.Path;
//using layout.LayoutCreator;
//using layout.LayoutPreserver;

enum GameState {
	
	Playing;
	Evaluate;
	Paused;
}

class Main extends Sprite 
{
//%%%%%%%%%%%%% VARIABLEN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	var inited:Bool;
	
	//set up Log in 
	private var username:TextField;
	private var passw:TextField;
	private var logIn_selection:TextField;
	private var levelField:TextField;
	private var levelFormat:TextFormat;

	// Set up game state variable
	private var currentGameState:GameState;
		
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
	private var A_reward:Int;
	private var B_reward:Int;
	private var scoreField_blue:TextField;
	private var scoreField_green:TextField;

	var stageWidth:Int = Lib.current.stage.stageWidth;
    var stageHeight:Int = Lib.current.stage.stageHeight;
	
	// Define score text field
	public var scoreField:TextField;
	public var scorePlayer:Int;
	
	//Define city text field
	public var cityField:TextField;
	public var cityName:String;
	
	// Define array for reward probabilities
	var probArray:Array<Float> = [0.5];
	
	// Define vars for reward probabilities
	private var reward_prob_A:Float;
	private var reward_prob_B:Float;
	
	private var prob_draw:Float;
	private var correct_choice:String;
	
	//Define buttons
	private var button:SimpleButton;
	
	// Define info textfields
	public var reg_mail_info:InfoText;
	public var reg_inet_info:InfoText;

	//Button variables for multiple buttons
	public var button1:SimpleButton;
	public var button2:SimpleButton;
	public var button3:SimpleButton;
	public var button4:SimpleButton;
	public var button5:SimpleButton;
	public var button6:SimpleButton;
	public var button_reg:SimpleButton;
	public var button_reg_back:SimpleButton;
	public var button_end:SimpleButton;
	public var button_login:SimpleButton;
	public var button_log:SimpleButton;
	public var button_reg1:SimpleButton;
	private var button_back:SimpleButton;


	private var change:Bool = false;
	private var clicked_button:SimpleButton;
    private var click_button:Bool = false;

	private var fullname:TextField;
	private var birthdate:TextField;
	private var mailaddress:TextField;
	private var selectedpw:TextField;

	//represents the level you are in- just for presentation
	//purpose - needs to be drawn from sheet
	//private var level:Int=1;
	//represents an array (length 30) with all pathogens
	private var pathogenArrayBM:Array<BitmapData> = [];
	private var pathogenArray:Array<Bitmap> = [];
	private var add:Int;
	
	// Setup background graphic
	private var background_bd:BitmapData;
	private var background_b:Bitmap;
	
	private var inftext:InfoText;

	
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}


//%%%%%%%%%%BUTTONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	/*function to only draw the button - can be called for every button 
    you need to pass on a text that the button has to display*/
	public function drawButton(text:String,pos1:Int,pos2:Int,width:Int, height:Int):SimpleButton{

		var b1 = new Button(0x215ab7, text, width, height);
		var b2 = new Button(0xb72025, text, width, height);
		var b3 = new Button(0xfffb21, text, width, height);
		var b4 = new Button(0x36b71f, text, width, height);
		button = new SimpleButton(b1,b2,b3,b4);
		
        button.x = pos1;
		button.y = pos2;
		
		button.useHandCursor = true;

        this.addChild(button);
		return(button);
	}
	
	/*onClick functions for the multiple buttons
	
	DATENBANK ABSPEICHERN
	Button: New Game - Button1*/
	public function onClick1 (event: MouseEvent):Void {
		this.removeChildren();
		drawSlotmachine();	
	}
	//Instruction - Button2
	public function onClick2 (event: MouseEvent):Void {
		this.removeChildren();
		button_back = drawButton("Zurück",300,300,Std.int(NOMINAL_WIDTH / 5),Std.int(NOMINAL_HEIGHT / 9));
		button_back.addEventListener(MouseEvent.CLICK, onClick_back);	
	}
	//DATENBANKABRUF
	//Button Game Status - Button3
	public function onClick3 (event: MouseEvent):Void {
		this.removeChildren();
		seeGamestatus(_run_ind);
		button_back = drawButton("Zurück",300,300,Std.int(NOMINAL_WIDTH / 5),Std.int(NOMINAL_HEIGHT / 9));
		button_back.addEventListener(MouseEvent.CLICK, onClick_back);	
	}
	
	//Button Über das Spiel - Button4
	public function onClick4 (event: MouseEvent):Void {
		this.removeChildren();	
	}
	
	//Button Logout - button5
	public function onClick5 (event: MouseEvent):Void {
		// Delete logged in cookie
		AppdataJSON.removeLogin();
		// clear screen
		this.removeChildren();
		// Send to login & registration page
		log_and_reg();
	}
	
	//Button Beenden - button6
	public function onClick6 (event: MouseEvent):Void {
		// Close window (invoking exit handler)
		Lib.application.window.close();
	}
	
	//DATENBANK - ABSPEICHERN
	//End Game slotmachine - Button_end
	public function onClick_end (event: MouseEvent):Void {
		this.removeChildren();
		drawInfopage();
	}
	
	//Registration Button event - button_reg
	// Query database for registration process
	public function onClick_Reg (event: MouseEvent):Void {
		// Check internet connection
		var database_availability = InternetConnection.isAvailable();
			// If internet is connected, check if input fields are filled 
		if (database_availability == true) {
				if (fullname.length > 0 && birthdate.length > 0 && mailaddress.length > 0 && selectedpw.length > 0) {
					// Check if mailaddress is already registered, if not register and log-in
					_mail_address = mailaddress.text;
					var mail_availability = DatabaseSync.CheckRegistration(_mail_address);
					if (mail_availability == false){ // mail address is not registered yet
						// Register user in database
						DatabaseSync.UserRegistration();
						// Get new user ID from database
						DatabaseSync.GetUserID(_mail_address);
						// Set initial run value for appdata
						_run_ind = 1;
						// Save local JSON userdata
						AppdataJSON.AppdataSave();
						// Set user as logged in
						AppdataJSON.saveLogin();
						
						// Send to main menu
						this.removeChildren();
						drawInfopage();
						
					} else {
						
						// Info field: mail address already registered
						reg_mail_info = new InfoText ("Diese E-Mail Adresse wurde bereits für ein Konto registriert. Bitte wählen Sie eine andere E-Mail Adresse.", 300, 400);
						this.addChild(reg_mail_info);
						reg_mail_info.addEventListener(MouseEvent.CLICK, toggleMessage_mail);
						
					}
					
				} else {
					
					// Input fields need to be filled
					
				}
				
			} else {
				
				// Display info text field: Internet Connection is necessary
				// Info field: mail address already registered
				reg_inet_info = new InfoText ("Eine Internetverbindung ist zur Registrierung notwendig, wurde aber nicht erkannt. \n Bitte stellen Sie eine Internetverbindung her.", 300, 400);
				this.addChild(reg_inet_info);
				reg_inet_info.addEventListener(MouseEvent.CLICK, toggleMessage_inet);
				
			}
		
	}
	
	public function toggleMessage_mail(event: MouseEvent):Void {
		this.removeChild(reg_mail_info);
	}
	
	function toggleMessage_inet(event: MouseEvent):Void {
		this.removeChild(reg_inet_info);
	}
						
	//Leads back to start page from registration
	public function onClick_Reg_Back (event: MouseEvent):Void {
		this.removeChildren();
		log_and_reg();
	}
	
	//Login Button - button_login
	public function onClick_login (event: MouseEvent):Void {
		
		var database_availability = InternetConnection.isAvailable();
			// If internet is connected, check if input fields are filled 
		if (database_availability == true) {
				if (username.length > 0 && passw.length > 0) {
					// Check if mailaddress is already registered, if yes log-in
					_mail_address = username.text;
					var mail_availability = DatabaseSync.CheckRegistration(_mail_address);
					if (mail_availability == true){ // mail address is registered
						// retrieve ID
						DatabaseSync.GetUserID(_mail_address);
						// set ID as logged in
						AppdataJSON.saveLogin();
						// send to main menu
						this.removeChildren();
						drawInfopage();					
					} else {
						
						// Info field: mail address not yet registered -> send to registration page
						
					}
					
				} else {
					
					// Input fields need to be filled
					
				}
				
			} else {
				
				// Display info text field: Internet Connection is necessary
				
			}
		
		
	}
	
	//leads you to Login page
	public function onClick_log(event: MouseEvent):Void {
		this.removeChildren();
		getSetupImage();
	}
	//leads you to Registration page
	public function onClick_reg1(event: MouseEvent):Void {
		this.removeChildren();
		createRegistration();
	}
	//Back Button to Infopage
	public function onClick_back (event: MouseEvent):Void {
		this.removeChildren();
		drawInfopage();
	}


	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	//%%%%%%%% REGISTRATION & LOGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	//first page that lets you choose between Login and Registration
	public function log_and_reg(){
		
		background_bd = Assets.getBitmapData("img/background_medium.png");
		background_b = new Bitmap(background_bd);
		background_b.smoothing = true;
		this.addChild(background_b);
		button_log = drawButton("Login",Std.int(NOMINAL_WIDTH / 2),Std.int(NOMINAL_HEIGHT / 2),Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		button_reg1 = drawButton("Registration", Std.int(NOMINAL_WIDTH / 2), Std.int(((NOMINAL_HEIGHT / 2) + (NOMINAL_HEIGHT / 8))),Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		button_log.addEventListener(MouseEvent.CLICK, onClick_log);
		button_reg1.addEventListener(MouseEvent.CLICK, onClick_reg1);
		
	}

	//first SetUp Image with the Log-in data & PW
	public function getSetupImage(){

		username = new TextField();
		username.background = true;
		username.width = 200;
		username.height = 50;
		username.x = 300;
		username.y = 210;
		var name:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name.align = TextFormatAlign.CENTER;
		username.text = "E-Mail";
		username.defaultTextFormat = name;
		username.restrict = null;
		//user can edit the textfield
		username.type = TextFieldType.INPUT;
		// Request software keyboard on devices without hardware keyboard
		username.needsSoftKeyboard = true;
		username.requestSoftKeyboard();
		//username.replaceSelectedText("Benutzername"); //LEADS TO CRASH OF NEKO
		this.addChild(username);


		//new Textfield for password insertion
		passw = new TextField();
		//edited text is displayed as a password
		passw.displayAsPassword = true;
		passw.background = true;
		passw.width = 200;
		passw.height = 50;
		passw.x = 300;
		passw.y = 270;
		passw.restrict = null;
		//user can edit the textfield
		passw.type = TextFieldType.INPUT;
		var passw_format:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		passw_format.align = TextFormatAlign.CENTER;
		passw.defaultTextFormat = passw_format;
		passw.needsSoftKeyboard = true;
		passw.requestSoftKeyboard();
		this.addChild(passw);

		//SHOULD ONLY BE POSSIBLE WHEN TEXT IS INSERTED & MATCHED DATA BASE
		//draw Log-In button
		button_login = drawButton("Login",275,350,Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		button_login.addEventListener(MouseEvent.CLICK, onClick_login);
	}


	//creates the registration page
	function createRegistration(){
		//Insertion of the full name
		fullname = new TextField();
		fullname.background = true;
		fullname.width = 400;
		fullname.height = 50;
		fullname.x = 200;
		fullname.y = 50;

		var name1:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name1.align = TextFormatAlign.CENTER;
		fullname.text = "Name";
		fullname.defaultTextFormat = name1;
		fullname.restrict = null;
		//user can edit the textfield
		fullname.type = TextFieldType.INPUT;
		fullname.needsSoftKeyboard = true;
		fullname.requestSoftKeyboard();
		this.addChild(fullname);

		//birthdate
		birthdate = new TextField();
		birthdate.background = true;
		birthdate.width = 400;
		birthdate.height = 50;
		birthdate.x = 200;
		birthdate.y = 120;

		var name2:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name2.align = TextFormatAlign.CENTER;
		//text is restricted to only enter the birthdate
		birthdate.text = "TT.MM.JJJJ";
		birthdate.defaultTextFormat = name2;
		birthdate.restrict = "0-9.TJM";
		//user can edit the textfield
		birthdate.type = TextFieldType.INPUT;
		birthdate.needsSoftKeyboard = true;
		birthdate.requestSoftKeyboard();
		this.addChild(birthdate);

		//Register with mail address
		mailaddress = new TextField();
		mailaddress.background = true;
		mailaddress.width = 400;
		mailaddress.height = 50;
		mailaddress.x = 200;
		mailaddress.y = 190;

		var name2:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		mailaddress.text = "E-Mail";
		mailaddress.defaultTextFormat = name2;
		mailaddress.restrict = "0-9 A-Z a-z";
		mailaddress.type = TextFieldType.INPUT;
		mailaddress.needsSoftKeyboard = true;
		mailaddress.requestSoftKeyboard();
		this.addChild(mailaddress);


		//selection of password
		selectedpw = new TextField();
		selectedpw.background = true;
		selectedpw.width = 400;
		selectedpw.height = 50;
		selectedpw.x = 200;
		selectedpw.y = 260;

		var name2:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name2.align = TextFormatAlign.CENTER;
		//text is restricted to only enter the birthdate
		selectedpw.text = "Passwort";
		selectedpw.defaultTextFormat = name2;
		selectedpw.restrict = null;
		selectedpw.type = TextFieldType.INPUT;
		selectedpw.needsSoftKeyboard = true;
		selectedpw.requestSoftKeyboard();
		this.addChild(selectedpw);

		//Enabled only if text is inserted, internet connection available and mail address is not already in the database
		//Button for Registration
		button_reg = drawButton("Registrieren",100,400,Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		button_reg.addEventListener(MouseEvent.CLICK, onClick_Reg);
		
		button_reg_back = drawButton("Zurück",400,400,Std.int(NOMINAL_WIDTH / 5),Std.int(NOMINAL_HEIGHT / 9));
		button_reg_back.addEventListener(MouseEvent.CLICK, onClick_Reg_Back);

	}




	/*draws the Info page where you can choose from new game, About, Instructions, Score and Log-off
	needs text*/
	public function drawInfopage(){
		
		//New game button
        button1 = drawButton("Neues Spiel",Std.int(NOMINAL_WIDTH / 2), Std.int(((NOMINAL_HEIGHT / 2) - 2.5*(NOMINAL_HEIGHT / 8))), Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		//Anleitung
		button2 = drawButton("Anleitung",Std.int(NOMINAL_WIDTH / 2), Std.int(((NOMINAL_HEIGHT / 2) - 1.5*(NOMINAL_HEIGHT / 8))), Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		//Spielstand
		button3 = drawButton("Spielstand/Galerie",Std.int(NOMINAL_WIDTH / 2), Std.int(((NOMINAL_HEIGHT / 2) - 0.5*(NOMINAL_HEIGHT / 8))),Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		//Über das Spiel
		button4 = drawButton("Über das Spiel",Std.int(NOMINAL_WIDTH / 2), Std.int(((NOMINAL_HEIGHT / 2) + 0.5*(NOMINAL_HEIGHT / 8))), Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		//Logout
		button5 = drawButton("Logout", Std.int(NOMINAL_WIDTH / 2), Std.int(((NOMINAL_HEIGHT / 2) + 1.5*(NOMINAL_HEIGHT / 8))), Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));
		// Beenden
		button6 = drawButton("Beenden", Std.int(NOMINAL_WIDTH / 2), Std.int(((NOMINAL_HEIGHT / 2) + 2.5*(NOMINAL_HEIGHT / 8))), Std.int(NOMINAL_WIDTH / 3),Std.int(NOMINAL_HEIGHT / 7));


			
		button1.addEventListener(MouseEvent.CLICK, onClick1);
		button2.addEventListener(MouseEvent.CLICK, onClick2);
		button3.addEventListener(MouseEvent.CLICK, onClick3);
		button4.addEventListener(MouseEvent.CLICK, onClick4);
		button5.addEventListener(MouseEvent.CLICK, onClick5);
		button6.addEventListener(MouseEvent.CLICK, onClick6);
		
	
	}
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	//%%%%%%%%%OUT OF FOCUS FUNCTIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	//what to do if app is out of focus
    private function pause(e:Event):Void{
		
        // set game state to paused to stop task evaluation
		currentGameState = Paused;
		// get time stamp of unfocus event
		var current_time = Date.now();
		timestamp_unfocus = current_time.getTime();

    }
	//app back in focus - start last run again
    private function unpause(e:Event):Void{
   
		// check if unfocus was longer than 1 hour (= 3600000 milliseconds)
		var current_time = Date.now();
		timestamp_refocus = current_time.getTime();
		
		if (timestamp_refocus - timestamp_unfocus > 3600000) {
		
			// Set round index to 0 as it will be increased to 1 in the newRound function 
			_trial_ind = 0;
			
			// restart score for reset run
			_score = 0;
			
			// Resume game
			// start newRound
			newRound();
			
		} else {
			
			// resume game with previous settings
			currentGameState = Playing;
			
		}
	
    }

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


//%%%%%%%%%%% SLOT MACHINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	//function that draws the Slotmachine
	function drawSlotmachine(){
	
		//stops game when not zoned in
		//insert focus out???
		stage.addEventListener(Event.DEACTIVATE, pause);
        stage.addEventListener(Event.ACTIVATE, unpause);
		
		//End game Button --> drawInfoPage
		button_end = drawButton("Zurück",Std.int(NOMINAL_WIDTH),540, Std.int(NOMINAL_WIDTH / 5),Std.int(NOMINAL_HEIGHT / 9));
		//this.addChild(button_end);
		button_end.addEventListener(MouseEvent.CLICK, onClick_end);
		


		// Draw slot machines on screen
		slot_machine_blue = new Machine_blue();
		//slot_machine_blue.x = 50;
		//slot_machine_blue.y = 150;
		slot_machine_blue.x = Std.int(NOMINAL_WIDTH / 2) - Std.int(NOMINAL_WIDTH / 6);
		slot_machine_blue.y = Std.int(NOMINAL_HEIGHT / 2);
		this.addChild(slot_machine_blue);

		slot_machine_green = new Machine_green();
		slot_machine_green.x = Std.int(NOMINAL_WIDTH / 2) + Std.int(NOMINAL_WIDTH / 6);
		slot_machine_green.y = Std.int(NOMINAL_HEIGHT / 2);
		this.addChild(slot_machine_green);
		
		
		// Draw selection circle
		circle_selection = new Selection_Circle(0xc7ccd6);
		//circle_selection.x = 0;
		//circle_selection.y = 0;
		circle_selection.x = Std.int(NOMINAL_WIDTH / 2);
		circle_selection.y = Std.int(NOMINAL_HEIGHT / 2);
		this.addChild(circle_selection);
		
		// Draw score text field and set starting score points to zero
		var scoreFormat:TextFormat = new TextFormat("Verdana", 30, 0xbbbbbb, true);
		scoreFormat.align = TextFormatAlign.LEFT;
		
		scoreField = new TextField();
		addChild(scoreField);
		scoreField.width = NOMINAL_WIDTH / 2.2;
		//scoreField.x = 50;
		scoreField.y = NOMINAL_HEIGHT / 60;
		scoreField.defaultTextFormat = scoreFormat;
		scoreField.selectable = false;
		
		//_score = 1;
		scoreField.text = 'Score: $_score';
		
		// Draw city text field	
		var cityFormat:TextFormat = new TextFormat("Verdana", 30, 0xbbbbbb, true);
		scoreFormat.align = TextFormatAlign.RIGHT;
		
		cityField = new TextField();
		addChild(cityField);
		cityField.width = NOMINAL_WIDTH / 2.2;
		//cityField.x = 650;
		cityField.y = NOMINAL_HEIGHT / 60;
		cityField.defaultTextFormat = scoreFormat;
		cityField.selectable = false;
		
		cityName = "Tübingen";
		cityField.text = '$cityName';

		levelFormat = new TextFormat("Verdana", 30, 0xbbbbbb, true);
		levelFormat.align = TextFormatAlign.RIGHT;
		
		levelField = new TextField();
		addChild(levelField);
		levelField.width = NOMINAL_WIDTH / 2.2;
		//cityField.x = 650;
		levelField.y = NOMINAL_HEIGHT / 20;
		levelField.defaultTextFormat = levelFormat;
		levelField.selectable = false;
		levelField.text = '$_trial_ind';
		//levelField.text = '$_run_ind';


		// Define and format text fields displaying slot machine outcome
		// blue
		var scoreFormat_blue:TextFormat = new TextFormat("Verdana", 28, 0xfff61f, true);
		scoreFormat_blue.align = TextFormatAlign.CENTER;

		scoreField_blue = new TextField();
		addChild(scoreField_blue);
		scoreField_blue.width = 50;
		//scoreField_blue.x = 125;
		//scoreField_blue.y = 245;
		scoreField_blue.x = Std.int(NOMINAL_WIDTH / 2) - Std.int(NOMINAL_WIDTH / 6);
		scoreField_blue.y = Std.int(NOMINAL_HEIGHT / 2);
		scoreField_blue.defaultTextFormat = scoreFormat_blue;
		scoreField_blue.selectable = false;

		// green
		var scoreFormat_green:TextFormat = new TextFormat("Verdana", 28, 0xfff61f, true);
		scoreFormat_green.align = TextFormatAlign.CENTER;

		scoreField_green = new TextField();
		addChild(scoreField_green);
		scoreField_green.width = 50;
		//scoreField_green.x = 625;
		//scoreField_green.y = 245;
		scoreField_green.x = Std.int(NOMINAL_WIDTH / 2) + Std.int(NOMINAL_WIDTH / 6);
		scoreField_green.y = Std.int(NOMINAL_HEIGHT / 2);
		scoreField_green.defaultTextFormat = scoreFormat_green;
		scoreField_green.selectable = false;
		
		//Initialise probabilities
		var step:Float;
		var probvalueadd:Float;
		
		// Generate values for a gaussian random walk and append them to the probability values array
		for (i in 0...trials-1) {
			
			step = NormRandom.floatNormal(0,0.075);
			
			while (probArray[i] + step - 0.05 * (probArray[i] - 0.5) < 0 || probArray[i] + step - 0.05 * (probArray[i] - 0.5) > 1) {
				
				step = NormRandom.floatNormal(0,0.075);
				
			}
			
			probvalueadd = probArray[i] + step - 0.05 * (probArray[i] - 0.5);
			probArray.push(probvalueadd);
		}
		
		// Start game
		newRound();
		
		//reward_prob_A = probArray[0];
		//reward_prob_B = 1 - reward_prob_A;
		
		// DUMMY: Initialize database entries
		//_p_reward_A = reward_prob_A;
		//_p_reward_B = reward_prob_B;
		//_reward_A = A_reward;
		//_reward_B = B_reward;
		
		
		// Set game state
		//currentGameState = Playing;		
		
		
		//addChild(inftext, );

			
		inftext = new InfoText("Bitte efüllen Sie die Aufgabe gewissenhaft.", 100, 400);
		this.addChild(inftext);
	}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


//%%%%%%%%%%PATHOGEN PIC ASSIGNMENT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
	public function getPathogenAssignment(){
		//pathogen assignments to the pathogen array
		pathogenArrayBM[1] = Assets.getBitmapData("img/virus1.png");
		pathogenArrayBM[2] = Assets.getBitmapData("img/virus2.png");
		/*pathogenArrayBM[3]
		pathogenArrayBM[4]
		pathogenArrayBM[5]
		pathogenArrayBM[6]
		pathogenArrayBM[7]
		pathogenArrayBM[8]
		pathogenArrayBM[9]
		pathogenArrayBM[10]
		pathogenArrayBM[11]
		pathogenArrayBM[12]
		pathogenArrayBM[13]
		pathogenArrayBM[14]
		pathogenArrayBM[15]
		pathogenArrayBM[16]
		pathogenArrayBM[17]
		pathogenArrayBM[18]
		pathogenArrayBM[19]
		pathogenArrayBM[20]
		pathogenArrayBM[21]
		pathogenArrayBM[22]
		pathogenArrayBM[23]
		pathogenArrayBM[24]
		pathogenArrayBM[25]
		pathogenArrayBM[26]
		pathogenArrayBM[27]
		pathogenArrayBM[28]
		pathogenArrayBM[29]
		pathogenArrayBM[30]
		pathogenArrayBM[31]
		*/
		//3 will be replaced with 31
		for(i in 1...3){
			pathogenArray[i] = new Bitmap(pathogenArrayBM[i]);
		}
		
	}

	public function seeGamestatus(_run_ind:Int){
		/*probably a variable that gets its value from the 
		data base to represent the level that you reached
		--> var level: now set to 1 because no data base available
		*/
		/*add = 100;
		// only count to run_ind - 1 as the current pathogen has not been beaten yet
		for(i in 1..._run_ind-1){
			pathogen_array[i].x = 0;
			pathogen_array[i].y = add;
			addChild(pathogen_array[i]);
			add = add + 50;

		
		 //if we have 30 different pathogen we need to build in 
		 //for loops to make coloumns to present them
		 
		}*/

	/**
	 *   bd = Assets.getBitmapData("img/logo.png");
		b = new Bitmap(bd);
        addChild(b);
	 */
	}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//%%%%%%%%%%INITIATION FUNCTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
		
		// Listen for exit events and attach sync functions to exit handler
		ExitHandler.setExitHandler(function() {
			
			var database_availability = InternetConnection.isAvailable();
			// Move data from local SQLite database to MariaDB if internet connection is available
			if (database_availability == true) {
				//DatabaseSync.loadSQLite();
			}
			
		});
		
		// Load pathogen images into image array
		getPathogenAssignment();
		
		// Set initial values
		// Set round index to 0 as it will be increased to 1 in the newRound function
		_trial_ind = 0;
		// Initialize score
		_score = 0;
		// Initialize run finished marker
		_run_finished = 0;
			
		// Check if user is logged in and retrieve ID
		login_savepath = Path.join([save_path, login_file]);
		if (FileSystem.exists(login_savepath)) {
			
			// Load ID of logged in user
			AppdataJSON.loadLogin();
			// Load appdata
			AppdataJSON.AppdataLoad();
			// Grab system specs
			#if desktop
			_device_type = "desktop";
			#elseif mobile
			_device_type = "mobile";
			#end
			
			_device_os = Capabilities.os;
			// Send to main menu
			drawInfopage();
			
		} else {
			
			// Send to login & registration page 
			log_and_reg();
			
		}
		
		
		//getSetupImage();
		//createLogInPage();
		//drawInfopage();
		//drawSlotmachine();


		
	}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	/* SETUP */
	//Entry point of main function: treats it as an object
	public function new() 

	{
		//Lib.application.window.x = 0;
		//Lib.application.window.y = 0;
		
		//Lib.application.window.resize(Std.int(Capabilities.screenResolutionX), Std.int(Capabilities.screenResolutionY));
		
		
		super();	
		//addEventListener(Event.ADDED_TO_STAGE, onResize);

		//stage.scaleMode = openfl.display.StageScaleMode.SHOW_ALL;
		
		#if flash
        stage.align = untyped "";
    	#else
        stage.addEventListener(Event.RESIZE, onResize);
		Lib.current.stage.displayState = openfl.display.StageDisplayState.FULL_SCREEN_INTERACTIVE;
        //onResize(null);
		#end

		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}

	private function onResize(e:Event):Void {
    	//stageScaleX = stage.stageWidth / NOMINAL_WIDTH;
    	//stageScaleY = stage.stageHeight / NOMINAL_HEIGHT;
		
		stageScaleX = Lib.current.stage.window.width / NOMINAL_WIDTH;
    	stageScaleY = Lib.current.stage.window.height / NOMINAL_HEIGHT;

    	stageScale = Math.min(stageScaleX, stageScaleY);
		trace(stageScale);
    
    	Lib.current.scaleX = stageScale;
    	Lib.current.scaleY = stageScale;
		
		trace(Lib.current.stage.stageWidth);
		trace(Lib.current.stage.stageHeight);
		
        Lib.current.x = (Lib.current.stage.window.width - NOMINAL_WIDTH * stageScale) / 2;
        Lib.current.y = (Lib.current.stage.window.height - NOMINAL_HEIGHT * stageScale) / 2;
		
	}

	// Set keyboard keys actived/deactivated on key press/release
	private function onKeyDown(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = true;
	}

	private function onKeyUp(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = false;
	}


//%%%%%%%%%%%% GAME %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	private function everyFrame(event:Event):Void {
	
		// Only execute if the game is currently active to prevent excessive summation of rewards
		if (currentGameState == Playing) {
		
			if (keys[Keyboard.LEFT]) {
				// Draw frame indicating choice
				this.removeChild(frame_choice);
				frame_choice = new Choice_Frame(0xc7ccd6);
				frame_choice.x = 0;
				frame_choice.y = 0;
				frame_choice_side = 1;
				
				/*frame_choice.x = Std.int(NOMINAL_WIDTH / 2) - Std.int(NOMINAL_WIDTH / 9);
				frame_choice.y = Std.int(NOMINAL_HEIGHT / 2) - Std.int(NOMINAL_HEIGHT / 6);*/
				frame_choice_side = 1;
				this.addChild(frame_choice);
			}
			
			if (keys[Keyboard.RIGHT]) {
				// Draw frame indicating choice
				this.removeChild(frame_choice);
				frame_choice = new Choice_Frame(0xc7ccd6);
				frame_choice.x = Std.int(NOMINAL_WIDTH / 2) + Std.int(NOMINAL_WIDTH / 6);
				frame_choice.y = Std.int(NOMINAL_HEIGHT / 2);
				frame_choice_side = 2;
				this.addChild(frame_choice);
			}
			
			if (this.contains(frame_choice) && frame_choice_side == 1 && keys[Keyboard.ENTER]) {
				
				// Halt game for evaluation
				currentGameState = Evaluate;
				
				// Change color of choice frame and call function for evaluation
				this.removeChild(frame_choice);
				frame_choice = new Choice_Frame(0x8e8e8e);
				frame_choice.x = Std.int(NOMINAL_WIDTH / 2) - Std.int(NOMINAL_WIDTH / 6);
				frame_choice.y = Std.int(NOMINAL_HEIGHT / 2);
				this.addChild(frame_choice);
				endRound('A');
				
			}
			
			if (this.contains(frame_choice) && frame_choice_side == 2 && keys[Keyboard.ENTER]) {
				
				// Halt game for evaluation
				currentGameState = Evaluate;
				
				// Change color of choice frame and call function for evaluation
				this.removeChild(frame_choice);
				frame_choice = new Choice_Frame(0x8e8e8e);
				frame_choice.x = Std.int(NOMINAL_WIDTH / 2) + Std.int(NOMINAL_WIDTH / 6);
				frame_choice.y = Std.int(NOMINAL_HEIGHT / 2);
				this.addChild(frame_choice);
				endRound('B');
				
			}
		
		}
		
	}
	
	
	private function endRound(drug_choice:String):Void {
		
		// Get winning machine
		prob_draw = random();
		
		// Evaluate winning machine and set output accordingly
		if (prob_draw <= reward_prob_A) {
			correct_choice = 'A';
			this.removeChild(circle_selection);
			circle_selection = new Selection_Circle(0x0066cc);
			circle_selection.x = Std.int(NOMINAL_WIDTH / 2);
			circle_selection.y = Std.int(NOMINAL_HEIGHT / 2);
			this.addChild(circle_selection);
			trace('$_score');
			
			// If the winning option was selected add reward to score and update score field
			if (drug_choice == 'A') {
				
				_score = Std.int(_score + A_reward);
				scoreField.text = 'Score: $_score';
				
			}
			
			// If the non-winning option was selected subtract reward from score and update score field
			else if (drug_choice == 'B') {
				
				_score = Std.int(_score - A_reward);
				scoreField.text = 'Score: $_score';
				
			}
			
		
		} else {
			correct_choice = 'B';
			this.removeChild(circle_selection);
			circle_selection = new Selection_Circle(0x1f7c0a);
			circle_selection.x = Std.int(NOMINAL_WIDTH / 2);
			circle_selection.y = Std.int(NOMINAL_HEIGHT / 2);
			this.addChild(circle_selection);
			trace('$_score');
						
			// If the winning option was selected add reward to score and update score field
			if (drug_choice == 'B') {
				
				_score = _score + B_reward;
				scoreField.text = 'Score: $_score';
				
			}
			
			// If the non-winning option was selected subtract reward from score and update score field
			else if (drug_choice == 'A') {
				
				_score = _score - B_reward;
				scoreField.text = 'Score: $_score';
				
			}
		}

		//  Set values for database
		_p_draw = prob_draw;
		_drawn_outcome = correct_choice;
		_choice = drug_choice;
		if (correct_choice == drug_choice) {
			_win = 1;
		} else {
			_win = 0;
		}
		_timestamp = Date.now();

		// Write to database
		AppdataEntryLite.writeLiteTrialEntry();
		
		/**
		 *  needs to delete the data base entries from before
		 *  sets trials back to 1 so level needs to be played again
		 */
		/*if(currentGameState==Paused){
			_trial_ind=1;
		}*/
		
		// Set timer to give player time to evaluate the outcome
		if (_trial_ind < trials)
		{
			// call function newRound with delay of 300 ms	
			haxe.Timer.delay(newRound,300);
			
		} else {
			
			// modify run_finished entry as run is now finalized
			AppdataEntryLite.modifyLiteTrialEntry();
			// increase run index by 1
			_run_ind = _run_ind + 1;
			// update global score
			_global_score = _global_score + _score;
			// restart score for new run
			_score = 0;
			// set trial index to 0 as it will be increased to 1 in the newRound function
			_trial_ind = 0;
			// save new run info locally
			AppdataJSON.AppdataSave();
			// call function for questionnaire items
			
			// save run related info in the database, currently deactivated as not all run entries are available
			//AppdataEntryLite.writeLiteRunEntry();
			// call function newRound with delay of 300 ms
			haxe.Timer.delay(newRound,300);
		}
		
	}
	
	
	private function newRound():Void {
		
		// Adapt trial counter
		_trial_ind = _trial_ind + 1;
		levelField.text = 'Runde: $_trial_ind';
		
		// Set up new rewards
		A_reward = Math.round(NormRandom.floatNormal(50, 16));
		
		if (A_reward > 99) {
			
			A_reward = 99;
			
		} else if (A_reward < 1) {
			
			A_reward = 1;
			
		}
		
		
		B_reward = 100 - A_reward;
		scoreField_blue.text = Std.string(A_reward);
		scoreField_green.text = Std.string(B_reward);
		
		// Grab new reward probabilities
		reward_prob_A = probArray[_trial_ind-1];
		reward_prob_B = 1 - reward_prob_A;
		
		// Reset selection circle
		this.removeChild(circle_selection);
		circle_selection = new Selection_Circle(0xc7ccd6);
		circle_selection.x = Std.int(NOMINAL_WIDTH / 2);
		circle_selection.y = Std.int(NOMINAL_HEIGHT / 2);
		this.addChild(circle_selection);
		
		// Remove any selection frames
		this.removeChild(frame_choice);
		
		// Remove any selection frames
		this.removeChild(frame_choice);
		
		// Set new values for database
		_p_reward_A = reward_prob_A;
		_p_reward_B = reward_prob_B;
		_reward_A = A_reward;
		_reward_B = B_reward;
		
		// Resume game
		//everyframe always active when currentGameState=Playing
		//->goes to everyFrame
		currentGameState = Playing;
		
	}
//%%%%%%%%%%%% GAME %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

}
