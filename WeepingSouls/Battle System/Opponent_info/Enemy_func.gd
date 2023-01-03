extends KinematicBody2D

#NPC info


# trigger



# states of npc
export(int) var speed: int = 70
export(bool) var active
export(float, 0, 1.0) var Trigger_chance
export (String, "loop", "linear") var walk_method = "linear"
var state: String = "patrol"
var direction = 1
var in_sight: bool = false

onready var insight_area = $Noticed_Area
onready var pathfollow = get_parent()
onready var Player = get_node("../../../player")

func _patrol(delta):
	if walk_method == "loop":
		pathfollow.offset += speed * delta
		if rotation == 0:
			rotation_degrees = lerp(rotation_degrees, 0, 0.2)
	else:
		if direction == 1:
			if pathfollow.unit_offset == 1:
				yield(get_tree().create_timer(0.3), "timeout")
				rotation_degrees = lerp(rotation_degrees, 180, 0.1)
				yield(get_tree().create_timer(1), "timeout")
				direction = 0
			else:
				pathfollow.offset += speed * delta
		else:
			if pathfollow.unit_offset == 0:
				yield(get_tree().create_timer(0.3), "timeout")
				rotation_degrees = lerp(rotation_degrees, 0, 0.1)
				yield(get_tree().create_timer(1), "timeout")
				direction = 1
			else:
				pathfollow.offset -= speed * delta

func _physics_process(delta: float) -> void:
		if in_sight:
			_insight()
		if state == "patrol":
			_patrol(delta)
			


func _insight() -> void:
	var area = get_world_2d().direct_space_state
	var result = area.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	if result:
		if result.collider.name == "player" :
			state = "fight"
			look_at(Player.global_position)
	


func _on_NPC_body_entered(_body_rid, body: Node, _body_shape_index, _local_shape_index):
	if body.name == "player":
		state = "fight"
		in_sight = true
		if randf() <= Trigger_chance:
			if active:
				$noticed.visible = in_sight
				Player.control_lock = true
				var inbattle = preload("res://Battle System/NPcvsBattle.tscn").instance()
				$"../../../BattleStart".add_child(inbattle)
		else:
			return

func  _on_NPC_body_exited(_body_rid, body: Node, _body_shape_index, _local_shape_index):
	if body.name == "player":
		in_sight = false
		state = "patrol"
		$noticed.visible = in_sight
