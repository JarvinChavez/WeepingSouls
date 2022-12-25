extends Resource

class_name SRstats

export var texture : Texture
 
export var Level : int 
export var EXP: int 


export var Health : int
export var Attack : int 
export var Durability : int 
export var Range_attack: int
export var Resistances : int 
export var Speed : int 

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
	air, 
}

export(Type) var type1
export(Type) var type2
