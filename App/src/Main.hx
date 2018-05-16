package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.text.TextField;
import haxe.ui.containers.VBox;
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
import haxe.ui.Toolkit;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.CheckBox;
import haxe.ui.components.HSlider;
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
	private var NotepadA:NotepadLeft;
	private var NotepadB:NotepadRight;
	private var SyringeA:Syringe;
	private var SyringeB:Syringe;
	
	// Definition of selection circle graphic element
	private var circle_selection:Selection_Circle;
	
	// Definition of choice frame graphic element
	private var frame_choice:Choice_Frame;
	private var frame_choice_side:Int;

	// Define vars for slot machine values and associated text fields
	private var A_reward:Int;
	private var B_reward:Int;
	private var scoreField_A:TextField;
	private var scoreField_B:TextField;

	var stageWidth:Int = Lib.current.stage.stageWidth;
    var stageHeight:Int = Lib.current.stage.stageHeight;
	
	// Define score text field
	public var scoreField:TextField;
	public var scorePlayer:Int;
	
	//Define city text field
	public var cityField:TextField;
	public var cityName:String;
	
	// Define array for reward probabilities
	var probA:Array<Float>;
	
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
	public var reg_entry_info:InfoText;

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
	
	
	public var timestamp_unfocus:Int = 0;
	public var timestamp_refocus:Int = 0;

	
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}


//%%%%%%%%%%BUTTONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	//onClick functions for the multiple buttons
	
	//DATENBANK ABSPEICHERN
	//Button: New Game - Button1
	public function onClick1 (event: MouseEvent):Void {
		//menu_screen.removeChildren();
		this.removeChild(menu_screen);
		MainGame();	
	}
	//Instruction - Button2
	public function onClick2 (event: MouseEvent):Void {
		menu_screen.removeChildren();
		button_back = Button.drawButton("Zurück",Std.int(NOMINAL_WIDTH -150),50,"back");
		button_back.addEventListener(MouseEvent.CLICK, onClick_back);
		menu_screen.addChild(button_back);
	}
	//DATENBANKABRUF
	//Button Game Status - Button3
	public function onClick3 (event: MouseEvent):Void {
		this.removeChild(menu_screen);
		drawGallery();
		button_back = Button.drawButton("Zurück",Std.int(NOMINAL_WIDTH -150),50,"back");
		button_back.addEventListener(MouseEvent.CLICK, onClick_back);	
		menu_screen.addChild(button_back);
	}
	
	//Button Über das Spiel - Button4
	public function onClick4 (event: MouseEvent):Void {
		menu_screen.removeChildren();
		button_back = Button.drawButton("Zurück",Std.int(NOMINAL_WIDTH -150),50,"back");
		button_back.addEventListener(MouseEvent.CLICK, onClick_back);
		menu_screen.addChild(button_back);
		//menu_screen.removeChildren();	
	}
	
	//Button Logout - button5
	public function onClick5 (event: MouseEvent):Void {
		// Delete logged in cookie
		AppdataJSON.removeLogin();
		// clear screen
		this.removeChild(menu_screen);
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
		drawMenuScreen();
	}
	
	//Registration Button event - button_reg
	// Query database for registration process
	public function onClick_Reg (event: MouseEvent):Void {
		// Check internet connection
		var database_availability = InternetConnection.isAvailable();
			// If internet is connected, check if input fields are filled 
		if (database_availability == true) {
				if (mailaddress.length > 0 && selectedpw.length > 0) {
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
						this.removeChild(registration_screen);
						drawMenuScreen();
						
					} else {
						
						// Info field: mail address already registered
						reg_mail_info = new InfoText ("Diese E-Mail Adresse wurde bereits für ein Konto registriert.\nBitte wählen Sie eine andere E-Mail Adresse.");
						var reg_mail_info_button = reg_mail_info.getChildAt(1);
						reg_mail_info_button.addEventListener(MouseEvent.CLICK, toggleMessageRegMail);
						registration_screen.addChild(reg_mail_info);
												
					}
					
				} else {
					
					// Input fields need to be filled
					reg_entry_info = new InfoText ("Die Eingaben zu E-Mailadresse und Passwort dürfen nicht leer sein");
					var reg_entry_info_button = reg_entry_info.getChildAt(1);
					reg_entry_info_button.addEventListener(MouseEvent.CLICK, toggleMessageRegEntry);
					registration_screen.addChild(reg_entry_info);
					
				}
				
			} else {
				
				// Display info text field: Internet Connection is necessary
				// Info field: mail address already registered
				reg_inet_info = new InfoText ("Eine Internetverbindung ist zur Registrierung notwendig, wurde aber nicht erkannt.\n Bitte stellen Sie eine Internetverbindung her.");
				var reg_inet_info_button = reg_inet_info.getChildAt(1);
				reg_inet_info_button.addEventListener(MouseEvent.CLICK, toggleMessageRegInet);
				registration_screen.addChild(reg_inet_info);
				
			}
		
	}
	
	public function toggleMessageRegMail(event: MouseEvent):Void {
		registration_screen.removeChild(reg_mail_info);
	}
	
	public function toggleMessageRegEntry(event: MouseEvent):Void {
		registration_screen.removeChild(reg_entry_info);
	}
	
	function toggleMessageRegInet(event: MouseEvent):Void {
		registration_screen.removeChild(reg_inet_info);
	}
						
	//Leads back to start page from registration
	public function onClick_Reg_Back (event: MouseEvent):Void {
		this.removeChildren();
		//Screen.instance.removeComponent(box_container);
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
						this.removeChild(login_screen);
						drawMenuScreen();					
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
		this.removeChild(login_screen);
		getLoginScreen();
	}
	//leads you to Registration page
	public function onClick_reg1(event: MouseEvent):Void {
		this.removeChild(login_screen);
		createRegistration();
	}
	//Back Button to Infopage
	public function onClick_back (event: MouseEvent):Void {
		this.removeChildren();
		drawMenuScreen();
	}


	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	//%%%%%%%% REGISTRATION & LOGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	//first page that lets you choose between Login and Registration
	public function log_and_reg(){
		//global var
		login_screen = new Sprite();
		login_screen.addChild(img_menu_background);
		
		button_log = Button.drawButton("Login",NOMINAL_WIDTH / 2, 400, "menu");
		button_reg1 = Button.drawButton("Registrierung", NOMINAL_WIDTH / 2, 600, "menu");
		button_log.addEventListener(MouseEvent.CLICK, onClick_log);
		button_reg1.addEventListener(MouseEvent.CLICK, onClick_reg1);
		
		login_screen.addChild(button_log);
		login_screen.addChild(button_reg1);
		
		this.addChild(login_screen);
		
	}

	// draw login screen Log-in data & PW
	public function getLoginScreen(){
		
		login_screen = new Sprite();
		login_screen.addChild(img_menu_background);

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
		login_screen.addChild(username);


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
		login_screen.addChild(passw);

		//SHOULD ONLY BE POSSIBLE WHEN TEXT IS INSERTED & MATCHED DATA BASE
		//draw Log-In button
		button_login = Button.drawButton("Login",275,350,"menu");
		button_login.addEventListener(MouseEvent.CLICK, onClick_login);
	

		this.addChild(login_screen);	
	}


	//creates the registration page
	function createRegistration(){
		
		registration_screen = new Sprite();
		registration_screen.addChild(img_menu_background);
		
		//Register with mail address
		mailaddress = new TextField();
		mailaddress.background = true;
		mailaddress.width = 600;
		mailaddress.height = 50;
		mailaddress.x = (NOMINAL_WIDTH - mailaddress.width) / 2;
		mailaddress.y = 200;

		var name2:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		mailaddress.text = "E-Mail";
		mailaddress.defaultTextFormat = name2;
		mailaddress.restrict = "0-9 A-Z a-z";
		mailaddress.type = TextFieldType.INPUT;
		mailaddress.needsSoftKeyboard = true;
		mailaddress.requestSoftKeyboard();
		registration_screen.addChild(mailaddress);


		//selection of password
		selectedpw = new TextField();
		selectedpw.background = true;
		selectedpw.width = 600;
		selectedpw.height = 50;
		selectedpw.x = (NOMINAL_WIDTH - selectedpw.width) / 2;
		selectedpw.y = 400;

		var name2:TextFormat = new TextFormat("Verdana", 16, 0xbbbbbb, true);
		//Text is centered
		name2.align = TextFormatAlign.CENTER;
		selectedpw.text = "Passwort";
		selectedpw.defaultTextFormat = name2;
		selectedpw.restrict = null;
		selectedpw.type = TextFieldType.INPUT;
		selectedpw.needsSoftKeyboard = true;
		selectedpw.requestSoftKeyboard();
		registration_screen.addChild(selectedpw);
		
		var box_container = new VBox();
		box_container.x = 470;
		box_container.y = 470;
				
		var reg_checkbox_consent = new CheckBox();
		reg_checkbox_consent.id = "consent_cb";
		reg_checkbox_consent.selected = false;
		reg_checkbox_consent.text = "Ich bin einverstanden, an der Studie teilzunehmen.";
		
		box_container.addComponent(reg_checkbox_consent);
		
		
		var test_slider = new HSlider();
		test_slider.resizeComponent(500, 50);
		test_slider.x = (NOMINAL_WIDTH - test_slider.width) / 2;
		test_slider.y = 550;
		test_slider.max = 100;
		test_slider.min = 0;
		
		box_container.addComponent(test_slider);
		
		Screen.instance.addComponent(box_container);
		//registration_screen.addChild(box_container);
		

		//Enabled only if text is inserted, internet connection available and mail address is not already in the database
		//Button for Registration
		button_reg = Button.drawButton("Registrieren",NOMINAL_WIDTH / 2,750,"menu");
		button_reg.addEventListener(MouseEvent.CLICK, onClick_Reg);
		
		button_reg_back = Button.drawButton("Zurück",NOMINAL_WIDTH / 2,900,"menu");
		button_reg_back.addEventListener(MouseEvent.CLICK, onClick_Reg_Back);
		
		registration_screen.addChild(button_reg);
		registration_screen.addChild(button_reg_back);

		this.addChild(registration_screen);
	}




	/*draws the menu screen where you can choose from new game, About, Instructions, Score and Log-off
	needs text*/
	public function drawMenuScreen(){
		
		menu_screen = new Sprite();
		menu_screen.addChild(img_menu_background);
		
		//New game button
        button1 = Button.drawButton("Neues Spiel",NOMINAL_WIDTH / 2, 200, "menu");
		//Anleitung
		button2 = Button.drawButton("Anleitung",Std.int(NOMINAL_WIDTH / 2), 350, "menu");
		//Spielstand
		button3 = Button.drawButton("Spielstand/Galerie",Std.int(NOMINAL_WIDTH / 2), 500, "menu");
		//Über das Spiel
		button4 = Button.drawButton("Über das Spiel",Std.int(NOMINAL_WIDTH / 2), 650, "menu");
		//Logout
		button5 = Button.drawButton("Logout", Std.int(NOMINAL_WIDTH / 2), 800, "menu");
		// Beenden
		button6 = Button.drawButton("Beenden", Std.int(NOMINAL_WIDTH / 2), 950, "menu");

	
		button1.addEventListener(MouseEvent.CLICK, onClick1);
		button2.addEventListener(MouseEvent.CLICK, onClick2);
		button3.addEventListener(MouseEvent.CLICK, onClick3);
		button4.addEventListener(MouseEvent.CLICK, onClick4);
		button5.addEventListener(MouseEvent.CLICK, onClick5);
		button6.addEventListener(MouseEvent.CLICK, onClick6);
		
		menu_screen.addChild(button1);
		menu_screen.addChild(button2);
		menu_screen.addChild(button3);
		menu_screen.addChild(button4);
		menu_screen.addChild(button5);
		menu_screen.addChild(button6);
		
		this.addChild(menu_screen);
		
	
	}
	
	
	//draws the screen for questionnaire items
	public function drawQuestionnaireScreen(){
		
		questionnaire_screen = new Sprite();
		questionnaire_screen.addChild(input_background);
		
	}
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	//%%%%%%%%%OUT OF FOCUS FUNCTIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	//what to do if app is out of focus
    private function pause(e:Event):Void{
		
        // set game state to paused to stop task evaluation
		currentGameState = Paused;
		// get time stamp of unfocus event
		var current_time = Date.now();
		timestamp_unfocus = current_time.getHours();

    }
	//app back in focus - start last run again
    private function unpause(e:Event):Void{
   
		// check if unfocus was longer than 1 hour (= 3600000 milliseconds)
		var current_time = Date.now();
		timestamp_refocus = current_time.getHours();
		
		if (timestamp_refocus - timestamp_unfocus >= 1) {
		
			// Set round index to 0 as it will be increased to 1 in the newRound function 
			_trial_ind = 0;
			
			// restart score for reset run
			_score = 0;
			
			// Resume game
			// start newRound
			MainGame();
			
		} else {
			
			// resume game with previous settings
			currentGameState = Playing;
			
		}
	
    }

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



//%%%%%%%%%%Random Walks%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	public function generateRandomWalk():Array<Float> {
		
		//Initialise probabilities
		var step:Float;
		var probvalueadd:Float;
		var probabilitiesA:Array<Float> = [0.5];
		
		// Generate values for a gaussian random walk and append them to the probability values array
		for (i in 0...trials-1) {
			
			step = NormRandom.floatNormal(0,0.075);
			
			while (probabilitiesA[i] + step - 0.05 * (probabilitiesA[i] - 0.5) < 0 || probabilitiesA[i] + step - 0.05 * (probabilitiesA[i] - 0.5) > 1) {
				
				step = NormRandom.floatNormal(0,0.075);
				
			}
			
			probvalueadd = probabilitiesA[i] + step - 0.05 * (probabilitiesA[i] - 0.5);
			probabilitiesA.push(probvalueadd);
		}
		
		return probabilitiesA;
		
	}


//%%%%%%%%%%PATHOGEN PIC ASSIGNMENT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
	public function drawGallery(){
		
		// Set up screen for gallery
		gallery_screen = new Sprite();
		gallery_screen.addChild(img_gallery_background);
		
		// Add button to get back to main menu
		button_end = Button.drawButton("Zurück", Std.int(NOMINAL_WIDTH -150),50, "back");
		button_end.addEventListener(MouseEvent.CLICK, onClick_end);
		gallery_screen.addChild(button_end);
		
		add = 280;
		// only count to run_ind - 1 as the current pathogen has not been beaten yet
		for (i in 1..._run_ind){
			
			if (i >= 1 && i <= 8) {
			
				pathogen_array[i-1].x = add;
				pathogen_array[i-1].y = 230;
			
				gallery_screen.addChild(pathogen_array[i-1]);
			
				add = add + 180;
				
			}
			
			else if (i >= 9 && i <= 16) {
				
				if (i == 9) {
					add = 280;
				}
				
				pathogen_array[i-1].x = add;
				pathogen_array[i-1].y = 410;
			
				gallery_screen.addChild(pathogen_array[i-1]);
			
				add = add + 180;
				
			}
			
			else if (i >= 17 && i <= 24) {
				
				if (i == 17) {
					add = 280;
				}
				
				pathogen_array[i-1].x = add;
				pathogen_array[i-1].y = 590;
			
				gallery_screen.addChild(pathogen_array[i-1]);
			
				add = add + 180;
				
			}
			
			else if (i >= 25 && i <= 31) {
				
				if (i == 25) {
					add = 280;
				}
				
				pathogen_array[i-1].x = add;
				pathogen_array[i-1].y = 770;
			
				gallery_screen.addChild(pathogen_array[i-1]);
			
				add = add + 180;
				
			}
		 
		}
		
		this.addChild(gallery_screen);
	}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//%%%%%%%%%%INITIATION FUNCTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	function init() 
	{

		if (inited) return;
		inited = true;

		/*// Set up keys to select option: usually in init function 
		keys = [];
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);*/
		
		// Listen for input
		//this.addEventListener(Event.ENTER_FRAME, everyFrame);
		
		// Listen for exit events and attach sync functions to exit handler
		ExitHandler.setExitHandler(function() {
			
			var database_availability = InternetConnection.isAvailable();
			// Move data from local SQLite database to MariaDB if internet connection is available
			if (database_availability == true) {
				//DatabaseSync.loadSQLite();
			}
			
		});
		
		// Prepare assets
		AssetPreparation.getPathogens();
		AssetPreparation.getBackgrounds();
		AssetPreparation.getNotepads();
		AssetPreparation.getSyringes();
		
		
		// Initialize screens
		
		
		// Initialize HaxeUI toolkit
		Toolkit.init();
		
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
			drawMenuScreen();
			
		} else {
			
			// Send to login & registration page 
			log_and_reg();
			
		}
		
		
		//getLoginScreen();
		//createLogInPage();
		//drawMenuScreen();
		//MainGame();


		
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

	/*// Set keyboard keys actived/deactivated on key press/release
	private function onKeyDown(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = true;
	}

	private function onKeyUp(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = false;
	}*/


//%%%%%%%%%%%% GAME %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	//function that draws the Main Game Screen
	function MainGame(){
		
		//stops game when not zoned in and indicates when focus is back
		stage.addEventListener(Event.DEACTIVATE, pause);
        stage.addEventListener(Event.ACTIVATE, unpause);
		
		this.removeChild(game_screen);
	
		//End game Button --> drawMenuScreen
		//button_end = drawButton("Zurück",Std.int(NOMINAL_WIDTH),540, Std.int(NOMINAL_WIDTH / 5),Std.int(NOMINAL_HEIGHT / 9));
		//this.addChild(button_end);
		//button_end.addEventListener(MouseEvent.CLICK, onClick_end);
		
		// get background image associated with level and attach to new sprite
		game_screen = new MainGameScreen();
		//button_end = Button.drawButton("Zurück",Std.int(NOMINAL_WIDTH),540, Std.int(NOMINAL_WIDTH / 5),Std.int(NOMINAL_HEIGHT / 9));
		//button_end = Button.drawButton("Zurück", Std.int(NOMINAL_WIDTH -100),Std.int(NOMINAL_HEIGHT / 13), "back");
		button_end = Button.drawButton("Zurück", Std.int(NOMINAL_WIDTH -150),50, "back");
		button_end.addEventListener(MouseEvent.CLICK, onClick_end);
		game_screen.addChild(button_end);
		// add notepads to game screen
		NotepadA = new NotepadLeft();
		NotepadA.x = 350;
		NotepadA.y = 250;
		game_screen.addChild(NotepadA);
		
		NotepadB = new NotepadRight();
		NotepadB.x = 1150;
		NotepadB.y = 250;
		game_screen.addChild(NotepadB);
		
				
		// add syringes (full) to game screen
		SyringeA = new Syringe("full", "A");
		SyringeA.x = 400;
		SyringeA.y = 600;
		SyringeA.addEventListener(MouseEvent.CLICK, PostChoiceA);
		game_screen.addChild(SyringeA);
		
		SyringeB = new Syringe("full", "B");
		SyringeB.x = 1200;
		SyringeB.y = 600;
		SyringeB.addEventListener(MouseEvent.CLICK, PostChoiceB);
		game_screen.addChild(SyringeB);
	

		/*// Draw slot machines on screen
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
		this.addChild(circle_selection);*/
		
		// Draw score text field
		var scoreFormat:TextFormat = new TextFormat("Verdana", 30, 0x000000, true);
		scoreFormat.align = TextFormatAlign.LEFT;
		
		scoreField = new TextField();
		scoreField.width = 600;
		scoreField.y = NOMINAL_HEIGHT / 60;
		scoreField.defaultTextFormat = scoreFormat;
		scoreField.selectable = false;		
		game_screen.addChild(scoreField);
		
		//_score = 1;
		scoreField.text = 'Score: $_score';
		
		/*// Draw city text field	
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
		cityField.text = '$cityName';*/

		levelFormat = new TextFormat("Verdana", 30, 0x000000, true);
		levelFormat.align = TextFormatAlign.LEFT;
		
		levelField = new TextField();
		levelField.width = 600;
		levelField.y = NOMINAL_HEIGHT / 20;
		levelField.defaultTextFormat = levelFormat;
		levelField.selectable = false;
		levelField.text = 'Runde: $_trial_ind von $trials';	
		game_screen.addChild(levelField);


		// Define and format text fields displaying drug outcome
		// A
		var scoreFormat_notepads:TextFormat = new TextFormat("Verdana", 50, 0x000000, true);
		scoreFormat_notepads.align = TextFormatAlign.CENTER;

		scoreField_A = new TextField();
		game_screen.addChild(scoreField_A);
		scoreField_A.width = 200;
		scoreField_A.x = 475;
		scoreField_A.y = 400;
		//scoreField_A.x = Std.int(NOMINAL_WIDTH / 2) - Std.int(NOMINAL_WIDTH / 6);
		//scoreField_A.y = Std.int(NOMINAL_HEIGHT / 2);
		scoreField_A.defaultTextFormat = scoreFormat_notepads;
		scoreField_A.selectable = false;

		// B
		scoreField_B = new TextField();
		game_screen.addChild(scoreField_B);
		scoreField_B.width = 200;
		scoreField_B.x = 1275;
		scoreField_B.y = 400;
		//scoreField_B.x = Std.int(NOMINAL_WIDTH / 2) + Std.int(NOMINAL_WIDTH / 6);
		//scoreField_B.y = Std.int(NOMINAL_HEIGHT / 2);
		scoreField_B.defaultTextFormat = scoreFormat_notepads;
		scoreField_B.selectable = false;
		
		//Initialise probabilities using a gaussian random walk
		probA = generateRandomWalk();
							
		inftext = new InfoText("Bitte erfüllen Sie die Aufgabe gewissenhaft.");
		var inftext_button = inftext.getChildAt(1);
		inftext_button.addEventListener(MouseEvent.CLICK, toggleMessage);
		//inftext.addChild(textfield_button);
		//game_screen.addChild(inftext);
		
		// Generate properties for new trial
		newRound();
	}
	
	
	public function toggleMessage(event: MouseEvent):Void {
		
		game_screen.removeChild(inftext);
		
	}
	
	// handle mouse events from users choice 
	public function PostChoiceA(event: MouseEvent):Void {
		
		// set to empty syringe
		game_screen.removeChild(SyringeA);
		SyringeA = new Syringe("empty", "A");
		SyringeA.x = 400;
		SyringeA.y = 600;
		game_screen.addChild(SyringeA);
		// determine if choice was correct
		endRound("A");
		
	}
	
	public function PostChoiceB(event: MouseEvent):Void {
		
		// set to empty syringe
		game_screen.removeChild(SyringeB);
		SyringeB = new Syringe("empty", "B");
		SyringeB.x = 1200;
		SyringeB.y = 600;
		game_screen.addChild(SyringeB);
		// determine if choice was correct
		endRound("B");
		
	}


	// evaluate the outcome of the trial
	private function endRound(drug_choice:String):Void {
		
		// Get winning machine
		prob_draw = random();
		
		// Evaluate winning machine and set output accordingly
		if (prob_draw <= reward_prob_A) {
			correct_choice = 'A';
			/*this.removeChild(circle_selection);
			circle_selection = new Selection_Circle(0x0066cc);
			circle_selection.x = Std.int(NOMINAL_WIDTH / 2);
			circle_selection.y = Std.int(NOMINAL_HEIGHT / 2);
			this.addChild(circle_selection);
			trace('$_score');*/
			
			// If the winning option was selected add reward to score and update score field
			if (drug_choice == 'A') {
				
				_score = Std.int(_score + A_reward);
				scoreField.text = 'Score: $_score';
				img_feedback_correct.x = 525;
				img_feedback_correct.y = 475;
				game_screen.addChild(img_feedback_correct);
				
			}
			
			// If the non-winning option was selected subtract reward from score and update score field
			else if (drug_choice == 'B') {
				
				_score = Std.int(_score - A_reward);
				scoreField.text = 'Score: $_score';
				img_feedback_wrong.x = 1325;
				img_feedback_wrong.y = 475;
				game_screen.addChild(img_feedback_wrong);
				
			}
			
		
		} else {
			correct_choice = 'B';
			/*this.removeChild(circle_selection);
			circle_selection = new Selection_Circle(0x1f7c0a);
			circle_selection.x = Std.int(NOMINAL_WIDTH / 2);
			circle_selection.y = Std.int(NOMINAL_HEIGHT / 2);
			this.addChild(circle_selection);
			trace('$_score');*/
						
			// If the winning option was selected add reward to score and update score field
			if (drug_choice == 'B') {
				
				_score = _score + B_reward;
				scoreField.text = 'Score: $_score';
				img_feedback_correct.x = 1325;
				img_feedback_correct.y = 475;
				game_screen.addChild(img_feedback_correct);
				
			}
			
			// If the non-winning option was selected subtract reward from score and update score field
			else if (drug_choice == 'A') {
				
				_score = _score - B_reward;
				scoreField.text = 'Score: $_score';
				img_feedback_wrong.x = 525;
				img_feedback_wrong.y = 475;
				game_screen.addChild(img_feedback_wrong);
				
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
			haxe.Timer.delay(MainGame,500);
			
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
			// set up new probabilities for option A by first clearing the array and writing new values to it
			untyped probA.length = 0;
			probA = generateRandomWalk();
			// save new run info locally
			AppdataJSON.AppdataSave();
			// call function for questionnaire items
			
			// save run related info in the database, currently deactivated as not all run entries are available
			//AppdataEntryLite.writeLiteRunEntry();
			// call function newRound with delay of 300 ms
			haxe.Timer.delay(MainGame,500);
		}
		
	}
	
	
	// set up properties for new trial
	private function newRound():Void {
		
		// Adapt trial counter
		_trial_ind = _trial_ind + 1;
		levelField.text = 'Runde: $_trial_ind von $trials';
		
		// Set up new rewards
		A_reward = Math.round(NormRandom.floatNormal(50, 16));
		
		if (A_reward > 99) {
			
			A_reward = 99;
			
		} else if (A_reward < 1) {
			
			A_reward = 1;
			
		}
		
		
		B_reward = 100 - A_reward;
		scoreField_A.text = '$A_reward %';
		scoreField_B.text = '$B_reward %';
		
		// Grab new reward probabilities
		reward_prob_A = probA[_trial_ind-1];
		reward_prob_B = 1 - reward_prob_A;
		
		// Reset selection circle
		/*this.removeChild(circle_selection);
		circle_selection = new Selection_Circle(0xc7ccd6);
		circle_selection.x = Std.int(NOMINAL_WIDTH / 2);
		circle_selection.y = Std.int(NOMINAL_HEIGHT / 2);
		this.addChild(circle_selection);
		
		// Remove any selection frames
		this.removeChild(frame_choice);*/
		
		// Set new values for database
		_p_reward_A = reward_prob_A;
		_p_reward_B = reward_prob_B;
		_reward_A = A_reward;
		_reward_B = B_reward;
		
		// Draw new game screen
		this.addChild(game_screen);
		
		// Resume game
		//everyframe always active when currentGameState=Playing
		//->goes to everyFrame
		currentGameState = Playing;
		
	}
//%%%%%%%%%%%% GAME %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

}
