package;

import sys.db.Types;
import sys.db.Object;

@:id(ID)
@:table("app_mail_queue")
class AppMailQueue extends Object {
	
	public var ID : SId;
	public var mail_address : SString<128>;
	public var mail_type_id : SInt;
	public var code : SString<6>;
	
}