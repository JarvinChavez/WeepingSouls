extends Resource


class_name MoveStat

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
	frostbite
}

enum Type {
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
	air
}

export(String) var name
export(int) var power = 1
export(int) var accuracy = 1
export(Type) var type
export(Statuses) var statuses
export(PackedScene) var Texture