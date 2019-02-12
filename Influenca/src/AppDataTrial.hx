package;

import sys.db.Types;
import sys.db.Object;

@:id(subject_id_app, timestamp)
@:table("app_data_trial")
class AppDataTrial extends Object
{
	public var subject_id_app : SUInt;
	public var trial_ind : SUInt;
    public var run_ind : SUInt;
    public var p_reward_a : SFloat;
    public var p_reward_b : SFloat;
    public var p_draw_a : SFloat;
    public var drawn_outcome : SString<1>;
    public var reward_a : SUInt;
    public var reward_b : SUInt;
    public var choice : SString<1>;
    public var win : STinyUInt;
	public var score : SFloat;
	public var run_finished : STinyUInt;
    public var timestamp : SFloat;
	public var device_type : SString<20>;
	public var device_os : SString<20>;

}