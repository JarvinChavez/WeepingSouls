extends CanvasLayer

var menu_origin := Vector2.ZERO
var menu_size := Vector2.ZERO

var prev_menu
var current_menu
var menu_stack := []

onready var tween = $Tween
onready var player  = $"../player"
onready var Utility_Menus = $Utility_menus
onready var Soul_Remnants = $Soul_Remnants_Menu
onready var Inventory_menu = $Inventory_Menu
onready var Soul_Archives_menu = $Soul_Archieves_menu
onready var time = $Timer
onready var Close = $Utility_menus/VBoxContainer/Close

func _ready() -> void:
	menu_origin = Vector2(0,0)
	menu_size = get_viewport().size
	set_process_input(true)

func _input(_event):
	if Utility_Menus.visible == false:
		if Input.is_action_just_pressed("Utility_Menu"):
			if menu_stack.size() != 0:
				prev_menu = menu_stack.back()
				prev_menu.hide()
				menu_stack.pop_back()
			current_menu = Utility_Menus
			menu_stack.append(current_menu)
			get_tree().get_root().set_disable_input(true)
			Utility_Menus.show()
			time.start()
			tween.interpolate_property(Utility_Menus, "rect_global_position", Utility_Menus.rect_global_position, Vector2(0, Utility_Menus.rect_position.y), 0.5, tween.EASE_IN, tween.EASE_OUT, 0.5)
			tween.start()
			yield(time, "timeout")
			get_tree().get_root().set_disable_input(false)
			

	else:
		if menu_stack.has(current_menu):
			if Input.is_action_just_pressed("Utility_Menu"):
				get_tree().get_root().set_disable_input(true)
				time.start()
				tween.interpolate_property(Utility_Menus, "rect_global_position", Utility_Menus.rect_global_position, Vector2(-Utility_Menus.rect_size.x, Utility_Menus.rect_position.y), 0.5, tween.EASE_IN, tween.EASE_OUT, 0.5)
				tween.start()
				yield(time, "timeout")
				Utility_Menus.hide()
				menu_stack.pop_back()
				get_tree().get_root().set_disable_input(false)




func _on_Soul_Remnants_pressed():
	current_menu.hide()
	menu_stack.pop_back()
	current_menu = Soul_Remnants
	menu_stack.append(current_menu)
	Soul_Remnants.show()
	

func _on_Inventory_pressed():
	prev_menu = menu_stack.back()
	prev_menu.hide()
	menu_stack.pop_back()
	current_menu = Inventory_menu
	menu_stack.append(current_menu)
	Inventory_menu.show()


func _on_Soul_Archieves_pressed():
	prev_menu = menu_stack.back()
	prev_menu.hide()
	menu_stack.pop_back()
	current_menu = Soul_Archives_menu
	menu_stack.append(current_menu)
	Soul_Archives_menu.show()


func _on_Save_pressed():
	pass


func _on_Close_pressed():
	Close.disabled = true
	time.start()
	tween.interpolate_property(Utility_Menus, "rect_global_position", Utility_Menus.rect_global_position, Vector2(-Utility_Menus.rect_size.x, Utility_Menus.rect_position.y), 0.5, tween.EASE_IN, tween.EASE_OUT, 0.5)
	tween.start()
	yield(time, "timeout")
	Utility_Menus.hide()
	menu_stack.pop_back()
	Close.disabled = false


func _on_Return_pressed():
		current_menu.hide()
		Utility_Menus.show()
		
