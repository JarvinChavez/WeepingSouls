extends Resource

class_name N_PCStats

export(String) var name
export(Array, Resource) var SR
export(int) var Player_Guard
export(Array, Resource) var Inventory
export(Resource) var BWT
export(Resource) var BLT
export(PackedScene) var battle_texture
export(Resource) var world_texture
export(bool) var is_player

var active_SoulRemnant

func is_dead() -> bool:
	for S in SR:  
		if S.hp > 0:
			return false
	return true

export(String, MULTILINE) var text
