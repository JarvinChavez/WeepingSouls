extends Node
class_name NPCMechanics

signal done

var Dialogue
var player
var tween
var locale

func _ready() -> void:
	locale = find_parent("locale")
	Dialogue = locale.get_node("Dialogue")
	tween = locale.get_node("tween")
	player = locale.find_node("player")

	for node in get_children():
		if node is Trigger:
			node.connect("trigger", self, "_on_trigger")

func _on_trigger() -> void:
	pass

func floor_vec2(vector:Vector2) -> Vector2:
	return Vector2(floor(vector.x / 16.0) * 16.0, floor(vector.y / 16.0) * 16.0)

func get_player() -> Node:
	return find_parent("locale").find_node("player")

func done_() -> void:
	emit_signal("done")
	queue_free()
