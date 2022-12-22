extends KinematicBody2D


export(float) var movement_speed = 200

func _physics_process(delta): # basic wasd movement. diagonal movement is faster
	
	var directional_input = Vector2.ZERO
	
	directional_input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	directional_input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	move_and_slide(directional_input * movement_speed)

func _ready():
	pass # Replace with function body.

