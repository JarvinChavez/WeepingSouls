extends CanvasLayer

onready var player  = $"../player"
onready var Utility_Menus = $Utility_menus
onready var Soul_Remnants = $Soul_Remnants_Menu
onready var Inventory_menu = $Inventory_Menu
onready var Soul_Archives_menu = $Soul_Archieves_menu


func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("Utility_Menu"):
		Utility_Menus.visible = not Utility_Menus.visible
		Soul_Remnants.visible = false
		

func _on_Soul_Remnants_pressed():
	Soul_Remnants.visible = true
	player.control_lock = true
	Utility_Menus.visible = false
	if Soul_Remnants.visible == false:
		Utility_Menus.visible = true

func _on_Inventory_pressed():
	Inventory_menu.visible = true
	player.control_lock = true 

func _on_Soul_Archieves_pressed():
	Soul_Archives_menu.visible = true
	player.control_lock = true

func _on_Save_pressed():
	pass # Replace with function body.
	
func _on_Close_pressed():
	Utility_Menus.visible = false
	Soul_Remnants.visible = false
	Inventory_menu.visible = false
	Soul_Archives_menu.visible = false
	player.control_lock = false 
