extends Resource

class_name Items_resources

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

enum Type_boost {
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

enum appliedbuff{
	None
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
	own_health_manipulation,
	Statuses,
	Type_boost
	
}

export(Texture) var item_sprite
export(int) var item_Id
export(String) var name:String
export(String, MULTILINE) var Description
export(appliedbuff) var item_effect 
export(float) var boost_amount = 1.0
export(Type_boost) var type_boosted
export(float) var type_boost_amount = 1.0
export(Statuses) var afflicted_status
export(int) var health_manipulated 
export(bool) var Consumed
export(bool) var used 
export(bool) var is_disabled
export(int) var quantity




