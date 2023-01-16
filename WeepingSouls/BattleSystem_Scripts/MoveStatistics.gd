extends Resource

class_name MoveStats

enum Statuses {
	None, 
	burn1,
	burn2,
	poisoned,
	stunned,
	bleeding,
	blighted,
	insanity,
	headache,
	frostbite,
}

enum Type {
	heat,
	water,
	symbiotic,
	ice,
	combat,
	terra,
	esper,
	phantom,
	metallic,
	corrosive,
	chaotic,
	air,
	None,
}

enum De_buff {
	attack_down,
	attack_up,
	durability_down,
	durability_up,
	special_down,
	special_up,
	resistance_down,
	resistance_up,
	speed_down,
	speed_up,
	ability_negated,
	damage_chunk,
	item_negation,
	debuff_removal,
	debuff_bounce,
	self_healing,
	anti_healing,
	status_removal,
	Overwelming_fear,
	Overwhelming_rage,
	overwhelming_doubt,
	overwhelming_loneliness,
	overwhelming_guilt,
	
}



export(String) var Name
export(int) var power = 1
export(int) var accuracy = 1
export(Type) var type
export(Statuses) var statuses
export(int, "attack", "special") var movetype
export(PackedScene) var fx 
export(int) var Surge = 1
