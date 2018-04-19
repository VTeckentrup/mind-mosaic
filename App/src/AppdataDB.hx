package;

import sys.db.Types;
import sys.db.Object;

@:id(timestamp)
@:table("app_data")
class AppdataDB extends Object
{
	public var subject_id : SUInt;
    public var round_index : SUInt;
    public var blue_reward_prob : SFloat;
    public var green_reward_prob : SFloat;
    public var round_reward_prob : SFloat;
    public var correct_choice : SString<5>;
    public var reward_blue : SUInt;
    public var reward_green : SUInt;
    public var choice_player : SString<5>;
    public var player_wins : STinyUInt;
    public var timestamp : SDateTime;

}