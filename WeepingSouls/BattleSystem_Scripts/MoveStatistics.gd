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
	None,     #0
	chaotic,  #1
	phantom,  #2
	heat,     #3
	water,    #4
	combat,   #5
	terra,    #6
	corrosive,#7
	metallic, #8
	ice,      #9
	electric, #10
	esper,    #11
	air,      #12
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
