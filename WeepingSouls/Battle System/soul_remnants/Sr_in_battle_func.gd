extends Menu

onready var DialogueBox = $Dialogue_Box

export(Array, Resource) var SoulRemnant setget set_battleSR

func set_battleSR(value) -> void:
	SoulRemnant = value
	invalidate_()

func invalidate_() -> void:
	clear()

	for S in SoulRemnant:
		var Menu_Instance = preload("res://Battle System/battle_storage/Button_Battle.tscn").instance()
		var Default_info = preload("res://Battle System/player_info/Default_info.tscn").instance()
		Default_info.set_from_SoulRemnants(S)
		Menu_Instance.add_child(Default_info)
		Menu_Instance.off = S.hp <= 0
		add_Menu_Instance(Menu_Instance)
	
	for R in SoulRemnant.size():
		if SoulRemnant[R].hp > 0:
			select_(R, true)
			break

func _on_visibility_changed():
	if visible:
		invalidate_()
