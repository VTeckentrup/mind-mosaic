package;

import sys.db.Types;
import sys.db.Object;

@:id(subject_id)
@:table("app_user_info")
class AppUserInfo extends Object {
	
	public var subject_id : SId;
	public var mail_address : SString<50>;
	public var password : SString<50>;
	public var cb_consent : STinyUInt;
	public var cb_contact : STinyUInt;
	public var timestamp : SDateTime;
	public var keycode : SInt;
	
}