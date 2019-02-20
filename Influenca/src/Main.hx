package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import haxe.ui.core.UIEvent;
import openfl.display.DisplayObject;
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
import motion.Actuate;

enum GameState {
	
	Playing;
	Menu;
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

	// Definition of game screen graphic elements
	private var NotepadA:NotepadLeft;
	private var NotepadB:NotepadRight;
	private var Score_Board:ScoreBoard;
	private var SyringeA:Syringe;
	private var SyringeB:Syringe;
	
	// Definition of selection circle graphic element
	private var circle_selection:Selection_Circle;

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
	public var reg_consent_info: InfoText;
	
	public var log_mail_info:InfoText;
	public var log_password_info:InfoText;
	public var log_inet_info:InfoText;
	public var log_entry_info:InfoText;
	
	public var logout_inet_info:InfoText;
	
	public var key_accepted_info:InfoText;
	public var key_rejected_info:InfoText;
	
	public var sync_info:InfoText;
	
	public var run_limit_info:InfoText;
	
	public var end_game_info:InfoText;
	
	public var data_sync_info:InfoText;
	
	public var pw_reset_code_info_text:InfoText;
	public var pw_reset_pw_info_text:InfoText;
	
	// questionnaire item text field
	private var item_text:TextField;
	private var item_counter:Int;

	//Button variables for multiple buttons
	public var button1:SimpleButton;
	public var button2:SimpleButton;
	public var button3:SimpleButton;
	//public var button4:SimpleButton;
	public var button5:SimpleButton;
	public var button6:SimpleButton;
	public var button_pw_reset:SimpleButton;
	public var button_reg:SimpleButton;
	public var button_reg_back:SimpleButton;
	public var button_end:SimpleButton;
	public var button_login:SimpleButton;
	public var button_log:SimpleButton;
	public var button_login_back:SimpleButton;
	public var button_reg1:SimpleButton;
	public var button_pw_reset_code:SimpleButton;
	public var button_pw_reset_submit:SimpleButton;
	public var button_pw_reset_back:SimpleButton;
	private var button_back:SimpleButton;
	private var button_quest:SimpleButton;
	private var button_keycode_OK:SimpleButton;
	private var button_keycode_back:SimpleButton;
	private var button_continue:SimpleButton;
	private var textfield_button:SimpleButton;
	private var continue_button:SimpleButton;
	private var key_accepted_info_button:DisplayObject;
	private var key_rejected_info_button:DisplayObject;
	
	public var loggedinuser_text:TextField;


	private var change:Bool = false;
	private var clicked_button:SimpleButton;
    private var click_button:Bool = false;

	private var mailaddress:TextField;
	private var selectedpw:TextField;
	
	private var pw_rest_mail_input:TextField;
	private var pw_rest_code_input:TextField;
	private var pw_reset_passw:TextField;
	public var info_text_str:String;
	

	//Gallery - variable for pathogen image spacing
	private var add:Int;
	
	// Setup background graphic
	private var background_bd:BitmapData;
	private var background_b:Bitmap;
	
	private var inftext:InfoText;
	
	
	public var timestamp_unfocus:Float = 0;
	public var timestamp_refocus:Float = 0;
	
	//radio buttons
	private var yes_rb:OptionBox;
	private var no_rb:OptionBox;
	private var notyet_rb:OptionBox;
	
	private var Likert_1_rb:OptionBox;
	private var Likert_2_rb:OptionBox;
	private var Likert_3_rb:OptionBox;
	private var Likert_4_rb:OptionBox;
	private var Likert_5_rb:OptionBox;
	private var Likert_6_rb:OptionBox;
	
	// database
	private var modification_start:Float;
	
	// registration
	private var reg_checkbox_consent:CheckBox;
	private var reg_checkbox_contact:CheckBox;
	
	// keycode
	private var keycode_input:TextField;
	
	
	//%%%%%%%%%%%% DISPOSAL FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	public function disposeMenuScreen():Void {
    
        // clean up after ourself!
		button1.removeEventListener(MouseEvent.CLICK, onClick_MainGame, false);
		button2.removeEventListener(MouseEvent.CLICK, onInstruction, false);
		button3.removeEventListener(MouseEvent.CLICK, onClick3, false);
		button5.removeEventListener(MouseEvent.CLICK, onClick5, false);
		button6.removeEventListener(MouseEvent.CLICK, onClick6, false);
		
   }
   
   public function disposeGameScreen():Void {
    
        // clean up after ourself!
		button_end.removeEventListener(MouseEvent.CLICK, onClick_end, false);
		SyringeA.removeEventListener(MouseEvent.CLICK, PostChoiceA, false);
		SyringeB.removeEventListener(MouseEvent.CLICK, PostChoiceB,false);
		
   }
   
   public function disposeQuestionnaireScreen():Void {
    
        // clean up after ourself!
		box_container.removeEventListener(MouseEvent.CLICK, activateButtonClick, false);
		button_quest.removeEventListener(MouseEvent.CLICK, QuestPagefinished,false);
		
   }
   
   		
   public function disposeLoginScreen():Void {
	   
	   button_login.removeEventListener(MouseEvent.CLICK, onClick_login,false);		
	   button_login_back.addEventListener(MouseEvent.CLICK, onClick_Log_Back, false);
		
   }
   
   public function disposeRegistrationScreen():Void {
	   
	   button_reg.removeEventListener(MouseEvent.CLICK, onClick_Reg,false);
	   button_reg_back.removeEventListener(MouseEvent.CLICK, onClick_Reg_Back,false);
		
   }
   
   public function disposeGalleryScreen():Void {
	   
	   button_end.removeEventListener(MouseEvent.CLICK, onClick_mainmenu,false);
	   button_continue.removeEventListener(MouseEvent.CLICK, onClick_MainGame,false);
		
   }
   
   public function disposeInstructionScreen():Void {
	   
	   textfield_button.removeEventListener(MouseEvent.CLICK, InstructionBack,false);
	   continue_button.removeEventListener(MouseEvent.CLICK, InstructionForward,false);
		
   }
	   

	
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}


//%%%%%%%%%%BUTTONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	//onClick functions for the multiple buttons
	
	//DATENBANKABRUF
	//Button Game Status - Button3
	public function onClick3 (event: MouseEvent):Void {
		disposeMenuScreen();
		this.removeChild(menu_screen);
		menu_screen = null;
		drawGallery();
	}
	
	//Button Über das Spiel - Button4
	/*public function onClick4 (event: MouseEvent):Void {
		menu_screen.removeChildren();
		button_back = Button.drawButton("Zurück",Std.int(NOMINAL_WIDTH -150),50,"back");
		button_back.addEventListener(MouseEvent.CLICK, onClick_back,false,0,true);
		menu_screen.addChild(button_back);
		//menu_screen.removeChildren();	
	}*/
	
	public function onClick_pw_reset (event: MouseEvent):Void {
		this.removeChild(pw_reset_screen);
		pw_reset_screen = null;
		drawPWReset();
	}
	
	public function onClick_pw_reset_back (event: MouseEvent):Void {
		this.removeChild(login_screen);
		login_screen = null;
		log_and_reg();
	}
	
	public function onClick_pw_reset_code (event: MouseEvent):Void {
		
		// Check if internet connection is available
		var database_availability = InternetConnection.isAvailable();
		
		if (database_availability == true && pw_rest_mail_input.length > 0) {
			
			DatabaseSync.CheckPasswordReset(pw_rest_mail_input.text);
			
		}
		
		// Display info text field: code sent
		pw_reset_code_info_text = new InfoText ("Falls die Mailadresse registriert ist, wurde der Code gesendet.\n Bitte schauen Sie in Ihrem Posteingang nach.");
		var pw_reset_code_info_text_button = pw_reset_code_info_text.getChildAt(1);
		pw_reset_code_info_text_button.addEventListener(MouseEvent.CLICK, toggleMessagePWResetCode,false,0,true);
		pw_reset_screen.addChild(pw_reset_code_info_text);
		
	}
	
	public function toggleMessagePWResetCode(event: MouseEvent):Void {
		pw_reset_screen.removeChild(pw_reset_code_info_text);
		pw_reset_code_info_text = null;
	}
	
	
	public function onClick_pw_reset_submit (event: MouseEvent):Void {
				
		// Check if internet connection is available
		var database_availability = InternetConnection.isAvailable();
		
		if (database_availability == true && pw_rest_mail_input.length > 0 && pw_rest_code_input.length > 0 && pw_reset_passw.length > 0) {
			
			var transaction_finished = DatabaseSync.ResetPassword(pw_rest_mail_input.text, pw_reset_passw.text, pw_rest_code_input.text);
			
			if (transaction_finished == 0){
				
				info_text_str = "Es ist noch kein Code versandt worden.\n Bitte fordern Sie zunächst einen Code mittels Eingabe Ihrer Mailadresse an.";
				
			} else if (transaction_finished == 1) {
				
				info_text_str = "Ihr Passwort wurde erfolgreich geändert!\n Bitte kehren Sie zum Login zurück, um sich mit dem neuen Passwort anzumelden.";
				
			} else if (transaction_finished == 2) {
				
				info_text_str = "Der eingegeben Code stimmt nicht überein.\n Bitte überprüfen Sie den Code, der Ihnen per Email\n auf die registrierte Mailadresse zugesendet wurde.";
				
			}
			
		} else {
			
			info_text_str = "Stellen Sie bitte sicher, dass ein aktiver Internetzugriff besteht\n und sowohl das Code-Feld als auch das neue Passwort eingegeben wurden.";
			
		}
		
		// Display info text field: password reset
		pw_reset_pw_info_text = new InfoText (info_text_str);
		var pw_reset_pw_info_text_button = pw_reset_pw_info_text.getChildAt(1);
		pw_reset_pw_info_text_button.addEventListener(MouseEvent.CLICK, toggleMessagePWResetPW,false,0,true);
		pw_reset_screen.addChild(pw_reset_pw_info_text);
		
	}
	
	public function toggleMessagePWResetPW(event: MouseEvent):Void {
		pw_reset_screen.removeChild(pw_reset_pw_info_text);
		pw_reset_pw_info_text = null;
	}
	
	
	//Button Logout - button5
	public function onClick5 (event: MouseEvent):Void {
		
		// Check if internet connection is available
		// Logout should only be possible with active internet connection to keep user data consistent over devices
		var database_availability = InternetConnection.isAvailable();
		// Move data from local SQLite database to MariaDB if internet connection is available
		if (database_availability == true) {
					
			var transaction_finished = DatabaseSync.DBSync();
					
			if (transaction_finished == true){
				var database_name_trial = "./" + _id + "_app_data_trial.db";					
				if (FileSystem.exists(Path.join([database_path, database_name_trial]))) {
					FileSystem.deleteFile(Path.join([database_path, database_name_trial]));
				}
					
				var database_name_run = "./" + _id + "_app_data_run.db";
				if (FileSystem.exists(Path.join([database_path, database_name_run]))) {
					FileSystem.deleteFile(Path.join([database_path, database_name_run]));
				}
				
				//Log the user out
				// Delete logged in cookie
				AppdataJSON.removeLogin();
				// clear screen
				this.removeChild(menu_screen);
				// Send to login & registration page
				log_and_reg();
				
			}
			
		// No internet connection available: Show info text field	
		} else {
			
			// Display info text field: consent needs to be given
			logout_inet_info = new InfoText ("Es wurde keine Internetverbindung erkannt!\nUm die Nutzerdaten konsistent zu halten, ist ein Logout nur bei bestehender Internetverbindung möglich.");
			var logout_inet_info_button = logout_inet_info.getChildAt(1);
			logout_inet_info_button.addEventListener(MouseEvent.CLICK, toggleMessageLogoutInet,false,0,true);
			menu_screen.addChild(logout_inet_info);
			
		}
		
		
	}
	
	public function toggleMessageLogoutInet(event: MouseEvent):Void {
		menu_screen.removeChild(logout_inet_info);
		logout_inet_info = null;
	}
	
	//Button Beenden - button6
	public function onClick6 (event: MouseEvent):Void {
		
		this.removeChildren();
		
		// Input fields need to be filled
		sync_info = new InfoText ("Bitte schließen Sie eventuell noch geöffnete Hintergrundfenster nicht. \n Sie werden geschlossen, sobald die Datenübertragung beendet ist!");
		var sync_info_button = sync_info.getChildAt(1);
		sync_info_button.visible = false;
		
		this.addChild(sync_info);
				
		//invoke quit function
		haxe.Timer.delay(function() {quitInfluenca(); }, 3000);		
		
	}
	
	public function quitInfluenca() {
		
		// Close window (invoking exit handler)
		Lib.application.window.close();
		
	}
	
	//DATENBANK - ABSPEICHERN
	//End Game - Button_end
	public function onClick_end (event: MouseEvent):Void {
		// Change game state
		currentGameState = Menu;
		Lib.current.stage.removeChild(circle_selection);
		this.removeChildren();
		drawMenuScreen();
	}
	
	public function onClick_mainmenu (event: MouseEvent):Void {
		this.removeChildren();
		drawMenuScreen();
	}
	
	//Registration Button event - button_reg
	// Query database for registration process
	public function onClick_Reg (event: MouseEvent):Void {
		
		// Check internet connection
		var database_availability = InternetConnection.isAvailable();
		if (database_availability == true) {
		
			// Check if consent was given through checkbox			
			if (reg_checkbox_consent.selected == true){
				
				// If internet is connected, check if input fields are filled 
						if (mailaddress.length > 0 && selectedpw.length > 0) {
							
							// Check if mailaddress is already registered, if not register and log-in
							_mail_address = mailaddress.text;
							_password = selectedpw.text;
							var mail_availability = DatabaseSync.CheckRegistration(_mail_address,_password,false);
							if (mail_availability == 0){ // mail address is not registered yet
								// Read out entries for registration
								if (reg_checkbox_consent.selected == true){
									_cb_consent = 1;
								} else {
									_cb_consent = 0;
								}
								
								if (reg_checkbox_contact.selected == true){
									_cb_contact = 1;
								} else {
									_cb_contact = 0;
								}
								
								// Register user in database
								DatabaseSync.UserRegistration();
								// Get new user ID from database
								DatabaseSync.CheckRegistration(_mail_address,_password,true);
								// Set initial run value for appdata
								_run_ind = 1;
								// Set initial value for global score
								_global_score = 0;
								// Set initial value for keycode set flag
								_keycode_set = 0;
								// Set initial value for indicator coding how many runs have been played on a given day
								_num_runs_played = 0;
								// Set initial value for date coding when the last run has been played
								_timestamp_last_run = DateTools.format(Date.now(), "%Y-%m-%d");
								// Set flag signaling that instruction needs to be visited
								intro_screens_visited = false;
								// Save local JSON userdata
								AppdataJSON.AppdataSave();
								// Set user as logged in
								AppdataJSON.saveLogin();
								
								// Send to main menu
								this.removeChildren();
								Screen.instance.removeComponent(vbox_container);
								drawMenuScreen();
								
							} else {
								
								Screen.instance.removeComponent(vbox_container);
								// Info field: mail address already registered
								reg_mail_info = new InfoText ("Diese E-Mail Adresse wurde bereits für ein Konto registriert.\nBitte wählen Sie eine andere E-Mail Adresse \noder loggen Sie sich in Ihr bestehendes Konto ein.");
								var reg_mail_info_button = reg_mail_info.getChildAt(1);
								reg_mail_info_button.addEventListener(MouseEvent.CLICK, toggleMessageRegMail,false,0,true);
								registration_screen.addChild(reg_mail_info);
														
							}
							
						} else {
							
							Screen.instance.removeComponent(vbox_container);
							// Input fields need to be filled
							reg_entry_info = new InfoText ("Die Eingaben zu E-Mailadresse und Passwort dürfen nicht leer sein.");
							var reg_entry_info_button = reg_entry_info.getChildAt(1);
							reg_entry_info_button.addEventListener(MouseEvent.CLICK, toggleMessageRegEntry,false,0,true);
							registration_screen.addChild(reg_entry_info);
							
						}
						
					} else {
						
						Screen.instance.removeComponent(vbox_container);
						// Display info text field: consent needs to be given
						reg_consent_info = new InfoText ("Sie haben im Auswahlkasten kein Einverständnis\n für Ihre Teilnahme an der Studie gegeben.\n\n Ohne Ihr Einverständnis ist eine Nutzung\n der App leider nicht möglich.");
						var reg_consent_info_button = reg_consent_info.getChildAt(1);
						reg_consent_info_button.addEventListener(MouseEvent.CLICK, toggleMessageRegConsent,false,0,true);
						registration_screen.addChild(reg_consent_info);
						
					}
					
		} else {
			
			Screen.instance.removeComponent(vbox_container);
			// Display info text field: Internet Connection is necessary
			reg_inet_info = new InfoText ("Eine Internetverbindung ist zur Registrierung notwendig,\n wurde aber nicht erkannt.\n\n Bitte stellen Sie eine Internetverbindung her.");
			var reg_inet_info_button = reg_inet_info.getChildAt(1);
			reg_inet_info_button.addEventListener(MouseEvent.CLICK, toggleMessageRegInet,false,0,true);
			registration_screen.addChild(reg_inet_info);
			
		}
		
	}
	
	public function toggleMessageRegMail(event: MouseEvent):Void {
		registration_screen.removeChild(reg_mail_info);
		Screen.instance.addComponent(vbox_container);
	}
	
	public function toggleMessageRegEntry(event: MouseEvent):Void {
		registration_screen.removeChild(reg_entry_info);
		Screen.instance.addComponent(vbox_container);
	}
	
	function toggleMessageRegInet(event: MouseEvent):Void {
		registration_screen.removeChild(reg_inet_info);
		Screen.instance.addComponent(vbox_container);
	}
	
	function toggleMessageRegConsent(event: MouseEvent):Void {
		registration_screen.removeChild(reg_consent_info);
		Screen.instance.addComponent(vbox_container);
	}
						
	//Leads back to start page from registration
	public function onClick_Reg_Back (event: MouseEvent):Void {
		this.removeChildren();
		Screen.instance.removeComponent(vbox_container);
		log_and_reg();
	}
	
	public function onClick_Log_Back (event: MouseEvent):Void {
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
					_password = passw.text;
					var mail_availability = DatabaseSync.CheckRegistration(_mail_address,_password,true);
					if (mail_availability == 2){ // mail address is registered and password fits -> ID, keycode & keycode entered state are already retrieved from database
						
						// retrieve run data from database and save
						DatabaseSync.SyncUserData(_id);
						
						// Save local JSON userdata
						AppdataJSON.AppdataSave();
						// Set user as logged in
						AppdataJSON.saveLogin();
												
						// send to main menu
						this.removeChild(login_screen);
						drawMenuScreen();
						
					} else  if (mail_availability == 0){
						
						// Info field: mail address not yet registered -> send to registration page
						log_mail_info = new InfoText ("Ein Nutzerkonto mit dieser E-Mail Adresse wurde noch nicht registriert.\nBitte registrieren Sie sich zunächst für ein Konto.");
						var log_mail_info_button = log_mail_info.getChildAt(1);
						log_mail_info_button.addEventListener(MouseEvent.CLICK, onClick_reg1,false,0,true);
						login_screen.addChild(log_mail_info);
						
					} else if (mail_availability == 1) {
						
						// Info field: mail address registered, but password incorrect
						log_password_info = new InfoText ("Das eingegebene Passwort passt nicht zur registrierten E-Mail Adresse.\n");
						var log_password_info_button = log_password_info.getChildAt(1);
						log_password_info_button.addEventListener(MouseEvent.CLICK, toggleMessageLogPassw,false,0,true);
						login_screen.addChild(log_password_info);
						
					}
					
				} else {
					
					// Input fields need to be filled
					log_entry_info = new InfoText ("Die Eingaben zu E-Mailadresse und Passwort dürfen nicht leer sein");
					var log_entry_info_button = log_entry_info.getChildAt(1);
					log_entry_info_button.addEventListener(MouseEvent.CLICK, toggleMessageLogEntry,false,0,true);
					login_screen.addChild(log_entry_info);
					
				}
				
			} else {
				
				// Display info text field: Internet Connection is necessary
				log_inet_info = new InfoText ("Eine Internetverbindung ist für den Login notwendig, wurde aber nicht erkannt.\n Bitte stellen Sie eine Internetverbindung her.");
				var log_inet_info_button = log_inet_info.getChildAt(1);
				log_inet_info_button.addEventListener(MouseEvent.CLICK, toggleMessageLogInet,false,0,true);
				login_screen.addChild(log_inet_info);
				
			}
		
		
	}
	
	/*public function toggleMessageLogMail(event: MouseEvent):Void {
		login_screen.removeChild(log_mail_info);
	}*/
	
	public function toggleMessageLogEntry(event: MouseEvent):Void {
		login_screen.removeChild(log_entry_info);
	}
	
	function toggleMessageLogInet(event: MouseEvent):Void {
		login_screen.removeChild(log_inet_info);
	}
	
	function toggleMessageLogPassw(event: MouseEvent):Void {
		login_screen.removeChild(log_password_info);
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
		
		if (_run_ind == 1 && intro_screens_visited == false) {
			
			this.removeChildren();
			drawInstructionScreen();
			
		} else if (_run_ind == runs + 1) {
			
			this.removeChildren();
			end_game_info = new InfoText ("Sie haben bereits alle Level erfolgreich beendet.\n In der Galerie können Sie sich Ihre Erfolge ansehen.");
			var end_game_info_button = end_game_info.getChildAt(1);
			end_game_info_button.addEventListener(MouseEvent.CLICK, toggleMessageEndGame,false,0,true);
			this.addChild(end_game_info);
			
		} else if (_num_runs_played == 3 && _timestamp_last_run == DateTools.format(Date.now(), "%Y-%m-%d")) {
			
			this.removeChildren();
			run_limit_info = new InfoText ("Sie haben heute bereits 3 Level gespielt.\n Weitere Level können erst am nächsten Tag gestartet werden.");
			var run_limit_info_button = run_limit_info.getChildAt(1);
			run_limit_info_button.addEventListener(MouseEvent.CLICK, toggleMessageRunLimit,false,0,true);
			this.addChild(run_limit_info);
			
		} else if (_run_ind >= 11 && _keycode_set == 1) {
			
			this.removeChildren();
			DrawLevelscreen();
			
		} else if (_run_ind >= 11 && _keycode_set == 0) {
			
			this.removeChildren();
			drawKeycodeScreen();
			
		} else if (_run_ind < 11) {
			
			this.removeChildren();
			DrawLevelscreen();
			
		}

	}
	
	function toggleMessageRunLimit(event: MouseEvent):Void {
		this.removeChildren();
		drawMenuScreen();
	}
	
	function toggleMessageEndGame(event: MouseEvent):Void {
		this.removeChildren();
		drawGallery();
	}
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	//%%%%%%%% REGISTRATION & LOGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	/*function ShiftScreenSoftKeyboardIn(event: FocusEvent):Void {
		
		var screenkeyboardrect = stage.softKeyboardRect;
		var screenkeyboardheight = screenkeyboardrect.height;
		var inputobject:DisplayObject = event.currentTarget;
		var inputheight = inputobject.y;
		
		if (screenkeyboardheight != 0 && inputheight > (NOMINAL_HEIGHT-screenkeyboardheight)) 
		{
			var heightdifference = (inputheight - (NOMINAL_HEIGHT - screenkeyboardheight));
			//Lib.current.y = ((Lib.current.stage.window.height - NOMINAL_HEIGHT * stageScale) / 2) - heightdifference;
			Lib.current.y = Lib.current.y - heightdifference;
		}
	}
	
	function ShiftScreenSoftKeyboardOut(event: FocusEvent):Void {
		
		Lib.current.y = (Lib.current.stage.window.height - NOMINAL_HEIGHT * stageScale) / 2;
		//Lib.current.stage.y = (Lib.current.stage.window.height - NOMINAL_HEIGHT * stageScale) / 2;
		
	}*/
		
	
	//first page that lets you choose between Login and Registration
	public function log_and_reg(){
		//global var
		login_screen = new Sprite();
		login_screen.addChild(img_menu_background);
		
		button_log = Button.drawButton("Login",NOMINAL_WIDTH / 2, 200, "menu");
		button_reg1 = Button.drawButton("Registrierung", NOMINAL_WIDTH / 2, 350, "menu");
		button_pw_reset = Button.drawButton("Passwort ändern", NOMINAL_WIDTH / 2, 500, "menu");
		button6 = Button.drawButton("Beenden", NOMINAL_WIDTH / 2, 900, "menu");
		
		button_log.addEventListener(MouseEvent.CLICK, onClick_log,false,0,true);
		button_reg1.addEventListener(MouseEvent.CLICK, onClick_reg1, false, 0, true);
		button_pw_reset.addEventListener(MouseEvent.CLICK, onClick_pw_reset, false, 0, true);
		button6.addEventListener(MouseEvent.CLICK, onClick6,false,0,true);
		
		login_screen.addChild(button_log);
		login_screen.addChild(button_reg1);
		login_screen.addChild(button_pw_reset);
		login_screen.addChild(button6);
		
		this.addChild(login_screen);
		
	}
	
	// draw login screen Log-in data & PW
	public function getLoginScreen(){
		
		login_screen = new Sprite();
		login_screen.addChild(input_background);
		
		// set up formats
		var logformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0x000000, true);
		logformat.align = TextFormatAlign.LEFT;
		
		var inputformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0x000000, true);
		inputformat.align = TextFormatAlign.LEFT;
		
		// set up info text fields
		var username_info = new TextField();
		username_info.background = false;
		username_info.width = 900;
		username_info.height = 80;
		username_info.x = (NOMINAL_WIDTH - username_info.width) / 2;
		username_info.y = 120;
		username_info.text = "E-Mail:";
		username_info.defaultTextFormat = logformat;
		username_info.selectable = false;
		username_info.mouseEnabled = false;
		login_screen.addChild(username_info);
		
		var passw_info = new TextField();
		passw_info.background = false;
		passw_info.width = 900;
		passw_info.height = 80;
		passw_info.x = (NOMINAL_WIDTH - passw_info.width) / 2;
		passw_info.y = 420;
		passw_info.text = "Passwort:";
		passw_info.defaultTextFormat = logformat;
		passw_info.selectable = false;
		passw_info.mouseEnabled = false;
		login_screen.addChild(passw_info);

		// set up input fields
		username = new TextField();
		username.background = true;
		username.width = 900;
		username.height = 60;
		username.x = (NOMINAL_WIDTH - username.width) / 2;
		username.y = 200;
		username.defaultTextFormat = inputformat;
		username.restrict = "0-9A-Za-z@._/-";
		username.type = TextFieldType.INPUT;
		// Request software keyboard on devices without hardware keyboard
		username.needsSoftKeyboard = true;
		username.requestSoftKeyboard();
		//username.addEventListener(FocusEvent.FOCUS_IN, ShiftScreenSoftKeyboardIn);
		//username.addEventListener(FocusEvent.FOCUS_OUT, ShiftScreenSoftKeyboardOut);
		login_screen.addChild(username);


		//new Textfield for password insertion
		passw = new TextField();
		//edited text is displayed as a password
		passw.displayAsPassword = true;
		passw.background = true;
		passw.width = 900;
		passw.height = 60;
		passw.x = (NOMINAL_WIDTH - passw.width) / 2;
		passw.y = 500;
		passw.restrict = null;
		//user can edit the textfield
		passw.type = TextFieldType.INPUT;
		passw.defaultTextFormat = inputformat;
		passw.needsSoftKeyboard = true;
		passw.requestSoftKeyboard();
		//passw.addEventListener(FocusEvent.FOCUS_IN, ShiftScreenSoftKeyboardIn);
		//passw.addEventListener(FocusEvent.FOCUS_OUT, ShiftScreenSoftKeyboardOut);
		login_screen.addChild(passw);

		//login button
		button_login = Button.drawButton("Login", NOMINAL_WIDTH / 2, 800, "menu");		
		button_login.addEventListener(MouseEvent.CLICK, onClick_login,false,0,true);
		login_screen.addChild(button_login);
		
		//back button
		button_login_back = Button.drawButton("Zurück", NOMINAL_WIDTH / 2, 950, "menu");		
		button_login_back.addEventListener(MouseEvent.CLICK, onClick_Log_Back,false,0,true);
		login_screen.addChild(button_login_back);

		this.addChild(login_screen);	
	}


	//creates the registration page
	function createRegistration(){
		
		registration_screen = new Sprite();
		registration_screen.addChild(input_background);
		
		// set up formats
		var name2:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0x000000, true);
		name2.align = TextFormatAlign.LEFT;
		
		var infoformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0x000000, true);
		infoformat.align = TextFormatAlign.LEFT;
		
		// set up info text fields
		var mailaddress_info = new TextField();
		mailaddress_info.background = false;
		mailaddress_info.width = 900;
		mailaddress_info.height = 80;
		mailaddress_info.x = (NOMINAL_WIDTH - mailaddress_info.width) / 2;
		mailaddress_info.y = 120;
		mailaddress_info.text = "E-Mail:";
		mailaddress_info.defaultTextFormat = infoformat;
		mailaddress_info.selectable = false;
		mailaddress_info.mouseEnabled = false;
		registration_screen.addChild(mailaddress_info);		
		
		var selectedpw_info = new TextField();
		selectedpw_info.background = false;
		selectedpw_info.width = 900;
		selectedpw_info.height = 80;
		selectedpw_info.x = (NOMINAL_WIDTH - selectedpw_info.width) / 2;
		selectedpw_info.y = 320;
		selectedpw_info.text = "Passwort:";
		selectedpw_info.defaultTextFormat = infoformat;
		selectedpw_info.selectable = false;
		selectedpw_info.mouseEnabled = false;
		registration_screen.addChild(selectedpw_info);	
		
		// set up input fields
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

		selectedpw = new TextField();
		selectedpw.background = true;
		selectedpw.width = 900;
		selectedpw.height = 60;
		selectedpw.x = (NOMINAL_WIDTH - selectedpw.width) / 2;
		selectedpw.y = 400;
		selectedpw.defaultTextFormat = name2;
		selectedpw.restrict = null;
		selectedpw.type = TextFieldType.INPUT;
		selectedpw.displayAsPassword = true;
		selectedpw.needsSoftKeyboard = true;
		selectedpw.requestSoftKeyboard();
		registration_screen.addChild(selectedpw);
		
		vbox_container = new VBox();
		vbox_container.x = (NOMINAL_WIDTH - 900) / 2;
		vbox_container.y = 500;
				
		reg_checkbox_consent = new CheckBox();
		reg_checkbox_consent.id = "consent_cb";
		reg_checkbox_consent.selected = false;
		reg_checkbox_consent.height = 100;
		reg_checkbox_consent.text = "Ich habe die Teilnahmebedingungen gelesen \nund stimme ihnen zu:";
		reg_checkbox_consent.styleNames = "CheckboxFont";
		Toolkit.styleSheet.addRules(".CheckboxFont { font-size: 40; }");
		
		var urlformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0x0000FF, false, false, true,url_terms_of_service);
		var tos_info = new TextField();
		tos_info.background = false;
		tos_info.width = 500;
		tos_info.height = 100;
		tos_info.x = 980;
		tos_info.y = 543;
		tos_info.text = "Teilnahmebedingungen";
		tos_info.defaultTextFormat = urlformat;
		//tos_info.selectable = false;
		//tos_info.mouseEnabled = false;
		registration_screen.addChild(tos_info);		
		
		reg_checkbox_contact = new CheckBox();
		reg_checkbox_contact.id = "contact_cb";
		reg_checkbox_contact.selected = false;
		reg_checkbox_contact.height = 100;
		reg_checkbox_contact.text = "Ich bin damit einverstanden, für weitere Studien \nüber meine Emailadresse kontaktiert zu werden.";
		reg_checkbox_contact.styleNames = "CheckboxFont";
		Toolkit.styleSheet.addRules(".CheckboxFont { font-size: 40; }");
		
		vbox_container.addComponent(reg_checkbox_consent);
		vbox_container.addComponent(reg_checkbox_contact);
		
		registration_screen.addChild(vbox_container);
		

		//Enabled only if text is inserted, internet connection available and mail address is not already in the database
		//Button for Registration
		button_reg = Button.drawButton("Registrieren",NOMINAL_WIDTH / 2,850,"menu");
		button_reg.addEventListener(MouseEvent.CLICK, onClick_Reg,false,0,true);
		
		button_reg_back = Button.drawButton("Zurück",NOMINAL_WIDTH / 2,1000,"menu");
		button_reg_back.addEventListener(MouseEvent.CLICK, onClick_Reg_Back,false,0,true);
		
		registration_screen.addChild(button_reg);
		registration_screen.addChild(button_reg_back);

		this.addChild(registration_screen);
	}
	
	
	
	public function drawPWReset(){
		
		pw_reset_screen = new Sprite();
		pw_reset_screen.addChild(input_background);
		
		// set up formats
		var logformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 35, 0x000000, true);
		logformat.align = TextFormatAlign.LEFT;
		
		var inputformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0x000000, true);
		inputformat.align = TextFormatAlign.LEFT;
		
		// set up info text fields
		var pw_reset_info = new TextField();
		pw_reset_info.background = false;
		pw_reset_info.width = 1200;
		pw_reset_info.height = 300;
		pw_reset_info.x = (NOMINAL_WIDTH - pw_reset_info.width) / 2;
		pw_reset_info.y = 20;
		pw_reset_info.text = "Geben Sie bitte Ihre für Influenca registrierte Mailadresse ein, um einen Code per Mail zugeschickt zu bekommen. Sobald Sie die E-Mail erhalten haben, geben Sie weiter unten bitte zur Überprüfung den erhaltenen Code ein sowie Ihr neues Passwort und bestätigen Sie die Eingabe.";
		pw_reset_info.defaultTextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 35, 0x000000, true);
		pw_reset_info.selectable = false;
		pw_reset_info.mouseEnabled = false;
		pw_reset_info.multiline = true;
		pw_reset_info.wordWrap = true;
		pw_reset_screen.addChild(pw_reset_info);
		
		var pw_reset_mail_info = new TextField();
		pw_reset_mail_info.background = false;
		pw_reset_mail_info.width = 900;
		pw_reset_mail_info.height = 80;
		pw_reset_mail_info.x = (NOMINAL_WIDTH - pw_reset_mail_info.width) / 2;
		pw_reset_mail_info.y = 220;
		pw_reset_mail_info.text = "E-Mail:";
		pw_reset_mail_info.defaultTextFormat = logformat;
		pw_reset_mail_info.selectable = false;
		pw_reset_mail_info.mouseEnabled = false;
		pw_reset_screen.addChild(pw_reset_mail_info);
		
		var pw_reset_code = new TextField();
		pw_reset_code.background = false;
		pw_reset_code.width = 900;
		pw_reset_code.height = 80;
		pw_reset_code.x = (NOMINAL_WIDTH - pw_reset_code.width) / 2;
		pw_reset_code.y = 500;
		pw_reset_code.text = "Reset-Code:";
		pw_reset_code.defaultTextFormat = logformat;
		pw_reset_code.selectable = false;
		pw_reset_code.mouseEnabled = false;
		pw_reset_screen.addChild(pw_reset_code);
		
		var passw_info = new TextField();
		passw_info.background = false;
		passw_info.width = 900;
		passw_info.height = 80;
		passw_info.x = (NOMINAL_WIDTH - passw_info.width) / 2;
		passw_info.y = 640;
		passw_info.text = "Neues Passwort:";
		passw_info.defaultTextFormat = logformat;
		passw_info.selectable = false;
		passw_info.mouseEnabled = false;
		pw_reset_screen.addChild(passw_info);

		// set up input fields
		pw_rest_mail_input = new TextField();
		pw_rest_mail_input.background = true;
		pw_rest_mail_input.width = 900;
		pw_rest_mail_input.height = 60;
		pw_rest_mail_input.x = (NOMINAL_WIDTH - pw_rest_mail_input.width) / 2;
		pw_rest_mail_input.y = 280;
		pw_rest_mail_input.defaultTextFormat = inputformat;
		pw_rest_mail_input.restrict = "0-9A-Za-z@._/-";
		pw_rest_mail_input.type = TextFieldType.INPUT;
		pw_rest_mail_input.needsSoftKeyboard = true;
		pw_rest_mail_input.requestSoftKeyboard();
		pw_reset_screen.addChild(pw_rest_mail_input);
		
		
		pw_rest_code_input = new TextField();
		pw_rest_code_input.background = true;
		pw_rest_code_input.width = 900;
		pw_rest_code_input.height = 60;
		pw_rest_code_input.x = (NOMINAL_WIDTH - pw_rest_code_input.width) / 2;
		pw_rest_code_input.y = 560;
		pw_rest_code_input.defaultTextFormat = inputformat;
		pw_rest_code_input.type = TextFieldType.INPUT;
		pw_rest_code_input.needsSoftKeyboard = true;
		pw_rest_code_input.requestSoftKeyboard();
		pw_reset_screen.addChild(pw_rest_code_input);


		//new Textfield for password insertion
		pw_reset_passw = new TextField();
		//edited text is displayed as a password
		pw_reset_passw.displayAsPassword = true;
		pw_reset_passw.background = true;
		pw_reset_passw.width = 900;
		pw_reset_passw.height = 60;
		pw_reset_passw.x = (NOMINAL_WIDTH - pw_reset_passw.width) / 2;
		pw_reset_passw.y = 700;
		pw_reset_passw.restrict = null;
		pw_reset_passw.type = TextFieldType.INPUT;
		pw_reset_passw.defaultTextFormat = inputformat;
		pw_reset_passw.needsSoftKeyboard = true;
		pw_reset_passw.requestSoftKeyboard();
		pw_reset_screen.addChild(pw_reset_passw);

		//Send code button
		button_pw_reset_code = Button.drawButton("Code anfordern", NOMINAL_WIDTH / 2, 420, "menu");		
		button_pw_reset_code.addEventListener(MouseEvent.CLICK, onClick_pw_reset_code,false,0,true);
		pw_reset_screen.addChild(button_pw_reset_code);
		
		//Reset password button
		button_pw_reset_submit = Button.drawButton("Passwort ändern", NOMINAL_WIDTH / 2, 850, "menu");		
		button_pw_reset_submit.addEventListener(MouseEvent.CLICK, onClick_pw_reset_submit,false,0,true);
		pw_reset_screen.addChild(button_pw_reset_submit);
		
		//Reset password button
		button_pw_reset_back = Button.drawButton("Zurück", NOMINAL_WIDTH / 2, 1000, "menu");		
		button_pw_reset_back.addEventListener(MouseEvent.CLICK, onClick_pw_reset_back,false,0,true);
		pw_reset_screen.addChild(button_pw_reset_back);

		this.addChild(pw_reset_screen);	
	}
	
	
	
	// create screen for keycode information
	public function drawKeycodeScreen(){
		
		keycode_screen = new Sprite();
		keycode_screen.addChild(img_alternative_screen2);
		
		// set up formats
		var keycodeinfoformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0x000000, true);
		keycodeinfoformat.align = TextFormatAlign.LEFT;
		
		var keycodeinputformat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0x000000, true);
		keycodeinputformat.align = TextFormatAlign.LEFT;
		
		// set up keycode info text
		var keycode_textfield:TextField = new TextField();

		var keycode_text:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 40, 0x000000, true);
		keycode_text.align = TextFormatAlign.CENTER;

		keycode_textfield.defaultTextFormat = keycode_text;
		keycode_textfield.text = "\nUm Level 11 sowie die nachfolgenden Level spielen zu können, möchten wir Sie bitten, \ndie Fragebögen unter dem Link auszufüllen, den wir Ihnen per E-Mail zugeschickt haben. \n\n Die Fragebögen erfassen Eigenschaften Ihrer Persönlichkeit, \n die wir mit dem im Spiel gemessenen Lernverhalten in Verbindung bringen können.\n\n Nach erfolgtem Beantworten der Fragebögen, erhalten Sie einen Code per Mail, \n den Sie hier eingeben können, um die folgenden Level freizuschalten.";
		
		keycode_textfield.height = keycode_textfield.textHeight + 150;
		keycode_textfield.width = 1800;
		keycode_textfield.multiline = true;
		//keycode_textfield.autoSize = TextFieldAutoSize.CENTER;
		keycode_textfield.x = (NOMINAL_WIDTH - keycode_textfield.width) / 2;
        keycode_textfield.y = 100;
		keycode_textfield.selectable = false;
		keycode_textfield.mouseEnabled = false;
		keycode_screen.addChild(keycode_textfield);
		
		// set up info text field
		var keycode_info = new TextField();
		keycode_info.background = false;
		keycode_info.width = 900;
		keycode_info.height = 80;
		keycode_info.x = (NOMINAL_WIDTH - keycode_info.width) / 2;
		keycode_info.y = keycode_textfield.height;
		keycode_info.text = "Code:";
		keycode_info.defaultTextFormat = keycodeinfoformat;
		keycode_info.selectable = false;
		keycode_info.mouseEnabled = false;
		keycode_screen.addChild(keycode_info);

		// set up input field
		keycode_input = new TextField();
		keycode_input.background = true;
		keycode_input.width = 900;
		keycode_input.height = 60;
		keycode_input.x = (NOMINAL_WIDTH - keycode_input.width) / 2;
		keycode_input.y = keycode_textfield.height + 80;
		keycode_input.defaultTextFormat = keycodeinputformat;
		keycode_input.restrict = "0-9";
		keycode_input.type = TextFieldType.INPUT;
		// Request software keyboard on devices without hardware keyboard
		keycode_input.needsSoftKeyboard = true;
		keycode_input.requestSoftKeyboard();
		keycode_screen.addChild(keycode_input);
		
		//OK button
		button_keycode_back = Button.drawButton("OK", NOMINAL_WIDTH / 2, 950, "menu");
		button_keycode_back.addEventListener(MouseEvent.CLICK, onClick_keycode,false,0,true);
		keycode_screen.addChild(button_keycode_back);

		this.addChild(keycode_screen);	
	}
	
	public function onClick_keycode (event: MouseEvent):Void {
		
		button_keycode_back.removeEventListener(MouseEvent.CLICK, onClick_keycode,false);
		
		if (keycode_input.length > 0) {
		
			var keycode_str = Std.string(_keycode);
			if (keycode_input.text == keycode_str) {
				
				// set keycode as activated
				_keycode_set = 1;
				// save variable to JSON file
				AppdataJSON.AppdataSave();
				// Display info text field: Key was accepted
				key_accepted_info = new InfoText ("Der eingegebene Code ist korrekt.\n Das nächste Level kann nun gestartet werden.");
				key_accepted_info_button = key_accepted_info.getChildAt(1);
				key_accepted_info_button.addEventListener(MouseEvent.CLICK, toggleMessageKeyAccepted,false,0,true);
				keycode_screen.addChild(key_accepted_info);
				
			} else if (keycode_input.text != keycode_str) {
				
				// Display info text field: Key was wrong
				key_rejected_info = new InfoText ("Der eingegebene Code stimmt nicht überein.\n Bitte überprüfen Sie den eingegebenen Code, \n um das nächste Level starten zu können.");
				key_rejected_info_button = key_rejected_info.getChildAt(1);
				key_rejected_info_button.addEventListener(MouseEvent.CLICK, toggleMessageKeyRejected,false,0,true);
				keycode_screen.addChild(key_rejected_info);
				
			}
			
		} else {
		
		this.removeChildren();
		drawGallery();
		
		}
	}
	
	function toggleMessageKeyAccepted(event: MouseEvent):Void {
		key_accepted_info_button.removeEventListener(MouseEvent.CLICK, toggleMessageKeyAccepted,false);
		this.removeChildren();
		keycode_screen = null;
		drawGallery();
	}
	
	function toggleMessageKeyRejected(event: MouseEvent):Void {
		key_rejected_info_button.removeEventListener(MouseEvent.CLICK, toggleMessageKeyRejected,false);
		this.removeChildren();
		keycode_screen = null;
		drawGallery();
	}




	/*draws the menu screen where you can choose from new game, About, Instructions, Score and Log-off
	needs text*/
	public function drawMenuScreen(){
		
		menu_screen = new Sprite();
		menu_screen.addChild(img_menu_background);
		
		// Load background graphic for mail address of active user
		img_login_key.x = (NOMINAL_WIDTH-img_login_key.width) / 2;
		img_login_key.y = 950;
		menu_screen.addChild(img_login_key);
		// Display mail address of active user
		var LoggedInUserFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 28, 0x000000, true);
		LoggedInUserFormat.align = TextFormatAlign.CENTER;			
		loggedinuser_text = new TextField();
		loggedinuser_text.width = 1920;
		loggedinuser_text.height = 145;
		loggedinuser_text.y = 980;
		loggedinuser_text.x = 0;
		loggedinuser_text.defaultTextFormat = LoggedInUserFormat;
		loggedinuser_text.text = 'Angemeldet als: $_mail_address';
		loggedinuser_text.selectable = false;
		loggedinuser_text.mouseEnabled = false;
		menu_screen.addChild(loggedinuser_text);
		
		//New game button
        button1 = Button.drawButton("Spielen",NOMINAL_WIDTH / 2, 150, "menu");
		//Anleitung
		button2 = Button.drawButton("Anleitung",Std.int(NOMINAL_WIDTH / 2), 300, "menu");
		//Spielstand
		button3 = Button.drawButton("Spielstand/Galerie",Std.int(NOMINAL_WIDTH / 2), 450, "menu");
		//Logout
		button5 = Button.drawButton("Logout", Std.int(NOMINAL_WIDTH / 2), 700, "menu");
		// Beenden
		button6 = Button.drawButton("Beenden", Std.int(NOMINAL_WIDTH / 2), 850, "menu");

	
		button1.addEventListener(MouseEvent.CLICK, onClick_MainGame,false,0,true);
		button2.addEventListener(MouseEvent.CLICK, onInstruction,false,0,true);
		button3.addEventListener(MouseEvent.CLICK, onClick3,false,0,true);
		button5.addEventListener(MouseEvent.CLICK, onClick5,false,0,true);
		button6.addEventListener(MouseEvent.CLICK, onClick6,false,0,true);
		
		menu_screen.addChild(button1);
		menu_screen.addChild(button2);
		menu_screen.addChild(button3);
		menu_screen.addChild(button5);
		menu_screen.addChild(button6);
		
		
		
		this.addChild(menu_screen);
		
	
	}
	
	
	//draws the screen for questionnaire items
	public function drawQuestionnaireScreen(type:String){
		
		// remove old content
		this.removeChildren();
		
		// Initialize questionnaire screen
		questionnaire_screen = new Sprite();
		
		// Add back button
		button_end = Button.drawButton("Menü", Std.int(NOMINAL_WIDTH -150),50, "back");
		button_end.addEventListener(MouseEvent.CLICK, onClick_mainmenu,false,0,true);
		questionnaire_screen.addChild(button_end);
		
		// set up questionnaire items according to answer format
		if (type == "scale") {
		
			// item text
			var itemFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
			itemFormat.align = TextFormatAlign.CENTER;
			
			item_text = new TextField();
			item_text.width = 1920;
			item_text.height = 400;
			item_text.y = 100;
			item_text.x = 0;
			item_text.defaultTextFormat = itemFormat;
			item_text.text = questionnaire_items[item_counter];
			item_text.multiline = true;
			item_text.selectable = false;
			item_text.mouseEnabled = false;
			
			
			// UI elements
			box_container = new HBox();
			box_container.width = NOMINAL_WIDTH;
			box_container.height = NOMINAL_HEIGHT;
						
			var rbFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0xFFFFFF, true);
			rbFormat.align = TextFormatAlign.LEFT;
			
			var anchor_left = new TextField();
			anchor_left.width = 300;
			anchor_left.height = 300;
			anchor_left.y = 570;
			anchor_left.x = 250;
			anchor_left.defaultTextFormat = rbFormat;
			anchor_left.selectable = false;
			anchor_left.mouseEnabled = false;
			anchor_left.text = "gar nicht";
			questionnaire_screen.addChild(anchor_left);
			
			var anchor_right = new TextField();
			anchor_right.width = 300;
			anchor_right.height = 300;
			anchor_right.y = 570;
			anchor_right.x = 1500;
			anchor_right.defaultTextFormat = rbFormat;
			anchor_right.selectable = false;
			anchor_right.mouseEnabled = false;
			anchor_right.text = "sehr";
			questionnaire_screen.addChild(anchor_right);
			
			// Set slider button initially to 0 size
			Toolkit.styleSheet.addRules(".hslider .slider-button { height: 0px !important; width: 0px !important; }");
			
			quest_slider = new HSlider();
			quest_slider.max = 100;
			quest_slider.min = 0;
			quest_slider.width = 840;
			quest_slider.marginTop = 595;
			quest_slider.marginLeft = 550;
			quest_slider.animatable = false;
			
			quest_slider.registerEvent(UIEvent.CHANGE, activateButton);
			
			box_container.addComponent(quest_slider);
			
			//box_container.addEventListener(MouseEvent.CLICK, restoreSliderButton,false,0,true);
			
			questionnaire_screen.addChild(box_container);
			questionnaire_screen.addChild(item_text);
			
			/*trace(Toolkit.autoScale);
			trace(Toolkit.autoScaleDPIThreshold);
			trace(Toolkit.scaleX);
			trace(Toolkit.scaleY);
			trace(Screen.instance.dpi);
			trace(System.getDisplay(0).dpi);
			trace(Screen.instance.height);
			trace(Screen.instance.width);*/
			
				
			// Forward button
			button_quest = Button.drawButton("OK", NOMINAL_WIDTH / 2, 950, "info");
			button_quest.visible = false;
			
			button_quest.addEventListener(MouseEvent.CLICK, QuestPagefinished,false,0,true);
			questionnaire_screen.addChild(button_quest);
			
			this.addChild(questionnaire_screen);
			
		}
		
		else if (type == "Likert") {
			
			// item text
			var itemFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
			itemFormat.align = TextFormatAlign.CENTER;
			
			item_text = new TextField();
			item_text.width = 1920;
			item_text.height = 400;
			item_text.y = 100;
			item_text.x = 0;
			item_text.defaultTextFormat = itemFormat;
			item_text.text = questionnaire_items[item_counter];
			item_text.multiline = true;
			item_text.selectable = false;
			item_text.mouseEnabled = false;
			questionnaire_screen.addChild(item_text);
			
			// UI elements
			box_container = new HBox();
			box_container.x = 10;
			box_container.y = 570;
			
			var rbFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0xFFFFFF, true);
			rbFormat.align = TextFormatAlign.LEFT;
			
			// answer options
			var rb_Likert_Text_1 = new TextField();
			rb_Likert_Text_1.width = 300;
			rb_Likert_Text_1.height = 200;
			rb_Likert_Text_1.y = 570;
			rb_Likert_Text_1.x = 100;
			rb_Likert_Text_1.multiline = true;
			rb_Likert_Text_1.selectable = false;
			rb_Likert_Text_1.mouseEnabled = false;
			rb_Likert_Text_1.defaultTextFormat = rbFormat;
			
			if (item_counter == 4) {
				rb_Likert_Text_1.text = anchors_likert[1];
			} else if (item_counter == 25) {
				rb_Likert_Text_1.text = anchors_likert[7];
			} else if (item_counter == 26) {
				rb_Likert_Text_1.text = anchors_likert[13];
			}
			
			questionnaire_screen.addChild(rb_Likert_Text_1);
						
			var rb_Likert_Text_2 = new TextField();
			rb_Likert_Text_2.width = 300;
			rb_Likert_Text_2.height = 200;
			rb_Likert_Text_2.y = 570;
			rb_Likert_Text_2.x = 420;
			rb_Likert_Text_2.multiline = true;
			rb_Likert_Text_2.selectable = false;
			rb_Likert_Text_2.mouseEnabled = false;
			rb_Likert_Text_2.defaultTextFormat = rbFormat;
			
			if (item_counter == 4) {
				rb_Likert_Text_2.text = anchors_likert[2];
			} else if (item_counter == 25) {
				rb_Likert_Text_2.text = anchors_likert[8];
			} else if (item_counter == 26) {
				rb_Likert_Text_2.text = anchors_likert[14];
			}
			
			questionnaire_screen.addChild(rb_Likert_Text_2);
			
			var rb_Likert_Text_3 = new TextField();
			rb_Likert_Text_3.width = 300;
			rb_Likert_Text_3.height = 200;
			rb_Likert_Text_3.y = 570;
			rb_Likert_Text_3.x = 740;
			rb_Likert_Text_3.multiline = true;
			rb_Likert_Text_3.selectable = false;
			rb_Likert_Text_3.mouseEnabled = false;
			rb_Likert_Text_3.defaultTextFormat = rbFormat;
			
			if (item_counter == 4) {
				rb_Likert_Text_3.text = anchors_likert[3];
			} else if (item_counter == 25) {
				rb_Likert_Text_3.text = anchors_likert[9];
			} else if (item_counter == 26) {
				rb_Likert_Text_3.text = anchors_likert[15];
			}
			
			questionnaire_screen.addChild(rb_Likert_Text_3);
			
			var rb_Likert_Text_4 = new TextField();
			rb_Likert_Text_4.width = 300;
			rb_Likert_Text_4.height = 200;
			rb_Likert_Text_4.y = 570;
			rb_Likert_Text_4.x = 1060;
			rb_Likert_Text_4.multiline = true;
			rb_Likert_Text_4.selectable = false;
			rb_Likert_Text_4.mouseEnabled = false;
			rb_Likert_Text_4.defaultTextFormat = rbFormat;
			
			if (item_counter == 4) {
				rb_Likert_Text_4.text = anchors_likert[4];
			} else if (item_counter == 25) {
				rb_Likert_Text_4.text = anchors_likert[10];
			} else if (item_counter == 26) {
				rb_Likert_Text_4.text = anchors_likert[16];
			}
			
			questionnaire_screen.addChild(rb_Likert_Text_4);
			
			var rb_Likert_Text_5 = new TextField();
			rb_Likert_Text_5.width = 300;
			rb_Likert_Text_5.height = 200;
			rb_Likert_Text_5.y = 570;
			rb_Likert_Text_5.x = 1380;
			rb_Likert_Text_5.multiline = true;
			rb_Likert_Text_5.selectable = false;
			rb_Likert_Text_5.mouseEnabled = false;
			rb_Likert_Text_5.defaultTextFormat = rbFormat;
			
			if (item_counter == 4) {
				rb_Likert_Text_5.text = anchors_likert[5];
			} else if (item_counter == 25) {
				rb_Likert_Text_5.text = anchors_likert[11];
			} else if (item_counter == 26) {
				rb_Likert_Text_5.text = anchors_likert[17];
			}
			
			questionnaire_screen.addChild(rb_Likert_Text_5);
			
			var rb_Likert_Text_6 = new TextField();
			rb_Likert_Text_6.width = 300;
			rb_Likert_Text_6.height = 200;
			rb_Likert_Text_6.y = 570;
			rb_Likert_Text_6.x = 1700;
			rb_Likert_Text_6.multiline = true;
			rb_Likert_Text_6.selectable = false;
			rb_Likert_Text_6.mouseEnabled = false;
			rb_Likert_Text_6.defaultTextFormat = rbFormat;
			
			if (item_counter == 4) {
				rb_Likert_Text_6.text = anchors_likert[6];
			} else if (item_counter == 25) {
				rb_Likert_Text_6.text = anchors_likert[12];
			} else if (item_counter == 26) {
				rb_Likert_Text_6.text = anchors_likert[18];
			}
			
			questionnaire_screen.addChild(rb_Likert_Text_6);
			
			Likert_1_rb = new OptionBox();
			Likert_1_rb.groupName = "LikertRBs";
			Likert_1_rb.width = 315;
			
			Likert_2_rb = new OptionBox();
			Likert_2_rb.groupName = "LikertRBs";
			Likert_2_rb.width = 315;
			
			Likert_3_rb = new OptionBox();
			Likert_3_rb.groupName = "LikertRBs";
			Likert_3_rb.width = 315;
			
			Likert_4_rb = new OptionBox();
			Likert_4_rb.groupName = "LikertRBs";
			Likert_4_rb.width = 315;
			
			Likert_5_rb = new OptionBox();
			Likert_5_rb.groupName = "LikertRBs";
			Likert_5_rb.width = 315;
			
			Likert_6_rb = new OptionBox();
			Likert_6_rb.groupName = "LikertRBs";
			Likert_6_rb.width = 315;
			
			box_container.addEventListener(MouseEvent.CLICK, activateButtonClick,false,0,true);
			
			box_container.addComponent(Likert_1_rb);
			box_container.addComponent(Likert_2_rb);
			box_container.addComponent(Likert_3_rb);
			box_container.addComponent(Likert_4_rb);
			box_container.addComponent(Likert_5_rb);
			box_container.addComponent(Likert_6_rb);
			
			questionnaire_screen.addChild(box_container);
			
			// Forward button
			button_quest = Button.drawButton("OK", NOMINAL_WIDTH / 2, 950, "info");
			button_quest.visible = false;
			
			button_quest.addEventListener(MouseEvent.CLICK, QuestPagefinished,false,0,true);
			
			questionnaire_screen.addChild(button_quest);
			
			this.addChild(questionnaire_screen);
			
		}
		
		else if (type == "options") {
			
			// item text
			var itemFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
			itemFormat.align = TextFormatAlign.CENTER;
			
			item_text = new TextField();
			item_text.width = 1920;
			item_text.height = 400;
			item_text.y = 100;
			item_text.x = 0;
			item_text.defaultTextFormat = itemFormat;
			item_text.text = questionnaire_items[item_counter];
			item_text.multiline = true;
			item_text.selectable = false;
			item_text.mouseEnabled = false;
			questionnaire_screen.addChild(item_text);
			
			// UI elements
			box_container = new HBox();
			box_container.x = 640;
			box_container.y = 570;
			
			var rbFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0xFFFFFF, true);
			rbFormat.align = TextFormatAlign.LEFT;
			
			var rb_text_yes = new TextField();
			rb_text_yes.width = 200;
			rb_text_yes.height = 200;
			rb_text_yes.y = 570;
			rb_text_yes.x = 750;
			rb_text_yes.defaultTextFormat = rbFormat;
			rb_text_yes.selectable = false;
			rb_text_yes.mouseEnabled = false;
			rb_text_yes.text = "Ja";
			questionnaire_screen.addChild(rb_text_yes);
			
			var rb_text_no = new TextField();
			rb_text_no.width = 200;
			rb_text_no.height = 200;
			rb_text_no.y = 570;
			rb_text_no.x = 1170;
			rb_text_no.defaultTextFormat = rbFormat;
			rb_text_no.selectable = false;
			rb_text_no.mouseEnabled = false;
			rb_text_no.text = "Nein";
			questionnaire_screen.addChild(rb_text_no);
			
			yes_rb = new OptionBox();
			yes_rb.groupName = "questRBs";
			yes_rb.width = 420;
			
			no_rb = new OptionBox();
			no_rb.groupName = "questRBs";
			no_rb.width = 420;
			
			box_container.addEventListener(MouseEvent.CLICK, activateButtonClick,false,0,true);
			
			box_container.addComponent(yes_rb);
			box_container.addComponent(no_rb);
			
			questionnaire_screen.addChild(box_container);
			
			// Forward button
			button_quest = Button.drawButton("OK", NOMINAL_WIDTH / 2, 950, "info");
			button_quest.visible = false;
			
			button_quest.addEventListener(MouseEvent.CLICK, QuestPagefinished,false,0,true);
			
			questionnaire_screen.addChild(button_quest);
			
			this.addChild(questionnaire_screen);
			
		}
		
		else if (type == "threeoptions") {
			
			// item text
			var itemFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
			itemFormat.align = TextFormatAlign.CENTER;
			
			item_text = new TextField();
			item_text.width = 1920;
			item_text.height = 400;
			item_text.y = 100;
			item_text.x = 0;
			item_text.defaultTextFormat = itemFormat;
			item_text.text = questionnaire_items[item_counter];
			item_text.multiline = true;
			item_text.selectable = false;
			item_text.mouseEnabled = false;
			questionnaire_screen.addChild(item_text);
			
			// UI elements
			box_container = new HBox();
			box_container.x = 220;
			box_container.y = 570;
			
			var rbFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 50, 0xFFFFFF, true);
			rbFormat.align = TextFormatAlign.LEFT;
			
			var rb_text_yes = new TextField();
			rb_text_yes.width = 200;
			rb_text_yes.height = 200;
			rb_text_yes.y = 570;
			rb_text_yes.x = 330;
			rb_text_yes.defaultTextFormat = rbFormat;
			rb_text_yes.selectable = false;
			rb_text_yes.mouseEnabled = false;
			rb_text_yes.text = "Ja";
			questionnaire_screen.addChild(rb_text_yes);
			
			var rb_text_no = new TextField();
			rb_text_no.width = 200;
			rb_text_no.height = 200;
			rb_text_no.y = 570;
			rb_text_no.x = 750;
			rb_text_no.defaultTextFormat = rbFormat;
			rb_text_no.selectable = false;
			rb_text_no.mouseEnabled = false;
			rb_text_no.text = "Nein";
			questionnaire_screen.addChild(rb_text_no);
			
			var rb_text_notyet = new TextField();
			rb_text_notyet.width = 800;
			rb_text_notyet.height = 200;
			rb_text_notyet.y = 550;
			rb_text_notyet.x = 1190;
			rb_text_notyet.defaultTextFormat = rbFormat;
			rb_text_notyet.selectable = false;
			rb_text_notyet.mouseEnabled = false;
			rb_text_notyet.multiline = true;
			rb_text_notyet.text = "Noch nicht,\naber ich werde es tun";
			questionnaire_screen.addChild(rb_text_notyet);
			
			yes_rb = new OptionBox();
			yes_rb.groupName = "questRBs";
			yes_rb.width = 420;
			
			no_rb = new OptionBox();
			no_rb.groupName = "questRBs";
			no_rb.width = 420;
			
			notyet_rb = new OptionBox();
			notyet_rb.groupName = "questRBs";
			notyet_rb.width = 420;
			
			box_container.addEventListener(MouseEvent.CLICK, activateButtonClick,false,0,true);
			
			box_container.addComponent(yes_rb);
			box_container.addComponent(no_rb);
			box_container.addComponent(notyet_rb);
			
			questionnaire_screen.addChild(box_container);
			
			// Forward button
			button_quest = Button.drawButton("OK", NOMINAL_WIDTH / 2, 950, "info");
			button_quest.visible = false;
			
			button_quest.addEventListener(MouseEvent.CLICK, QuestPagefinished,false,0,true);
			
			questionnaire_screen.addChild(button_quest);
			
			this.addChild(questionnaire_screen);
			
		}
		
		
		
	}
	
	// activate the forward button after player has interacted with the slider
	public function activateButtonClick(event: MouseEvent):Void {
		button_quest.visible = true;
	}
	
	public function activateButton(event: UIEvent):Void {
		
		// Check if item contains a slider
		var slider_item = box_container.contains(quest_slider);
		if(slider_item == true){
			// Restore slider button
			Toolkit.styleSheet.addRules(".hslider .slider-button { height: 132px !important; width: 60px !important; background-color: #FF0000; }");
			var value_save = quest_slider.pos;
			box_container.removeComponent(quest_slider);
			quest_slider = new HSlider();
			quest_slider.max = 100;
			quest_slider.min = 0;
			quest_slider.width = 840;
			quest_slider.marginTop = 595;
			quest_slider.marginLeft = 550;
			quest_slider.pos = value_save;
			quest_slider.animatable = false;
			box_container.addComponent(quest_slider);
		}
		
		button_quest.visible = true;
		
	}
	
	
	// refresh the screen with the next questionnaire item or go on to main game
	public function QuestPagefinished(event: MouseEvent):Void {
		
		// write out value from questionnaire item
		if (item_counter == 1) {
			_item_1 = quest_slider.value;
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
		} else if (item_counter == 14) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_14 = 1;
			} else if (no_rb.selected == true){
				_item_14 = 0;
			}
		} else if (item_counter == 15) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_15 = 1;
			} else if (no_rb.selected == true){
				_item_15 = 0;
			}
		} else if (item_counter == 16) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_16 = 1;
			} else if (no_rb.selected == true){
				_item_16 = 0;
			}
		} else if (item_counter == 17) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_17 = 1;
			} else if (no_rb.selected == true){
				_item_17 = 0;
			}
		} else if (item_counter == 18) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_18 = 1;
			} else if (no_rb.selected == true){
				_item_18 = 0;
			}
		} else if (item_counter == 19) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_19 = 1;
			} else if (no_rb.selected == true){
				_item_19 = 0;
			}
		} else if (item_counter == 20) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_20 = 1;
			} else if (no_rb.selected == true){
				_item_20 = 0;
			}
		} else if (item_counter == 21) {
			// check which radiobutton is activated
			if (yes_rb.selected == true){
				_item_21 = 1;
			} else if (no_rb.selected == true){
				_item_21 = 0;
			} else if (notyet_rb.selected == true){
				_item_21 = 2;
			}
		} else if (item_counter == 22) {
			_item_22 = quest_slider.value;
		} else if (item_counter == 23) {
			_item_23 = quest_slider.value;
		} else if (item_counter == 24) {
			_item_24 = quest_slider.value;
		} else if (item_counter == 25) {
			// check which radiobutton is activated
			if (Likert_1_rb.selected == true){
				_item_25 = 1;
			} else if (Likert_2_rb.selected == true){
				_item_4 = 2;
			} else if (Likert_3_rb.selected == true){
				_item_25 = 3;
			} else if (Likert_4_rb.selected == true){
				_item_25 = 4;
			} else if (Likert_5_rb.selected == true){
				_item_25 = 5;
			} else if (Likert_6_rb.selected == true){
				_item_25 = 6;
			}
		} else if (item_counter == 26) {
			// check which radiobutton is activated
			if (Likert_1_rb.selected == true){
				_item_26 = 1;
			} else if (Likert_2_rb.selected == true){
				_item_26 = 2;
			} else if (Likert_3_rb.selected == true){
				_item_26 = 3;
			} else if (Likert_4_rb.selected == true){
				_item_26 = 4;
			} else if (Likert_5_rb.selected == true){
				_item_26 = 5;
			} else if (Likert_6_rb.selected == true){
				_item_26 = 6;
			}
		}
		
		// remove old content
		disposeQuestionnaireScreen();
		this.removeChildren();
		questionnaire_screen = null;
		
		
		
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
			// check if last question has been answered with yes -> append EMA questions
			if (_item_13 == 1 && item_counter <= 25) {
				
				item_counter = item_counter + 1;
				
				if (item_counter == 21) {
					drawQuestionnaireScreen("threeoptions");
				}
				else if (item_counter == 22 || item_counter == 23 || item_counter == 24) {
					drawQuestionnaireScreen("scale");
				}
				else if (item_counter == 25 || item_counter == 26) {
					drawQuestionnaireScreen("Likert");
				} else {
					drawQuestionnaireScreen("options");
				}
				
			} else {
			item_counter = 1;
			MainGame();
			}
		}
		
		
		
	}
	
	
	//%%%%%%%%% Instruction screens %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	public function drawInstructionScreen(){
		
		// remove old content
		this.removeChildren();
		instruction_screen = new Sprite();
		
		var imgpath_str = "img/Intro_" + Std.string(intro_screen_num) + ".jpg";
		instruction_background = AssetPreparation.loadImage(imgpath_str);
		
		instruction_screen.addChild(instruction_background);
		
		if (intro_screen_num == 12) {
			
			// add button to instruction screens
			var ww = NOMINAL_WIDTH / 3;
			textfield_button = Button.drawButton("Zurück", (NOMINAL_WIDTH / 2) - 300, ((1080 - ww) / 2) + ww + 150, "info");
			textfield_button.addEventListener(MouseEvent.CLICK, InstructionBack,false,0,true);
			instruction_screen.addChild(textfield_button);
			
			continue_button = Button.drawButton("Spielen", (NOMINAL_WIDTH / 2) + 300, ((1080 - ww) / 2) + ww + 150, "info");
			continue_button.addEventListener(MouseEvent.CLICK, InstructionForward,false,0,true);
			instruction_screen.addChild(continue_button);
			
		} else {
	
			// add button to instruction screens
			var ww = NOMINAL_WIDTH / 3;
			textfield_button = Button.drawButton("Zurück", (NOMINAL_WIDTH / 2) - 300, ((1080 - ww) / 2) + ww + 150, "info");
			textfield_button.addEventListener(MouseEvent.CLICK, InstructionBack,false,0,true);
			instruction_screen.addChild(textfield_button);
				
			continue_button = Button.drawButton("Weiter", (NOMINAL_WIDTH / 2) + 300, ((1080 - ww) / 2) + ww + 150, "info");
			continue_button.addEventListener(MouseEvent.CLICK, InstructionForward,false,0,true);
			instruction_screen.addChild(continue_button);
		
		}
		
		instruction_screen.alpha = 0;
		
		this.addChild(instruction_screen);
		
		Actuate.tween(instruction_screen, 1, {alpha: 1});
	
	}
	
	public function InstructionBack (event: MouseEvent):Void {
		
		if (intro_screen_num == 1) {
			Actuate.tween(instruction_screen, 1, {alpha: 0});
			disposeInstructionScreen();
			this.removeChildren();
			instruction_screen = null;
			
			drawMenuScreen();
			
		} else {
			Actuate.tween(instruction_screen, 1, {alpha: 0});
			disposeInstructionScreen();
			this.removeChildren();
			instruction_screen = null;
			
			intro_screen_num = intro_screen_num - 1;
			
			drawInstructionScreen();
		}
		
	}
	
	public function InstructionForward (event: MouseEvent):Void {
		
		if (intro_screen_num == 12) {
			Actuate.tween(instruction_screen, 1, {alpha: 0});
			disposeInstructionScreen();
			this.removeChildren();
			instruction_screen = null;
			
			intro_screens_visited = true;
			intro_screen_num = 1;
			
			drawGallery();
			
		} else {
			Actuate.tween(instruction_screen, 1, {alpha: 0});
			disposeInstructionScreen();
			this.removeChildren();
			instruction_screen = null;
			
			intro_screen_num = intro_screen_num + 1;
			
			drawInstructionScreen();
		}
		
	}
	
	public function onInstruction (event: MouseEvent):Void {
		
		disposeMenuScreen();
		this.removeChildren();
		menu_screen = null;
			
		drawInstructionScreen();
				
	}
	
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	//%%%%%%%%%OUT OF FOCUS FUNCTIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	//what to do if app is out of focus
    private function pause(e:Event):Void{
		
        if (currentGameState == Playing) {
		
			// set game state to paused to stop task evaluation
			currentGameState = Paused;
			// get time stamp of unfocus event
			timestamp_unfocus = Sys.time() * 1000.0;
		
		}

    }
	//app back in focus - start last run again
    private function unpause(e:Event):Void{
		
		if (currentGameState == Paused) {
   
			// check if unfocus was longer than 1 hour (= 3600000 milliseconds)
			timestamp_refocus = Sys.time() * 1000.0;
			
			var delta = timestamp_refocus - timestamp_unfocus;
			
			if (delta >= 3600000) {
			
				// Set round index to 0 as it will be increased to 1 in the newRound function 
				_trial_ind = 0;
				
				// remove circle from screen
				Lib.current.stage.removeChild(circle_selection);
				
				// restart score for reset run
				_score = 0;
				
				// set game state to menu for now
				currentGameState = Menu;
				
				// Resume game
				// start newRound
				DrawLevelscreen();
				
			} else {
				
				// resume game with previous settings
				currentGameState = Playing;
				
			}
		
		}
	
    }

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



//%%%%%%%%%%Random Walks%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	public function generateRandomWalk():Array<Float> {
		
		//Initialise probabilities
		var step:Float;
		var probvalueadd:Float;
		var probabilitiesA:Array<Float>;
		var probabilityB:Float;
		var sum_abs_differences:Float;
		
		var start_prob_draw = random();
		
		if (start_prob_draw >= 0.5) {
		
			probabilitiesA = [0.2];
			sum_abs_differences = Math.abs(0.2-0.8);
			
		} else {
			
			probabilitiesA = [0.8];
			sum_abs_differences = Math.abs(0.8-0.2);
			
		}
		
		// Generate values for a gaussian random walk and append them to the probability values array
		for (i in 0...trials-1) {
			
			step = NormRandom.floatNormal(0,0.1);
			
			while (probabilitiesA[i] + step - 0.03 * (probabilitiesA[i] - 0.5) < 0 || probabilitiesA[i] + step - 0.03 * (probabilitiesA[i] - 0.5) > 1) {
				
				step = NormRandom.floatNormal(0,0.1);
				
			}
			
			probvalueadd = probabilitiesA[i] + step - 0.03 * (probabilitiesA[i] - 0.5);
			probabilitiesA.push(probvalueadd);
			
			// Sum up absolute differences in probability between the two options to be able to check for difficulty of the walk later
			probabilityB = 1 - probvalueadd;
			sum_abs_differences = sum_abs_differences + Math.abs(probvalueadd - probabilityB);
		}
		
		avg_sum_abs_differences = sum_abs_differences / trials;
		
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
		globalscore_display.selectable = false;
		globalscore_display.mouseEnabled = false;
		globalscore_display.text = 'Gesamtscore: $_global_score';

		var globalscore_text:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 60, 0xFFFFFF, true);
		globalscore_text.align = TextFormatAlign.CENTER;
		
		globalscore_display.defaultTextFormat = globalscore_text;
		
		gallery_screen.addChild(globalscore_display);		
		
		// Add button to get back to main menu
		button_end = Button.drawButton("Zurück", Std.int(NOMINAL_WIDTH -150),100, "back");
		button_end.addEventListener(MouseEvent.CLICK, onClick_mainmenu,false,0,true);
		gallery_screen.addChild(button_end);

		button_continue = Button.drawButton("Spielen", Std.int(NOMINAL_WIDTH/2), 1000, "info");
		button_continue.addEventListener(MouseEvent.CLICK, onClick_MainGame,false,0,true);
		gallery_screen.addChild(button_continue);
		
		

		
		add = 280;
		// loop to get pathogens that have been beaten already		
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
			
			else if (i >= 25 && i <= runs) {
				
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
		level_display.width = 1000;
		level_display.height = 200;
		level_display.x = (NOMINAL_WIDTH/2)-500;
		level_display.y = (NOMINAL_HEIGHT/2)-100;
		level_display.selectable = false;
		level_display.mouseEnabled = false;
		level_display.multiline = true;

		var level_text:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 70, 0x000000, true);
		level_text.align = TextFormatAlign.CENTER;
		
		if (_run_ind != runs) {
			
			level_display.text = 'Level $_run_ind';
			
		} else {
			
			level_display.text = 'Level $_run_ind (Bonuslevel!)';
			
		}
		
		level_screen.addChild(level_display);
		
		level_display.defaultTextFormat = level_text;
		
		Actuate.tween(level_screen, 1, {alpha: 0}).delay (2);

		haxe.Timer.delay(pathogenText,2300);
		//pathogenText();

	}
	//insert pathogen information to display but only if 
	function pathogenText(){
		this.removeChildren();
		
		if (debug_mode == "off") {
			haxe.Timer.delay(function() {drawQuestionnaireScreen("scale"); }, 1000);
		} else if (debug_mode == "game only") {
			haxe.Timer.delay(function() {MainGame(); }, 1000);
		}
	}
	
	
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//%%%%%%%%%%INIT FUNCTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	function init() 
	{

		if (inited) return;
		inited = true;

				
		// Listen for exit events and attach sync functions to exit handler
		ExitHandler.setExitHandler(function() {
				
			var database_availability = InternetConnection.isAvailable();
			// Move data from local SQLite database to MariaDB if internet connection is available
			if (database_availability == true) {
				
				var transaction_finished = DatabaseSync.DBSync();
				
				if (transaction_finished == true){
					var database_name_trial = "./" + _id + "_app_data_trial.db";					
					if (FileSystem.exists(Path.join([database_path, database_name_trial]))) {
						FileSystem.deleteFile(Path.join([database_path, database_name_trial]));
					}
					
					var database_name_run = "./" + _id + "_app_data_run.db";
					if (FileSystem.exists(Path.join([database_path, database_name_run]))) {
						FileSystem.deleteFile(Path.join([database_path, database_name_run]));
					}
				}
			}
			
		});
		
		// Prepare assets
		AssetPreparation.getQuestionnaireItems();
		AssetPreparation.getPathogens();
		AssetPreparation.getBackgrounds();
		AssetPreparation.getNotepads();
		AssetPreparation.getScoreBoards();
		AssetPreparation.getSyringes();
		AssetPreparation.getCircleColors();
		
		
		// Initialize HaxeUI toolkit
		Toolkit.init();
		// Add css style rules to increase size of UI components
		Toolkit.styleSheet.addRules(".hslider .slider-value-background { height: 120px !important; }");
		Toolkit.styleSheet.addRules(".hslider .slider-value { background: #F1F1F1 #FFFFFF vertical; }");
		//Toolkit.styleSheet.addRules(".hslider .slider-button { height: 132px !important; width: 60px !important; }");
		Toolkit.styleSheet.addRules(".optionbox-value { height: 80px !important; width: 80px !important; }");
		Toolkit.styleSheet.addRules(".checkbox-value { height: 80px !important; width: 80px !important; }");
		
		// Set initial values
		// Set round index to 0 as it will be increased to 1 in the newRound function
		_trial_ind = 0;
		// Initialize score
		_score = 0;
		// Initialize run finished marker
		_run_finished = 0;
		// Initialize questionnaire item counter
		item_counter = 1;
		// Initialize counter for the instruction screens
		intro_screen_num = 1;
		// Set game state
		currentGameState = Menu;
		
		// Grab system specs
		#if desktop
		_device_type = "desktop";
		#elseif mobile
		_device_type = "mobile";
		#end
			
		_device_os = Capabilities.os;

		//trace(System.applicationStorageDirectory);
		
		// Add listeners for active and inactive focus to the stage
		stage.addEventListener(Event.DEACTIVATE, pause);
        stage.addEventListener(Event.ACTIVATE, unpause);
			
		// Check if user is logged in and retrieve ID
		login_savepath = Path.join([save_path, login_file]);
		if (FileSystem.exists(login_savepath)) {
			
			// Load ID of logged in user
			AppdataJSON.loadLogin();
			// Load appdata
			AppdataJSON.AppdataLoad();
			// determine if instruction needs to be visited
			if (_run_ind == 1) {
				intro_screens_visited = false;
			}
			// Send to main menu
			drawMenuScreen();
			
		} else {
			
			// Send to login & registration page 
			log_and_reg();
			
		}
				
	}
	
	
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	/* SETUP */
	//Entry point of main function: treats it as an object
	public function new() {
		super();	
		
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
		
		stageScaleX = Lib.current.stage.window.width / NOMINAL_WIDTH;
    	stageScaleY = Lib.current.stage.window.height / NOMINAL_HEIGHT;

    	stageScale = Math.min(stageScaleX, stageScaleY);
		//trace(stageScale);
    
    	Lib.current.scaleX = stageScale;
    	Lib.current.scaleY = stageScale;
		
		Toolkit.scaleX = stageScale;
		Toolkit.scaleY = stageScale;
		trace(Toolkit.scaleX);
		trace(Toolkit.scaleY);
			
		//trace(Lib.current.stage.stageWidth);
		//trace(Lib.current.stage.stageHeight);
		
        Lib.current.x = (Lib.current.stage.window.width - NOMINAL_WIDTH * stageScale) / 2;
        Lib.current.y = (Lib.current.stage.window.height - NOMINAL_HEIGHT * stageScale) / 2;
				
	}


//%%%%%%%%%%%% GAME %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	//function that draws the Main Game Screen
	function MainGame() {

		/*if (_trial_ind != 0) {
		// Remove prior instances of the game screen
		disposeGameScreen();
		this.removeChild(game_screen);
		game_screen = null;
		}*/
		
		
		if (_trial_ind == 0) {
			
		
		// get background image associated with level and attach to new sprite
		game_screen = new MainGameScreen();
		
		// Add back button
		button_end = Button.drawButton("Menü", Std.int(NOMINAL_WIDTH -150),50, "back");
		button_end.addEventListener(MouseEvent.CLICK, onClick_end,false,0,true);
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
		
		// add scoreboard to game screen
		Score_Board = new ScoreBoard();
		Score_Board.x = 5;
		Score_Board.y = 10;
		game_screen.addChild(Score_Board);
		
		// Draw score text field
		var scoreFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 30, 0x000000, true);
		scoreFormat.align = TextFormatAlign.LEFT;
		
		scoreField = new TextField();
		scoreField.width = 600;
		scoreField.x = 40; 
		scoreField.y = 50;
		scoreField.defaultTextFormat = scoreFormat;
		scoreField.selectable = false;
		scoreField.mouseEnabled = false;
		scoreField.text = 'Score: $_score';
		game_screen.addChild(scoreField);		
		

		var runFormat:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 30, 0x000000, true);
		runFormat.align = TextFormatAlign.LEFT;
		
		var runField = new TextField();
		runField.width = 600;
		runField.x = 40;
		runField.y = 150;
		runField.defaultTextFormat = scoreFormat;
		runField.selectable = false;
		runField.mouseEnabled = false;
		runField.text = 'Level: $_run_ind';
		game_screen.addChild(runField);
	

		levelFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 30, 0x000000, true);
		levelFormat.align = TextFormatAlign.LEFT;
		
		levelField = new TextField();
		levelField.width = 600;
		levelField.x = 40;
		levelField.y = 100;
		levelField.defaultTextFormat = levelFormat;
		levelField.selectable = false;
		levelField.mouseEnabled = false;
		levelField.text = 'Runde: $_trial_ind von $trials';	
		game_screen.addChild(levelField);


		// Define and format text fields displaying drug outcome
		// A
		var scoreFormat_notepads:TextFormat = new TextFormat(Assets.getFont("fonts/OpenSans-Regular.ttf").fontName, 70, 0x000000, true);
		scoreFormat_notepads.align = TextFormatAlign.CENTER;

		scoreField_A = new TextField();
		game_screen.addChild(scoreField_A);
		scoreField_A.width = 200;
		scoreField_A.height = 200;
		// set up x coordinate depending on lab background (due to differences in notepad design)
		if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 25 || _run_ind == 26 || _run_ind == 27 || _run_ind == 28 || _run_ind == 29 || _run_ind == 30) {
			scoreField_A.x = 470;
		} else if (_run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
			scoreField_A.x = 430;
		} else if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24 || _run_ind == 31) {
			scoreField_A.x = 445;
		}
		// set y lower for labs 3 and 4
		if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24) {
			scoreField_A.y = 420;
		} else {
			scoreField_A.y = 370;
		}
		scoreField_A.multiline = true;
		scoreField_A.defaultTextFormat = scoreFormat_notepads;
		scoreField_A.selectable = false;
		scoreField_A.mouseEnabled = false;

		// B
		scoreField_B = new TextField();
		game_screen.addChild(scoreField_B);
		scoreField_B.width = 200;
		scoreField_B.height = 200;
		// set up x coordinate depending on lab background (due to differences in notepad design)
		if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 25 || _run_ind == 26 || _run_ind == 27 || _run_ind == 28 || _run_ind == 29 || _run_ind == 30) {
			scoreField_B.x = 1270;
		} else if (_run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
			scoreField_B.x = 1230;
		} else if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24 || _run_ind == 31) {
			scoreField_B.x = 1245;
		}
		// set y lower for labs 3 and 4
		if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24) {
			scoreField_B.y = 420;
		} else {
			scoreField_B.y = 370;
		}
		scoreField_B.multiline = true;
		scoreField_B.defaultTextFormat = scoreFormat_notepads;
		scoreField_B.selectable = false;
		scoreField_B.mouseEnabled = false;
		
		// add syringes (full) to game screen
		SyringeA = new Syringe("full", "A");
		SyringeA.x = 400;
		// set up y coordinate depending on lab background (due to differences in notepad design)
		if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
			SyringeA.y = 600;
		} else {
			SyringeA.y = 650;
		}
		SyringeA.addEventListener(MouseEvent.CLICK, PostChoiceA,false,0,true);
		game_screen.addChild(SyringeA);
		
		SyringeB = new Syringe("full", "B");
		SyringeB.x = 1200;
		// set up y coordinate depending on lab background (due to differences in notepad design)
		if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
			SyringeB.y = 600;
		} else {
			SyringeB.y = 650;
		}
		SyringeB.addEventListener(MouseEvent.CLICK, PostChoiceB,false,0,true);
		game_screen.addChild(SyringeB);
		
		
				
		} else {
			
			// set to full syringe A
			SyringeA.removeEventListener(MouseEvent.CLICK, PostChoiceA, false);
			game_screen.removeChild(SyringeA);
			SyringeA = null;
			
			SyringeA = new Syringe("full", "A");
			SyringeA.x = 400;
			// set up y coordinate depending on lab background (due to differences in notepad design)
			if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
				SyringeA.y = 600;
			} else {
				SyringeA.y = 650;
			}
			SyringeA.addEventListener(MouseEvent.CLICK, PostChoiceA,false,0,true);
			game_screen.addChild(SyringeA);
			
			// set to full syringe B
			SyringeB.removeEventListener(MouseEvent.CLICK, PostChoiceB,false);
			game_screen.removeChild(SyringeB);
			SyringeB = null;
			
			SyringeB = new Syringe("full", "B");
			SyringeB.x = 1200;
			// set up y coordinate depending on lab background (due to differences in notepad design)
			if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
				SyringeB.y = 600;
			} else {
				SyringeB.y = 650;
			}
			SyringeB.addEventListener(MouseEvent.CLICK, PostChoiceB,false,0,true);
			game_screen.addChild(SyringeB);
			
			// draw color circle indicating winning color of last round
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
			
			// Remove feedback images
			if (game_screen.contains(img_feedback_correct)) {
				game_screen.removeChild(img_feedback_correct);
			} else {
				game_screen.removeChild(img_feedback_wrong);
			}
			
		}

		// Generate properties for new trial
		newRound();
	}

	
	// handle mouse events from users choice 
	public function PostChoiceA(event: MouseEvent):Void {
		
		// set to empty syringe
		game_screen.removeChild(SyringeA);
		SyringeA = new Syringe("empty", "A");
		SyringeA.x = 400;
		// set up y coordinate depending on lab background (due to differences in notepad design)
		if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
			SyringeA.y = 600;
		} else {
			SyringeA.y = 650;
		}
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
		// set up y coordinate depending on lab background (due to differences in notepad design)
		if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
			SyringeB.y = 600;
		} else {
			SyringeB.y = 650;
		}
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
			
			// If the winning option was selected add reward to score and update score field
			if (drug_choice == 'A') {
				
				_score = Std.int(_score + A_reward);
				scoreField.text = 'Score: $_score';

				// set up x coordinate depending on lab background (due to differences in notepad design)
				if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 25 || _run_ind == 26 || _run_ind == 27 || _run_ind == 28 || _run_ind == 29 || _run_ind == 30) {
					img_feedback_correct.x = 525;
				} else if (_run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
					img_feedback_correct.x = 485;
				} else if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24 || _run_ind == 31) {
					img_feedback_correct.x = 500;
				}
				// set y lower for labs 3 and 4
				if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24) {
					img_feedback_correct.y = 525;
				} else {
					img_feedback_correct.y = 475;
				}
				game_screen.addChild(img_feedback_correct);
				
			}
			
			// If the non-winning option was selected subtract reward from score and update score field
			else if (drug_choice == 'B') {
				
				_score = Std.int(_score - B_reward);
				scoreField.text = 'Score: $_score';
				
				// set up x coordinate depending on lab background (due to differences in notepad design)
				if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 25 || _run_ind == 26 || _run_ind == 27 || _run_ind == 28 || _run_ind == 29 || _run_ind == 30) {
					img_feedback_wrong.x = 1325;
				} else if (_run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
					img_feedback_wrong.x = 1285;
				} else if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24 || _run_ind == 31) {
					img_feedback_wrong.x = 1300;
				}
				// set y lower for labs 3 and 4
				if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24) {
					img_feedback_wrong.y = 525;
				} else {
					img_feedback_wrong.y = 475;
				}
				game_screen.addChild(img_feedback_wrong);
				
			}
			
		
		} else {
			correct_choice = 'B';
									
			// If the winning option was selected add reward to score and update score field
			if (drug_choice == 'B') {
				
				_score = _score + B_reward;
				scoreField.text = 'Score: $_score';
				
				// set up x coordinate depending on lab background (due to differences in notepad design)
				if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 25 || _run_ind == 26 || _run_ind == 27 || _run_ind == 28 || _run_ind == 29 || _run_ind == 30) {
					img_feedback_correct.x = 1325;
				} else if (_run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
					img_feedback_correct.x = 1285;
				} else if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24 || _run_ind == 31) {
					img_feedback_correct.x = 1300;
				}
				// set y lower for labs 3 and 4
				if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24) {
					img_feedback_correct.y = 525;
				} else {
					img_feedback_correct.y = 475;
				}
				game_screen.addChild(img_feedback_correct);
				
			}
			
			// If the non-winning option was selected subtract reward from score and update score field
			else if (drug_choice == 'A') {
				
				_score = _score - A_reward;
				scoreField.text = 'Score: $_score';
				
				// set up x coordinate depending on lab background (due to differences in notepad design)
				if (_run_ind == 1 || _run_ind == 2 || _run_ind == 3 || _run_ind == 4 || _run_ind == 5 || _run_ind == 6 || _run_ind == 25 || _run_ind == 26 || _run_ind == 27 || _run_ind == 28 || _run_ind == 29 || _run_ind == 30) {
					img_feedback_wrong.x = 525;
				} else if (_run_ind == 7 || _run_ind == 8 || _run_ind == 9 || _run_ind == 10 || _run_ind == 11 || _run_ind == 12) {
					img_feedback_wrong.x = 485;
				} else if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24 || _run_ind == 31) {
					img_feedback_wrong.x = 500;
				}
				// set y lower for labs 3 and 4
				if (_run_ind == 13 || _run_ind == 14 || _run_ind == 15 || _run_ind == 16 || _run_ind == 17 || _run_ind == 18 || _run_ind == 19 || _run_ind == 20 || _run_ind == 21 || _run_ind == 22 || _run_ind == 23 || _run_ind == 24) {
					img_feedback_wrong.y = 525;
				} else {
					img_feedback_wrong.y = 475;
				}
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
		
		// Write timestamp to array to later modify run_finished marker
		trial_timestamps[_trial_ind] = _timestamp;
		
		/*// Save timestamp value of first trial to later modify the run_finished column
		if (_trial_ind == 1){
			modification_start = _timestamp;
		}*/

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
			haxe.Timer.delay(MainGame,300);
			
		} else {
			
			// remove circle from stage
			Lib.current.stage.removeChild(circle_selection);
			
			// Inform about end of the run
			data_sync_info = new InfoText ("Ende des Levels!\n\nBitte warten Sie\nwährend Ihr Labor ausgebaut wird!");
			data_sync_info.removeChildAt(1); // remove button from InfoText that is added by default
			game_screen.addChild(data_sync_info);
			
			// call function endLevel with delay of 300 ms	
			haxe.Timer.delay(endLevel,300);
				
			}
		
	}
	
	
	// set up properties for new trial
	private function newRound():Void {
		
		// Adapt trial counter
		if (_trial_ind != trials) {
		
			_trial_ind = _trial_ind + 1;
			
		}
		
		levelField.text = 'Runde: $_trial_ind von $trials';
		
		//Initialise probabilities using a gaussian random walk if a new round has been started
		if (_trial_ind == 1) {
			
			rgw_qc = false;
			
			// redraw random walks until the average sum of absolute differences in probabilities is between 0.4 and 0.5
			while (rgw_qc == false) {
			
				probA = generateRandomWalk();
				//trace(avg_sum_abs_differences);
			
				if (avg_sum_abs_differences >= 0.4 && avg_sum_abs_differences <= 0.5) {
					
					rgw_qc = true;
					
				} else {
					
					untyped probA.length = 0;
					
				}
				
				avg_sum_abs_differences = 0;
			
			}
			
		}
		
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
				
		// Set new values for database
		_p_reward_A = reward_prob_A;
		_p_reward_B = reward_prob_B;
		_reward_A = A_reward;
		_reward_B = B_reward;
		
		if (_trial_ind == 1) {
		// Draw new game screen
		this.addChild(game_screen);
		}
		
		// Resume game
		//everyframe always active when currentGameState=Playing
		//->goes to everyFrame
		currentGameState = Playing;
		
	}
	
	// Evaluate end of Level
	private function endLevel():Void {
		// Change game state
			currentGameState = Menu;
			
				// modify run_finished entry as run is now finalized
				AppdataEntryLite.modifyLiteTrialEntry(trial_timestamps);
				
				// Modify number of runs played and according timestamps
				if (_num_runs_played < 3 && _timestamp_last_run == DateTools.format(Date.now(), "%Y-%m-%d")) {
					_num_runs_played = _num_runs_played + 1;
				}
				
				if (_timestamp_last_run != DateTools.format(Date.now(), "%Y-%m-%d")) {
					_timestamp_last_run = DateTools.format(Date.now(), "%Y-%m-%d");
					_num_runs_played = 1;
				}
				
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
				
				// Check if internet connection is available, if yes: Sync data to central database
				var database_availability = InternetConnection.isAvailable();
				// Move data from local SQLite database to MariaDB if internet connection is available
				if (database_availability == true) {
					
					var transaction_finished = DatabaseSync.DBSync();
					
					if (transaction_finished == true){
						var database_name_trial = "./" + _id + "_app_data_trial.db";					
						if (FileSystem.exists(Path.join([database_path, database_name_trial]))) {
							FileSystem.deleteFile(Path.join([database_path, database_name_trial]));
						}
						
						var database_name_run = "./" + _id + "_app_data_run.db";
						if (FileSystem.exists(Path.join([database_path, database_name_run]))) {
							FileSystem.deleteFile(Path.join([database_path, database_name_run]));
						}
					}
					
				}
				
				// remove old game screen
				disposeGameScreen();
				this.removeChild(game_screen);
				game_screen = null;
				// send to gallery
				//haxe.Timer.delay(function() {drawGallery(); }, 500);
				drawGallery();
				
	}
	
	
//%%%%%%%%%%%% GAME %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

}