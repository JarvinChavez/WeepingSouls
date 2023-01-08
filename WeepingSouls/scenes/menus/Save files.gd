extends ScrollContainer

export(float, 0.5, 1.0, 0.1) var save_scale = 1.0
export(float, 0.5, 1.0, 0.1) var save_curr_scale = 1.3
export(float, 0.1, 1.0, 0.1) var scroll_duration  


var save_curr_index: int = 0
var save_x_position: Array = []

onready var scroll_tween: Tween = Tween.new()
onready var margin_r: int = $CenterContainer/MarginContainer.get("custom_constants/margin_right")
onready var margin_l: int = $CenterContainer/MarginContainer.get("custom_constants/margin_left")
onready var sss: int = $CenterContainer/MarginContainer/HBoxContainer.get("custom_constants/separation")
onready var Saves : Array = $CenterContainer/MarginContainer/HBoxContainer.get_children()

func _ready():
	add_child(scroll_tween)
	yield(get_tree(), "idle_frame")
	
	get_h_scrollbar().modulate.a = 0 
	
	for save in Saves:
		var _save_pos_x = (margin_r + save.rect_position.x) - ((rect_size.x - save.rect_size.x)/2)
		save.rect_pivot_offset = (save.rect_size/2)
		save_x_position.append(_save_pos_x)
	
	scroll_horizontal = save_x_position[save_curr_index]
	scroll()

func _process(delta: float) -> void:
	for _index in range(save_x_position.size()):
		var _save_pos_x: float = save_x_position[_index]
		var _swipe_length: float = (Saves[_index].rect_size.x / 2) + (sss/2)
		var _swipe_curr_length: float = abs(_save_pos_x - scroll_horizontal)
		var _slot_scale: float = range_lerp(_swipe_curr_length, _swipe_length, 0,save_scale, save_curr_scale)
		var _slot_opacity:float = range_lerp(_swipe_curr_length, _swipe_curr_length, 0, 0.3, 1)
		
		_slot_scale = clamp(_slot_scale, save_scale, save_curr_scale)
		_slot_opacity = clamp(_slot_opacity, 0.3, 1)
		
		Saves[_index].rect_scale = Vector2(_slot_scale, _slot_scale)
		Saves[_index].modulate.a = _slot_opacity
		if _swipe_curr_length < _swipe_length:
			save_curr_index = _index

func scroll() -> void:
	scroll_tween.interpolate_property(
		self,
		"scroll_horizontal",
		scroll_horizontal,
		save_x_position[save_curr_index],
		scroll_duration,
		Tween.TRANS_BACK,
		Tween.EASE_IN
	)

	for _index in range(Saves.size()):
		var _slot_scale: float = save_curr_scale if _index == save_curr_index else save_scale
		scroll_tween.interpolate_property(
			Saves[_index],
			"rect_scale",
			Saves[_index].rect_scale,
			Vector2(_slot_scale, _slot_scale),
			scroll_duration,
			Tween.TRANS_QUAD,
			Tween.EASE_OUT)
			
	scroll_tween.start()


func _on_Save_files_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed:
			scroll_tween.stop_all()
		else:
			scroll()


func _on_Save1_button_pressed():
	print('ok')

func _on_Save2_button_pressed():
	print('ok2')

func _on_Save3_button_pressed():
	print('ok3')

func _on_Save4_button_pressed():
	print('ok4')

func _on_Save5_button_pressed():
	print('ok5')
