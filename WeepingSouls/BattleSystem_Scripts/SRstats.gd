extends Resource

class_name SRstats


signal name_changed 
signal level_changed
signal hp_changed
signal max_hp_changed
signal xp_changed

enum Type1 {
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
	none,
}



export(String) var name:String setget set_name
export(Type1) var type
export(Type1) var type2
export(int) var level:int  setget set_level, get_level
export(int) var exp_stat:int = 1
export(int) var xp:int = 1 setget set_xp
export(int) var hp:int setget set_hp
export(int) var max_hp:int setget set_max_hp
export(int) var attack:int = 1
export(int) var durability:int = 1
export(int) var range_attack:int = 1
export(int) var resistance:int = 1
export(int) var speed:int = 1
export(bool) var wild:int
export(Array, Resource) var EquippedMoves
export(Dictionary) var Moveset
export(PackedScene) var Texture

func prop_change_(property:String, from, to) -> void:
	emit_signal(property + "_changed", from, to)
	emit_signal("changed")

func set_name(value:String) -> void:
	var previous := name
	name = value
	prop_change_("name", previous, value)


func set_level(value) -> void:   # does nothing but looks cool
	pass

func set_hp(value:int) -> void:  # Leave this error, we want to keep them as ints not floats
	var previous_hp := hp
	hp = max(0, value)         
	prop_change_("hp", previous_hp, value)

func set_max_hp(value:int) -> void:
	var previous_max_hp := max_hp
	max_hp = value
	prop_change_("max_hp", previous_max_hp, value)

func set_xp(value:int) -> void:
	var previous_exp := xp
	xp = value
	prop_change_("xp", previous_exp, value)
	
	
	
# defeating an Opponent exp gain
func is_dead() -> bool:
	return hp <= 0

func get_exp_if_beat() -> float:
	return float(get_level()) * float(exp_stat) * (1.5 if wild else 2.0)

const exp_table_ = {
	"fast": [100, 51, 21, 6, 0]
}

func get_level() -> int:
	for i in exp_table_.fast.size():
		if xp >= exp_table_.fast[i]:
			return exp_table_.fast.size() - i
	return 1

