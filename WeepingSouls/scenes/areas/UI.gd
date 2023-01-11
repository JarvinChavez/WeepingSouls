extends CanvasLayer

onready var utility_menu = preload("res://scenes/menus/Utility_menu.tscn")

func _input(event):
	if Input.is_key_pressed(KEY_Q):
		add_child(utility_menu)
