extends Node2D

onready var tween_:Tweenkies = $tween
onready var info_box_ = $Dialoguebox

#constants:
const PauseScreen = preload("res://scenes/menus/pauseMenu/pauseScreen.tscn")

func floor_vec2(vector:Vector2) -> Vector2:
	return Vector2(floor(vector.x / 16.0) * 16.0, floor(vector.y / 16.0) * 16.0)

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("trainer"):
		node.connect("encounter", self, "_on_encounter", [node])

var db_ := {}

func _on_encounter(trainer) -> void:

	var battle = preload("res://Battle System/Battle_System.tscn").instance()
	battle.Opponent = trainer.trainer
	$c.add_child(battle)
	yield(battle, "done")
	$music.stop()
	battle.queue_free()
	
	trainer.emit_signal("beat")
	
	
# for the pause screen:
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		var pause_menu = PauseScreen.instance()
		add_child(pause_menu)
