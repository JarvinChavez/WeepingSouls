extends KinematicBody2D


# trigger
signal done

#NPC info
class_name NPC_Mehanics

# states of npc
export(int) var speed: int = 70
export(bool) var active
export(float, 0, 1.0) var Trigger_chance
export (String, "loop", "linear") var walk_method = "linear"
export(String) var NPC_Name
export(String, MULTILINE) var text

#Textures
export(Resource) var BWT 
export(Resource) var BLT
export(PackedScene) var battle_texture
export(Resource) var world_texture


export(Array, Resource) var SoulRemnants
export(int) var Player_Guard
export(Array, Resource) var Inventory

var active_SoulRemnant
func is_dead() -> bool:
	for S in SoulRemnants:  
		if S.hp > 0:
			return false
	return true


var state: String = "patrol"
var direction = 1
var in_sight: bool = false

onready var spot = get_node("spot")
onready var Dialogue = get_node("../../../Dialogue")
onready var tween = get_node("Tween") 
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
				Player.control_lock = true
				battle_getting_ready()
		else:
			return

func  _on_NPC_body_exited(_body_rid, body: Node, _body_shape_index, _local_shape_index):
	if body.name == "player":
		in_sight = false
		state = "patrol"
		
func battle_getting_ready():
	spot.visible = true
	spot.visible = false
	Dialogue.visible = true
	
func done() -> void:
	emit_signal("done")
	queue_free()
	
func _battle_start():
	var inbattle = preload("res://Battle System/NPcvsBattle.tscn").instance()
	$"../../../BattleStart".add_child(inbattle)
