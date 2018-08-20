package;

import sys.db.Types;
import sys.db.Object;

@:id(subject_id_app, timestamp)
@:table("app_data_run")
class AppDataRun extends Object {
	
	public var subject_id_app : SUInt;
	public var run_ind : SUInt;
	public var global_score : SInt;
	public var item_1 : SUInt;
	public var item_2 : SUInt;
	public var item_3 : SUInt;
	public var item_4 : SUInt;
	public var item_5 : SUInt;
	public var item_6 : SUInt;
	public var item_7 : SUInt;
	public var item_8 : SUInt;
	public var item_9 : SUInt;
	public var item_10 : SUInt;
	public var item_11 : SUInt;
	public var item_12 : SUInt;
	public var item_13 : SUInt;
	/*public var item_14 : SUInt;
	public var item_15 : SUInt;
	public var item_16 : SUInt;
	public var item_17 : SUInt;
	public var item_18 : SUInt;
	public var item_19 : SUInt;
	public var item_20 : SUInt;
	public var item_21 : SUInt;
	public var item_22 : SUInt;
	public var item_23 : SUInt;
	public var item_24 : SUInt;
	public var item_25 : SUInt;
	public var item_26 : SUInt;
	public var item_27 : SUInt;
	public var item_28 : SUInt;
	public var item_29 : SUInt;
	public var item_30 : SUInt;*/
	public var app_version : SString<8>;
	public var timestamp : SFloat;
	public var runs_played_limit : SUInt;
	public var date_run : SString<10>;
	
}