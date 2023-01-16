#extends Node
#class_name NPCMechanics
#
#signal done
#
#var Dialogue
#var player
#var tween
#var locale
#
#func _ready() -> void:
#	locale = find_parent("locale")
#	Dialogue = locale.get_node("Dialogue")
#	tween = locale.get_node("tween")
#	player = locale.find_node("player")
#
#	for node in get_children():
#		if node is Trigger:
#			node.connect("trigger", self, "_on_trigger")
#
#func _on_trigger() -> void:
#	pass
#
#func floor_vec2(vector:Vector2) -> Vector2:
#	return Vector2(floor(vector.x / 16.0) * 16.0, floor(vector.y / 16.0) * 16.0)
#
#func get_player() -> Node:
#	return find_parent("locale").find_node("player")
#
#func done_() -> void:
#	emit_signal("done")
#	queue_free()

#NPC NOTICE
#extends Node2D
#
#class_name GenericEncounter
#
#var text:TextModel
#
#func _ready() -> void:
#	.pause_controls = true
#
#	var trainer = get_parent()
#
#	trainer.get_node("spot").visible = true
#	trainer.get_node("spot_audio").play()
#
#	var move_to = floor_vec2(.position) + .position.direction_to(trainer.position) * 20.0
#	tween.interpolate_property(trainer, "position", null, move_to, 3.0, Tween.TRANS_LINEAR, Tween.EASE_IN, 1.0)
#	yield(tween.block(), "done")
#	trainer.get_node("spot").visible = false
#	info_box.visible = true
#
#	for l in text.text.split("\n"):
#		if l.empty():
#			continue
#		yield(info_box.set_text_for_confirm(l), "done")
#
#	done_() 
