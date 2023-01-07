extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/NewGameButton.grab_focus()

func _on_NewGameButton_pressed():
	get_tree().change_scene("res://scenes/areas/baseArea.tscn") # replace this with firstScene once its done.

"res://Battle System/scenes/Menu.gd"
func _on_LoadGameButton_pressed():
	get_tree().change_scene("res://scenes/menus/Save files.tscn")

func _on_OptionsButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()
