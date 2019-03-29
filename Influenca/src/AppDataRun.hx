package;

import sys.db.Types;
import sys.db.Object;

@:id(subject_id_app, timestamp)
@:table("app_data_run")
class AppDataRun extends Object {
	
	public var subject_id_app : SUInt;
	public var run_ind : SUInt;
	public var global_score : SInt;
	public var item_1 : SNull<SUInt>;
	public var item_2 : SNull<SUInt>;
	public var item_3 : SNull<SUInt>;
	public var item_4 : SNull<SUInt>;
	public var item_5 : SNull<SUInt>;
	public var item_6 : SNull<SUInt>;
	public var item_7 : SNull<SUInt>;
	public var item_8 : SNull<SUInt>;
	public var item_9 : SNull<SUInt>;
	public var item_10 : SNull<SUInt>;
	public var item_11 : SNull<SUInt>;
	public var item_12 : SNull<SUInt>;
	public var item_13 : SNull<SUInt>;
	public var item_14 : SNull<SUInt>;
	public var item_15 : SNull<SUInt>;
	public var item_16 : SNull<SUInt>;
	public var item_17 : SNull<SUInt>;
	public var item_18 : SNull<SUInt>;
	public var item_19 : SNull<SUInt>;
	public var item_20 : SNull<SUInt>;
	public var item_21 : SNull<SUInt>;
	public var item_22 : SNull<SUInt>;
	public var item_23 : SNull<SUInt>;
	public var item_24 : SNull<SUInt>;
	public var item_25 : SNull<SUInt>;
	public var item_26 : SNull<SUInt>;
	/*public var item_27 : SNull<SUInt>;
	public var item_28 : SNull<SUInt>;
	public var item_29 : SNull<SUInt>;
	public var item_30 : SNull<SUInt>;*/
	public var app_version : SString<8>;
	public var timestamp : SFloat;
	public var runs_played_limit : SUInt;
	public var date_run : SString<10>;
	public var timestamp_run : SFloat;
	
}