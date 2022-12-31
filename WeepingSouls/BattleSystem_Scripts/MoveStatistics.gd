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

enum Type1 {
	None,
	chaotic,
	phantom,
	heat,
	water,
	combat,
	terra,
	corrosive,
	metallic,
	normal,
	ice,
	electric,
	esper, 
	air,
}

enum MoveType {
	attack,
	Special
}


export(String) var Name
export(int) var power = 1
export(int) var accuracy = 1
export(Type1) var type
export(Statuses) var statuses
export(MoveType) var movetype
export(PackedScene) var fx 
export(int) var Surge = 1
