extends Position2D

onready var SRstats = find_node("SR_stats")
onready var N_pc = find_node("N_pc") setget set_N_pc, get_N_pc
var SoulRemant setget set_SoulRemnant, get_SoulRemnant

func set_SoulRemnant(value):
	if get_SoulRemnant():
		get_SoulRemnant().free()
	find_node("SoulRemnant").add_child(value.instance())

func get_SoulRemnant() -> Node:
	if find_node("SoulRemnant").get_child_count() > 0:
		return find_node("SoulRemnant").get_child(0)
	return null

func set_N_pc(value):
	N_pc = value

func get_N_pc():
	return get_node_or_null("N_pc")
