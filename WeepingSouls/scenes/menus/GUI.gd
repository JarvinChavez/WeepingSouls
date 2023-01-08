extends CanvasLayer

func _process(delta):
	$FPS_counter.text = "FPS: " + str(Engine.get_frames_per_second())
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

