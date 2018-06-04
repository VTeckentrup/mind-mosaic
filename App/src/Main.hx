package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import haxe.ui.core.UIEvent;
import openfl.text.TextField;
import haxe.ui.components.OptionBox;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;
import openfl.text.TextFieldType;
import openfl.system.Capabilities;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import openfl.display.SimpleButton;
import openfl.events.MouseEvent;
import Math.random;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import sys.FileSystem;
import haxe.io.Path;
import haxe.ui.Toolkit;
import haxe.ui.core.Screen;
import haxe.ui.components.CheckBox;
import haxe.ui.components.HSlider;

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
	
	// questionnaire item text field
	private var item_text:TextField;
	private var item_counter:Int;

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
	private var button_quest:SimpleButton;


	private var change:Bool = false;
	private var clicked_button:SimpleButton;
    private var click_button:Bool = false;

	private var mailaddress:TextField;
	private var selectedpw:TextField;

	//represents the level you are in- just for presentation
	//purpose - needs to be drawn from sheet
	//private var level:Int=1;
	//represents an array (length 30) with all pathogens
	private var add:Int;
	
	// Setup background graphic
	private var background_bd:BitmapData;
	private var background_b:Bitmap;
	
	private var inftext:InfoText;
	
	
	public var timestamp_unfocus:Int = 0;
	public var timestamp_refocus:Int = 0;
	
	//radio buttons
	private var yes_rb:OptionBox;
	private var no_rb:OptionBox;
	
	private var Likert_1_rb:OptionBox;
	private var Likert_2_rb:OptionBox;
	private var Likert_3_rb:OptionBox;
	private var Likert_4_rb:OptionBox;
	private var Likert_5_rb:OptionBox;
	private var Likert_6_rb:OptionBox;
	
	// database
	private var modification_start:Float;

	
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}


//%%%%%%%%%%BUTTONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	//onClick functions for the multiple buttons
	
	/**
	 * In gallery when you click continue game -> leads you to levelscreen 
	 */
	public function onClick_cont(event: MouseEvent):Void{
		DrawLevelscreen();
	}

	//DATENBANK ABSPEICHERN
	//Button: New Game - Button1
	/*public function onClick1 (event: MouseEvent):Void {
		//menu_screen.removeChildren();
		this.removeChildren();
		//MainGame();
		drawQuestionnaireScreen("scale");
	}*/
	//Instruction - Button2
	public function onClick2 (event: MouseEvent):Void {
		this.removeChildren();

		level_screen = new Sprite();
		level_screen.addChild(img_alternative_screen2);
		this.addChild(level_screen);
		var instructive_text = new Instruction();
		//var instructive_text = new Instruction();
		this.addChild(instructive_text);
		//var instruction_text = new InfoText("");
		//this.addChild(instruction_text);

		// add button to info textfield
		var ww = NOMINAL_WIDTH / 3;
		var textfield_button:SimpleButton = Button.drawButton("Zurück", NOMINAL_WIDTH / 2, ((1080 - ww) / 2) + ww + 175, "info");
		textfield_button.addEventListener(MouseEvent.CLICK, onClick_back);
        addChild(textfield_button);

		var playgame_button:SimpleButton = Button.drawButton("Spielen", NOMINAL_WIDTH / 2, ((1080 - ww) / 2) + ww + 75, "info");
		playgame_button.addEventListener(MouseEvent.CLICK, onClick_cont);
        addChild(playgame_button);
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
		Lib.current.stage.removeChild(circle_selection);
		this.removeChildren();
		drawMenuScreen();
	}
	
	//Registration Button event - button_reg
	// Query database for registration process
	public function onClick_Reg (event: MouseEvent):Void {
		
		// Check if consent was given through checkbox
		
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
								this.removeChildren();
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
		Screen.instance.removeComponent(vbox_container);
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


	public function onClick_MainGame(event: MouseEvent):Void {
		/*When you want to continue your game, you first see the gallerie of obtained rewards,
		then the level you're in, then the current reward with short introduction, then the questionaires &
		then the Main Game starts
		*/
		this.removeChildren();
		DrawLevelscreen();
		//MainGame();

	}
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	//%%%%%%%% REGISTRATION & LOGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
		login_screen.addChild(input_background);

		username = new TextField();
		username.background = true;
		username.width = 200;
		username.height = 50;
		username.x = 300;
		username.y = 210;
		var name:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 20, 0xbbbbbb, true);
		//Text is centered
		name.align = TextFormatAlign.LEFT;
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
		var passw_format:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 20, 0xbbbbbb, true);
		passw_format.align = TextFormatAlign.LEFT;
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
		registration_screen.addChild(input_background);
		
		//Register with mail address
		var name2:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0x000000, true);
		name2.align = TextFormatAlign.LEFT;
		
		var infoformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0x000000, true);
		infoformat.align = TextFormatAlign.LEFT;
		
		var mailaddress_info = new TextField();
		mailaddress_info.background = false;
		mailaddress_info.width = 900;
		mailaddress_info.height = 80;
		mailaddress_info.x = (NOMINAL_WIDTH - mailaddress_info.width) / 2;
		mailaddress_info.y = 120;
		mailaddress_info.text = "E-Mail:";
		mailaddress_info.defaultTextFormat = infoformat;
		registration_screen.addChild(mailaddress_info);		
		
		mailaddress = new TextField();
		mailaddress.background = true;
		mailaddress.width = 900;
		mailaddress.height = 60;
		mailaddress.x = (NOMINAL_WIDTH - mailaddress.width) / 2;
		mailaddress.y = 200;			
		mailaddress.defaultTextFormat = name2;
		mailaddress.restrict = "0-9A-Za-z@._/-";
		mailaddress.type = TextFieldType.INPUT;
		mailaddress.needsSoftKeyboard = true;
		mailaddress.requestSoftKeyboard();
		registration_screen.addChild(mailaddress);


		//selection of password
		selectedpw = new TextField();
		selectedpw.background = true;
		selectedpw.width = 900;
		selectedpw.height = 60;
		selectedpw.x = (NOMINAL_WIDTH - selectedpw.width) / 2;
		selectedpw.y = 400;
		selectedpw.text = "Passwort";
		selectedpw.defaultTextFormat = name2;
		selectedpw.restrict = null;
		selectedpw.type = TextFieldType.INPUT;
		selectedpw.needsSoftKeyboard = true;
		selectedpw.requestSoftKeyboard();
		registration_screen.addChild(selectedpw);
		
		vbox_container = new VBox();
		vbox_container.x = stageScaleX*470;
		vbox_container.y = stageScaleY*470;
				
		var reg_checkbox_consent = new CheckBox();
		reg_checkbox_consent.id = "consent_cb";
		reg_checkbox_consent.selected = false;
		reg_checkbox_consent.text = "Ich bin damit einverstanden, an der Studie teilzunehmen.";
		
		var reg_checkbox_contact = new CheckBox();
		reg_checkbox_contact.id = "contact_cb";
		reg_checkbox_contact.selected = false;
		reg_checkbox_contact.text = "Ich bin damit einverstanden, für weitere Studien über meine Emailadresse kontaktiert zu werden.";
		
		vbox_container.addComponent(reg_checkbox_consent);
		vbox_container.addComponent(reg_checkbox_contact);
		
		Screen.instance.addComponent(vbox_container);
		

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
        button1 = Button.drawButton("Spielen",NOMINAL_WIDTH / 2, 200, "menu");
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

	
		button1.addEventListener(MouseEvent.CLICK, onClick_MainGame);
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
	public function drawQuestionnaireScreen(type:String){
		
		// remove old content
		this.removeChildren();
		
		// set up questionnaire items according to answer format
		if (type == "scale") {
		
			questionnaire_screen = new Sprite();
			
			// item text
			var itemFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
			itemFormat.align = TextFormatAlign.CENTER;
			
			item_text = new TextField();
			item_text.width = 1920;
			item_text.height = 200;
			item_text.y = 200;
			item_text.x = 0;
			item_text.defaultTextFormat = itemFormat;
			item_text.text = questionnaire_items[item_counter];
			item_text.multiline = true;
			questionnaire_screen.addChild(item_text);
			
			// UI elements
			box_container = new HBox();
			box_container.x = stageScaleX*550;
			box_container.y = stageScaleY*550;
			
			var rbFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0xFFFFFF, true);
			rbFormat.align = TextFormatAlign.LEFT;
			
			var anchor_left = new TextField();
			anchor_left.width = 200;
			anchor_left.height = 200;
			anchor_left.y = 570;
			anchor_left.x = 250;
			anchor_left.defaultTextFormat = rbFormat;
			anchor_left.text = "gar nicht";
			questionnaire_screen.addChild(anchor_left);
			
			var anchor_right = new TextField();
			anchor_right.width = 200;
			anchor_right.height = 200;
			anchor_right.y = 570;
			anchor_right.x = 1500;
			anchor_right.defaultTextFormat = rbFormat;
			anchor_right.text = "sehr";
			questionnaire_screen.addChild(anchor_right);
			
			quest_slider = new HSlider();
			quest_slider.resizeComponent(stageScale*800, stageScale*100);
			quest_slider.max = 100;
			quest_slider.min = 0;
			
			quest_slider.registerEvent(UIEvent.CHANGE,activateButton);
			//quest_slider.addEventListener(MouseEvent.CLICK, activateButton);
			// Implement separate event setup: Slider change event attached to slider to prevent ghost moving without event fired to activate the button
			
			box_container.addComponent(quest_slider);
			
			Screen.instance.addComponent(box_container);
			
			// Forward button
			button_quest = Button.drawButton("OK", NOMINAL_WIDTH / 2, 950, "info");
			button_quest.visible = false;
			
			button_quest.addEventListener(MouseEvent.CLICK, QuestPagefinished);
			questionnaire_screen.addChild(button_quest);
			
			this.addChild(questionnaire_screen);
			
		}
		
		else if (type == "Likert") {
			
			questionnaire_screen = new Sprite();
			
			// item text
			var itemFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
			itemFormat.align = TextFormatAlign.CENTER;
			
			item_text = new TextField();
			item_text.width = 1920;
			item_text.height = 200;
			item_text.y = 200;
			item_text.x = 0;
			item_text.defaultTextFormat = itemFormat;
			item_text.text = questionnaire_items[item_counter];
			item_text.multiline = true;
			questionnaire_screen.addChild(item_text);
			
			// UI elements
			box_container = new HBox();
			box_container.x = stageScaleX*50;
			box_container.y = stageScaleY * 570;
			
			var rbFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0xFFFFFF, true);
			rbFormat.align = TextFormatAlign.LEFT;
			
			var rb_Likert_Text_1 = new TextField();
			rb_Likert_Text_1.width = 300;
			rb_Likert_Text_1.height = 200;
			rb_Likert_Text_1.y = 565;
			rb_Likert_Text_1.x = 100;
			rb_Likert_Text_1.defaultTextFormat = rbFormat;
			rb_Likert_Text_1.text = "Vor mehr\nals 3h";
			questionnaire_screen.addChild(rb_Likert_Text_1);
						
			var rb_Likert_Text_2 = new TextField();
			rb_Likert_Text_2.width = 300;
			rb_Likert_Text_2.height = 200;
			rb_Likert_Text_2.y = 565;
			rb_Likert_Text_2.x = 400;
			rb_Likert_Text_2.defaultTextFormat = rbFormat;
			rb_Likert_Text_2.text = "Vor etwa\n2,5h";
			questionnaire_screen.addChild(rb_Likert_Text_2);
			
			var rb_Likert_Text_3 = new TextField();
			rb_Likert_Text_3.width = 300;
			rb_Likert_Text_3.height = 200;
			rb_Likert_Text_3.y = 565;
			rb_Likert_Text_3.x = 700;
			rb_Likert_Text_3.defaultTextFormat = rbFormat;
			rb_Likert_Text_3.text = "Vor etwa\n2h";
			questionnaire_screen.addChild(rb_Likert_Text_3);
			
			var rb_Likert_Text_4 = new TextField();
			rb_Likert_Text_4.width = 300;
			rb_Likert_Text_4.height = 200;
			rb_Likert_Text_4.y = 565;
			rb_Likert_Text_4.x = 1000;
			rb_Likert_Text_4.defaultTextFormat = rbFormat;
			rb_Likert_Text_4.text = "Vor etwa\n1,5h";
			questionnaire_screen.addChild(rb_Likert_Text_4);
			
			var rb_Likert_Text_5 = new TextField();
			rb_Likert_Text_5.width = 300;
			rb_Likert_Text_5.height = 200;
			rb_Likert_Text_5.y = 565;
			rb_Likert_Text_5.x = 1300;
			rb_Likert_Text_5.defaultTextFormat = rbFormat;
			rb_Likert_Text_5.text = "Vor etwa\n1h";
			questionnaire_screen.addChild(rb_Likert_Text_5);
			
			var rb_Likert_Text_6 = new TextField();
			rb_Likert_Text_6.width = 300;
			rb_Likert_Text_6.height = 200;
			rb_Likert_Text_6.y = 565;
			rb_Likert_Text_6.x = 1600;
			rb_Likert_Text_6.defaultTextFormat = rbFormat;
			rb_Likert_Text_6.text = "Vor weniger\nals 0,5h";
			questionnaire_screen.addChild(rb_Likert_Text_6);
			
			Likert_1_rb = new OptionBox();
			Likert_1_rb.groupName = "LikertRBs";
			Likert_1_rb.height = stageScaleY*80;
			Likert_1_rb.width = stageScaleX * 295;
			
			Likert_2_rb = new OptionBox();
			Likert_2_rb.groupName = "LikertRBs";
			Likert_2_rb.height = stageScaleY*80;
			Likert_2_rb.width = stageScaleX * 295;
			
			Likert_3_rb = new OptionBox();
			Likert_3_rb.groupName = "LikertRBs";
			Likert_3_rb.height = stageScaleY*80;
			Likert_3_rb.width = stageScaleX * 295;
			
			Likert_4_rb = new OptionBox();
			Likert_4_rb.groupName = "LikertRBs";
			Likert_4_rb.height = stageScaleY*80;
			Likert_4_rb.width = stageScaleX * 295;
			
			Likert_5_rb = new OptionBox();
			Likert_5_rb.groupName = "LikertRBs";
			Likert_5_rb.height = stageScaleY*80;
			Likert_5_rb.width = stageScaleX * 295;
			
			Likert_6_rb = new OptionBox();
			Likert_6_rb.groupName = "LikertRBs";
			Likert_6_rb.height = stageScaleY*80;
			Likert_6_rb.width = stageScaleX * 295;
			
			/*Likert_1_rb.registerEvent(UIEvent.CHANGE, activateButton);
			Likert_2_rb.registerEvent(UIEvent.CHANGE, activateButton);
			Likert_3_rb.registerEvent(UIEvent.CHANGE, activateButton);
			Likert_4_rb.registerEvent(UIEvent.CHANGE, activateButton);
			Likert_5_rb.registerEvent(UIEvent.CHANGE, activateButton);
			Likert_6_rb.registerEvent(UIEvent.CHANGE, activateButton);*/
			box_container.addEventListener(MouseEvent.CLICK, activateButtonClick);
			
			box_container.addComponent(Likert_1_rb);
			box_container.addComponent(Likert_2_rb);
			box_container.addComponent(Likert_3_rb);
			box_container.addComponent(Likert_4_rb);
			box_container.addComponent(Likert_5_rb);
			box_container.addComponent(Likert_6_rb);
			
			Screen.instance.addComponent(box_container);
			
			// Forward button
			button_quest = Button.drawButton("OK", NOMINAL_WIDTH / 2, 950, "info");
			button_quest.visible = false;
			
			button_quest.addEventListener(MouseEvent.CLICK, QuestPagefinished);
			
			questionnaire_screen.addChild(button_quest);
			
			this.addChild(questionnaire_screen);
			
		}
		
		else if (type == "options") {
			
			questionnaire_screen = new Sprite();
			
			// item text
			var itemFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
			itemFormat.align = TextFormatAlign.CENTER;
			
			item_text = new TextField();
			item_text.width = 1920;
			item_text.height = 200;
			item_text.y = 200;
			item_text.x = 0;
			item_text.defaultTextFormat = itemFormat;
			item_text.text = questionnaire_items[item_counter];
			item_text.multiline = true;
			questionnaire_screen.addChild(item_text);
			
			// UI elements
			box_container = new HBox();
			box_container.x = stageScaleX*690;
			box_container.y = stageScaleY*570;
			
			var rbFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0xFFFFFF, true);
			rbFormat.align = TextFormatAlign.LEFT;
			
			var rb_text_yes = new TextField();
			rb_text_yes.width = 200;
			rb_text_yes.height = 200;
			rb_text_yes.y = 565;
			rb_text_yes.x = 750;
			rb_text_yes.defaultTextFormat = rbFormat;
			rb_text_yes.text = "Ja";
			questionnaire_screen.addChild(rb_text_yes);
			
			var rb_text_no = new TextField();
			rb_text_no.width = 200;
			rb_text_no.height = 200;
			rb_text_no.y = 565;
			rb_text_no.x = 1170;
			rb_text_no.defaultTextFormat = rbFormat;
			rb_text_no.text = "Nein";
			questionnaire_screen.addChild(rb_text_no);
			
			yes_rb = new OptionBox();
			yes_rb.groupName = "questRBs";
			yes_rb.height = stageScaleY*50;
			yes_rb.width = stageScaleX*420;
			
			no_rb = new OptionBox();
			no_rb.groupName = "questRBs";
			no_rb.height = stageScaleY*50;
			no_rb.width = stageScaleX*420;
			
			/*yes_rb.registerEvent(UIEvent.CHANGE, activateButton);
			no_rb.registerEvent(UIEvent.CHANGE, activateButton);*/
			
			box_container.addEventListener(MouseEvent.CLICK, activateButtonClick);
			
			box_container.addComponent(yes_rb);
			box_container.addComponent(no_rb);
			
			Screen.instance.addComponent(box_container);
			
			// Forward button
			button_quest = Button.drawButton("OK", NOMINAL_WIDTH / 2, 950, "info");
			button_quest.visible = false;
			
			button_quest.addEventListener(MouseEvent.CLICK, QuestPagefinished);
			
			questionnaire_screen.addChild(button_quest);
			
			this.addChild(questionnaire_screen);
			
		}
		
		
		
	}
	
	// activate the forward button after player has interacted with the slider
	public function activateButtonClick(event: MouseEvent):Void {
		button_quest.visible = true;
	}
	
	public function activateButton(event: UIEvent):Void {
		button_quest.visible = true;
	}
	
	// refresh the screen with the next questionnaire item or go on to main game
	public function QuestPagefinished(event: MouseEvent):Void {
		
		// write out value from questionnaire item
		if (item_counter == 1) {
			_item_1 = quest_slider.value;
			trace(_item_1);
		} else if (item_counter == 2) {
			_item_2 = quest_slider.value;
		} else if (item_counter == 3) {
			_item_3 = quest_slider.value;
		} else if (item_counter == 4) {
			// check which radiobutton is activated
			if (Likert_1_rb.selected == true){
				_item_4 = 1;
			} else if (Likert_2_rb.selected == true){
				_item_4 = 2;
			} else if (Likert_3_rb.selected == true){
				_item_4 = 3;
			} else if (Likert_4_rb.selected == true){
				_item_4 = 4;
			} else if (Likert_5_rb.selected == true){
				_item_4 = 5;
			} else if (Likert_6_rb.selected == true){
				_item_4 = 6;
			}
		} else if (item_counter == 5) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_5 = 1;
			} else if (no_rb.selected == true){
				_item_5 = 0;
			}		
		} else if (item_counter == 6) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_6 = 1;
			} else if (no_rb.selected == true){
				_item_6 = 0;
			}
		} else if (item_counter == 7) {
			_item_7 = quest_slider.value;
		} else if (item_counter == 8) {
			_item_8 = quest_slider.value;
		} else if (item_counter == 9) {
			_item_9 = quest_slider.value;
		} else if (item_counter == 10) {
			_item_10 = quest_slider.value;
		} else if (item_counter == 11) {
			_item_11 = quest_slider.value;
		} else if (item_counter == 12) {
			_item_12 = quest_slider.value;
		} else if (item_counter == 13) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_13 = 1;
			} else if (no_rb.selected == true){
				_item_13 = 0;
			}
		}
		
		// remove old content
		Screen.instance.removeComponent(box_container);
		this.removeChildren();
		
		
		
		if (item_counter <= 12) {
			item_counter = item_counter + 1;
			
			if (item_counter == 4) {
				drawQuestionnaireScreen("Likert");
			}
			else if (item_counter == 5 || item_counter == 6 || item_counter == 13) {
				drawQuestionnaireScreen("options");
			} else {
				drawQuestionnaireScreen("scale");
			}
		} else {
			item_counter = 1;
			MainGame();
		}
		
		
		
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
		var delta = timestamp_refocus - timestamp_unfocus;
		
		if (delta >= 1) {
		
			// Set round index to 0 as it will be increased to 1 in the newRound function 
			_trial_ind = 0;
			
			// remove circle from screen
			Lib.current.stage.removeChild(circle_selection);
			
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


	//Gallery
	public function drawGallery(){
		
		// Set up screen for gallery
		gallery_screen = new Sprite();
		gallery_screen.addChild(img_gallery_background);
		
		// Add globalscore
		var globalscore_display = new TextField();
		globalscore_display.background = false;
		globalscore_display.width = 1920;
		globalscore_display.height = 200;
		globalscore_display.x = 0;
		globalscore_display.y = 50;
		globalscore_display.text = 'Gesamtscore: $_global_score';

		var globalscore_text:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
		globalscore_text.align = TextFormatAlign.CENTER;
		
		globalscore_display.defaultTextFormat = globalscore_text;
		
		gallery_screen.addChild(globalscore_display);		
		
		// Add button to get back to main menu
		button_end = Button.drawButton("Zurück", Std.int(NOMINAL_WIDTH -150),100, "back");
		button_end.addEventListener(MouseEvent.CLICK, onClick_end);
		gallery_screen.addChild(button_end);

		var button_continue = Button.drawButton("Spielen", Std.int(NOMINAL_WIDTH/2), 1000, "info");
		button_continue.addEventListener(MouseEvent.CLICK, onClick_cont);
		gallery_screen.addChild(button_continue);
		
		

		
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


//%%%%%%%%%% Functions preceeding MainGame %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
	
	/*
	*draws Level screen when you continue playing
	*/
	function DrawLevelscreen(){

		this.removeChildren();
		level_screen = new Sprite();
		//new background for showing level
		level_screen.addChild(img_alternative_screen2);
		this.addChild(level_screen);
		
		var level_display = new TextField();
		level_display.background = false;
		level_display.width = 600;
		level_display.height = 200;
		level_display.x = (NOMINAL_WIDTH/2)-300;
		level_display.y = (NOMINAL_HEIGHT/2)-100;
		level_display.selectable = false;

		var level_text:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 70, 0x000000, true);
		level_text.align = TextFormatAlign.CENTER;
		level_display.text = 'Level $_run_ind';
		level_screen.addChild(level_display);
		
		level_display.defaultTextFormat = level_text;

		haxe.Timer.delay(pathogenText,2000);

	}
	//insert pathogen information to display but only if 
	function pathogenText(){
		this.removeChildren();
		haxe.Timer.delay(function() {drawQuestionnaireScreen("scale");},1000);
	}
	// you need this function because in the Timer.delay the inserted
	//function need to be void but drawQuestionnaireScreen is not void
	//function afterPathogen(){
	//	drawQuestionnaireScreen("scale");
	//}
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
				/*var transaction_finished = DatabaseSync.DBSync();
				
				if (transaction_finished == true){
					var database_name_trial = "./" + _id + "_app_data_trial.db";					
					if (FileSystem.exists(Path.join([database_path, database_name_trial]))) {
						FileSystem.deleteFile(Path.join([database_path, database_name_trial]));
					}
					
					var database_name_run = "./" + _id + "_app_data_run.db";
					if (FileSystem.exists(Path.join([database_path, database_name_run]))) {
						FileSystem.deleteFile(Path.join([database_path, database_name_run]));
					}
				}*/
			}
			
		});
		
		// Prepare assets
		AssetPreparation.getQuestionnaireItems();
		AssetPreparation.getPathogens();
		AssetPreparation.getBackgrounds();
		AssetPreparation.getNotepads();
		AssetPreparation.getSyringes();
		AssetPreparation.getCircleColors();
		
		
		// Initialize HaxeUI toolkit
		Toolkit.init();
		
		// Set initial values
		// Set round index to 0 as it will be increased to 1 in the newRound function
		_trial_ind = 0;
		// Initialize score
		_score = 0;
		// Initialize run finished marker
		_run_finished = 0;
		// Initialize questionnaire item counter
		item_counter = 1;
			
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
        onResize(null);
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
		
		
		// Draw score text field
		var scoreFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 30, 0x000000, true);
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
		var cityFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 30, 0xbbbbbb, true);
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

		levelFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 30, 0x000000, true);
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
		var scoreFormat_notepads:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0x000000, true);
		scoreFormat_notepads.align = TextFormatAlign.CENTER;

		scoreField_A = new TextField();
		game_screen.addChild(scoreField_A);
		scoreField_A.width = 200;
		scoreField_A.height = 200;
		scoreField_A.x = 475;
		scoreField_A.y = 400;
		scoreField_A.multiline = true;
		//scoreField_A.x = Std.int(NOMINAL_WIDTH / 2) - Std.int(NOMINAL_WIDTH / 6);
		//scoreField_A.y = Std.int(NOMINAL_HEIGHT / 2);
		scoreField_A.defaultTextFormat = scoreFormat_notepads;
		scoreField_A.selectable = false;

		// B
		scoreField_B = new TextField();
		game_screen.addChild(scoreField_B);
		scoreField_B.width = 200;
		scoreField_B.height = 200;
		scoreField_B.x = 1275;
		scoreField_B.y = 400;
		scoreField_B.multiline = true;
		//scoreField_B.x = Std.int(NOMINAL_WIDTH / 2) + Std.int(NOMINAL_WIDTH / 6);
		//scoreField_B.y = Std.int(NOMINAL_HEIGHT / 2);
		scoreField_B.defaultTextFormat = scoreFormat_notepads;
		scoreField_B.selectable = false;
		
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
		
		// draw color circle indicating winning color of last round
		if (_trial_ind != 0) {
			if (_drawn_outcome == 'A'){
				Lib.current.stage.removeChild(circle_selection);
				circle_selection = new Selection_Circle(circle_colors_A[_run_ind]);
				circle_selection.x = stageScaleX*Std.int(NOMINAL_WIDTH / 2);
				circle_selection.y = stageScaleY*Std.int(NOMINAL_HEIGHT / 2);
				Lib.current.stage.addChild(circle_selection);
			} else {
				Lib.current.stage.removeChild(circle_selection);
				circle_selection = new Selection_Circle(circle_colors_B[_run_ind]);
				circle_selection.x = stageScaleX*Std.int(NOMINAL_WIDTH / 2);
				circle_selection.y = stageScaleY*Std.int(NOMINAL_HEIGHT / 2);
				Lib.current.stage.addChild(circle_selection);
			}
		}
		
		//Initialise probabilities using a gaussian random walk
		probA = generateRandomWalk();
							
		// Generate properties for new trial
		newRound();
	}

	
	// handle mouse events from users choice 
	public function PostChoiceA(event: MouseEvent):Void {
		
		// set to empty syringe
		game_screen.removeChild(SyringeA);
		SyringeA = new Syringe("empty", "A");
		SyringeA.x = 400;
		SyringeA.y = 600;
		game_screen.addChild(SyringeA);
				
		// Shortly change circle color to grey to make evaluation visible
		Lib.current.stage.removeChild(circle_selection);
		circle_selection = new Selection_Circle(0xbdbdbd);
		circle_selection.x = stageScaleX*Std.int(NOMINAL_WIDTH / 2);
		circle_selection.y = stageScaleY*Std.int(NOMINAL_HEIGHT / 2);
		Lib.current.stage.addChild(circle_selection);
		
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
				
		// Shortly change circle color to grey to make evaluation visible
		Lib.current.stage.removeChild(circle_selection);
		circle_selection = new Selection_Circle(0xbdbdbd);
		circle_selection.x = stageScaleX*Std.int(NOMINAL_WIDTH / 2);
		circle_selection.y = stageScaleY*Std.int(NOMINAL_HEIGHT / 2);
		Lib.current.stage.addChild(circle_selection);
		
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
						
			/*//this.removeChild(circle_selection);
			Lib.current.stage.removeChild(circle_selection);
			circle_selection = new Selection_Circle(circle_colors_A[_run_ind]);
			circle_selection.x = stageScaleX*Std.int(NOMINAL_WIDTH / 2);
			circle_selection.y = stageScaleY*Std.int(NOMINAL_HEIGHT / 2);
			Lib.current.stage.addChild(circle_selection);
			//this.addChild(circle_selection);*/
			
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
			
			/*//this.removeChild(circle_selection);
			Lib.current.stage.removeChild(circle_selection);
			circle_selection = new Selection_Circle(circle_colors_B[_run_ind]);
			circle_selection.x = stageScaleX*Std.int(NOMINAL_WIDTH / 2);
			circle_selection.y = stageScaleY*Std.int(NOMINAL_HEIGHT / 2);
			//this.addChild(circle_selection);
			Lib.current.stage.addChild(circle_selection);*/
						
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
		
		// Second precision
		//_timestamp = Date.now();
		// Milisecond precision
		_timestamp = Sys.time() * 1000.0;
		
		// Save timestamp value of first trial to later modify the run_finished column
		if (_trial_ind == 1){
			modification_start = _timestamp;
		}

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
			
			// Call entry field for questionnaire code
			if (_run_ind == 9) {
				
				
			
				
			} 
			
			// Call new level
			else {
			
				// modify run_finished entry as run is now finalized
				AppdataEntryLite.modifyLiteTrialEntry(modification_start);
				// update global score
				_global_score = _global_score + _score;
				// save run related info in the database
				AppdataEntryLite.writeLiteRunEntry();
				// increase run index by 1
				_run_ind = _run_ind + 1;
				// restart score for new run
				_score = 0;
				// set trial index to 0 as it will be increased to 1 in the newRound function
				_trial_ind = 0;
				// prepare new probabilities for option A by clearing the array (new values will be generated in MainGame()
				untyped probA.length = 0;
				// save new run info locally
				AppdataJSON.AppdataSave();
				// remove circle from stage
				Lib.current.stage.removeChild(circle_selection);
				// remove old game screen
				this.removeChild(game_screen);
				// start new level by calling level screen 
				haxe.Timer.delay(function() {DrawLevelscreen(); }, 500);
				
			}
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
		scoreField_A.text = '$A_reward';
		scoreField_B.text = '$B_reward';
		
		// Grab new reward probabilities
		reward_prob_A = probA[_trial_ind-1];
		reward_prob_B = 1 - reward_prob_A;
		
		// Reset selection circle
		/*this.removeChild(circle_selection);
		circle_selection = new Selection_Circle(0xc7ccd6);
		circle_selection.x = Std.int(NOMINAL_WIDTH / 2);
		circle_selection.y = Std.int(NOMINAL_HEIGHT / 2);
		this.addChild(circle_selection);*/
		
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
