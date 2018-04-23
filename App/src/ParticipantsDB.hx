package;

import sys.db.Types;
import sys.db.Object;

@:id(subject_id)
@:table("participants")
class ParticipantsDB extends Object {
	
	public var subject_id : SUInt;
	public var mail_address : SString<50>;
	public var PW : SString<50>;
	public var contact_cb : SBool;
	
}