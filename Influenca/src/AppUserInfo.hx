package;

import sys.db.Types;
import sys.db.Object;

@:id(subject_id_app)
@:table("app_user_info")
class AppUserInfo extends Object {
	
	public var subject_id_app : SId;
	public var mail_address : SString<50>;
	public var password : SString<30>;
	public var pw_salt : SString<20>;
	public var cb_consent : STinyUInt;
	public var cb_contact : STinyUInt;
	public var timestamp : SFloat;
	public var keycode : SInt;
	public var keycode_entered : SInt;
	
}