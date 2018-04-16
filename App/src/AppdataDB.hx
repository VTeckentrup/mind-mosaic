package;

import sys.db.Types;
import sys.db.Object;

@:id(timestamp)
@:table("rounds")
class AppdataDB extends Object
{
	public var uid : SInt;
    public var round_ind : SInt;
    public var blue_reward_prob : SFloat;
    public var green_reward_prob : SFloat;
    public var round_reward_prob : SFloat;
    public var choice_correct : SString<5>;
    public var reward_blue : SInt;
    public var reward_green : SInt;
    public var choice_player : SString<5>;
    public var player_won : STinyUInt;
    public var timestamp : SDateTime;

}