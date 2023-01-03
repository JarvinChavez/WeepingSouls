extends KinematicBody2D

const ACCELERATION = 600
const MAX_SPEED = 200
const FRICTION = 500

var velocity = Vector2.ZERO
var control_lock = false

func _physics_process(delta): # basic wasd movement. diagonal movement is faster
	
	if not control_lock:
		var input_vector = Vector2.ZERO
		
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
		
		if input_vector != Vector2.ZERO:
			velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
		move_and_slide(velocity, Vector2(0,0), false, 4, 0.785, false)


