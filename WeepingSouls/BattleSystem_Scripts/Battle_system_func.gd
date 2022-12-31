extends Node

signal action_choosen
signal action_applied
signal done

export(Resource) var Player
export(Resource) var Enemy

onready var info_box_ = find_node("In_battle_text")
onready var Battle_Buttons = find_node("Battle_Buttons")
onready var Inventory = find_node("Inventory")
onready var Attack_ = find_node("Attacks_menu")
onready var SoulRemnants_ = find_node("Sr_in_battle")
onready var Options_menu = find_node("Options_Menu")
onready var Player_Textures_ = find_node("Player")
onready var Enemy_Textures_ = find_node("Enemy")

var menu_stack_ := []

class Action:
	enum Type {
		Attack,
		Swap_SR,
		Player_Guard,
		Inventory,
		Escape,
		cancel
	}
	
	func _init(type:int, idx:int) -> void:
		self.type = type
		self.idx = idx

	var type:int = Type.cancel
	var idx := 0

# In battle menus and textures
func _ready():
	Player_Textures_.N_pc.replace_by_instance(Player.battle_texture)
	Enemy_Textures_.N_pc.replace_by_instance(Enemy.battle_texture)
	
	Battle_Buttons.set_process_input(false)
	Battle_Buttons.connect("Attack_Button", self, "push_menu_", [find_node("Attacks_menu")])
	Battle_Buttons.connect("Inventory_Button", self, "push_menu_", [Inventory])
	Battle_Buttons.connect("Escape_Button", self, "_on_esc")
	Battle_Buttons.connect("Swap_Button", self, "push_menu_", [SoulRemnants_])
	Battle_Buttons.connect("Swap_Button", SoulRemnants_.In_battle_text, "set_text", ["?"])

	Attack_.connect("activated", self, "_on_Attacks_activated")
	Attack_.set_process_input(false)

	Inventory.connect("activated", self, "_on_Inventory_activated")
	Inventory.set_process_input(false)

	SoulRemnants_.SoulRemnant = Player.SR_pos_A
	SoulRemnants_.set_process_input(false)
	SoulRemnants_.connect("activated", self, "_on_SR_activated")

	Options_menu.set_process_input(false)
	Options_menu.connect("activated", self, "_on_Options_activated")

	game_()
	

func push_menu_(menu) -> void:
	if not menu_stack_.empty():
		menu_stack_.back().visible = false
		menu_stack_.back().set_process_input(false)

	if menu_stack_.size() > 0:
		menu.connect("cancel", self, "pop_menu_", [])

	menu_stack_.push_back(menu)
	menu.visible = true
	menu.set_process_input(true)

func pop_menu_() -> void:
	if menu_stack_.empty():
		return

	var popped_menu = menu_stack_.pop_back()
	popped_menu.visible = false
	popped_menu.set_process_input(false)
	if popped_menu.is_connected("cancel", self, "pop_menu_"):
		popped_menu.disconnect("cancel", self, "pop_menu_")

	if menu_stack_.empty():
		return
	
	menu_stack_.back().set_process_input(true)
	menu_stack_.back().visible = true
	
# Each Button click function:
func _on_esc() -> void:
	emit_signal("action_choosen", Action.new(Action.Type.Escape, 0))

func _on_Inventory_activated(Inventory_idx:int) -> void:
	pop_menu_()

func _on_Attack_activated(Attack_idx:int) -> void:
	pop_menu_()
	pop_menu_()
	emit_signal("action_choosen", Action.new(Action.Type.Attack, Attack_idx))
	
func _on_SR_activated(SoulRemant_idx:int) -> void:
	pop_menu_()
	pop_menu_()
	emit_signal("action_choosen", Action.new(Action.Type.Swap_SR, SoulRemant_idx))

func _on_Options_activated(Options_idx:int) -> void:
	if Options_idx == 0:
		push_menu_(SoulRemnants_)
	else:
		emit_signal("action_choosen", Action.new(Action.Type.cancel, 0))

#######################################################################################################################################
func damage_after_types(onOffense, onDefense, move: MoveStats, type:SRstats):
	var raw_dam = 0
	if onOffense.movetype == 0:
		var movedp = ((move.power * 0.1) * (onOffense.attack * 0.1))
		var pre_roll = (movedp - (onDefense.durability * 0.4)) - 10
		var HL_Rolls = (randf() * 10) + pre_roll
		raw_dam += HL_Rolls
	if onOffense.movetype == 0:
		var movedp = ((move.power * 0.1) * (onOffense.range_attack * 0.1))
		var pre_roll = (movedp - (onDefense.resistance * 0.4)) - 10
		var HL_Rolls = (randf() * 10) + pre_roll
		raw_dam += HL_Rolls
		
	var TMC_dam = 0
	var Neutral_dam = 1
	var NVE_dam = 0.5
	var VE_dam = 2
	var Move_type = move.type
	var onDefense_type = type.type
	var onDefense_type2 = type.type1
	if Move_type == 0:
		pass
	elif Move_type == 1: #chaotic Attacking
		if onDefense_type == 1: #chaotic
			if onDefense_type2  == 0: #chaotic
				TMC_dam = raw_dam * (0.5)
			if onDefense_type2  == 1: #chaotic
				pass
			elif onDefense_type2 == 2:  #Chaotic/Phantom
				type
			elif onDefense_type2  == 3: #Heat
				pass
			elif onDefense_type2  == 4: #Water
				pass
			elif onDefense_type2 == 5: #Combat
				pass
			elif onDefense_type2  == 6: #Terra
				pass
			elif onDefense_type2  == 7: #Corrosive
				pass
			elif onDefense_type2  == 8: #Metallic
				pass
			elif onDefense_type2 == 9: #Ice
				pass
			elif onDefense_type2  == 10: #Electric
				pass
			elif onDefense_type2  == 11: #Esper
				pass
			elif onDefense_type2  == 12: #Air
				pass
		elif onDefense_type == 2: #Phantom
			pass
		elif onDefense_type == 3: #Heat
			pass
		elif onDefense_type == 4: #Water
			pass
		elif onDefense_type == 5: #Combat
			pass
		elif onDefense_type == 6: #Terra
			pass
		elif onDefense_type == 7: #Corrosive
			pass
		elif onDefense_type == 8: #Metallic
			pass
		elif onDefense_type == 9: #Ice
			pass
		elif onDefense_type == 10: #Electric
			pass
		elif onDefense_type == 11: #Esper
			pass
		elif onDefense_type == 12: #Air
			pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass
	elif Move_type == 1:
		pass	


# turn cycle
func get_next_player_move_():
	Battle_Buttons.select_(0)
	push_menu_(Battle_Buttons)
	return self

func get_next_enemy_move_() -> int:
	return int(round(rand_range(0, Enemy.active_SoulRemnant.moves.size() - 1)))

func apply_player_swap_SRfunc_(SoulRemnant_idx:int) -> void:
	apply_swap_SoulRemnants_(Player, SoulRemnant_idx, get_node("Player"))

func apply_enemy_swap_SRfunc_(SoulRemnant_idx:int) -> void:
	apply_swap_SoulRemnants_(Enemy, SoulRemnant_idx, get_node("Enemy"))

func invalidate_attack_menu_(SoulRemnant) -> void:
	Attack_.clear()

	for move in SoulRemnant.moves:
		Attack_.add_text_menu_item(move.Name)
		

# adding remnants
func apply_swap_SoulRemnants_(N_pc:N_PCStats, SoulRemnant_idx:int, Textures:Node) -> void:
	if N_pc.SoulRemnant.size() <= SoulRemnant_idx:
		return

	var SoulRemnant:SRstats = N_pc.SoulRemnant[SoulRemnant_idx]
	
	var SoulRemant:SRstats = N_pc.SoulRemnant[SoulRemnant_idx]
	if N_pc.active_SoulRemnant:
		if N_pc.active_SoulRemnant.hp > 0:
			yield(info_box_.set_text("Enough! Come back!"), "done")
			Textures.stats.visible = false
			yield(Textures.SoulRemnants.withdraw(), "done")
			Textures.SoulRemnant.queue_free()

	Textures.N_pc.exit($tween)
	yield($tween.block(), "done")

	var go_text = "Go! %s!" % SoulRemnant.name
	if not N_pc.is_player:
		go_text = "%s sent out %s." % [N_pc.name, SoulRemant.Name]

	yield(info_box_.set_text(go_text), "done")
	Textures.stats.visible = true

	Textures.SoulRemants = SoulRemant.battle_textures

	if N_pc.is_player:
		Textures.SoulRemnant.show_back()
	else:
		Textures.SoulRemant.show_front()

	N_pc.active_SoulRemnants = SoulRemant
	Textures.find_node("SR_stats").set_from_SoulRemnant(SoulRemant)
	
	if N_pc.is_player:
		invalidate_attack_menu_(SoulRemnant)
	
	yield(Textures.SoulRemnant.enter(), "done")

	info_box_.clear_text()

	emit_signal("action_applied")

# attacking sequence
func apply_player_attack_(move_idx:int) -> void:
	apply_attack_(Player.active_SoulRemnant, Enemy.active_SoulRemnant, get_node("Player"), get_node("Enemy"), move_idx)

func apply_enemy_attack_(move_idx:int) -> void:

	apply_attack_(Enemy.active_SoulRemnant, Player.active_SoulRemnant, get_node("Enemy"), get_node("Player"), move_idx)
func apply_attack_(onOffense:SRstats, onDefense:SRstats, Attacking_Textures:Node, Defending_Textures:Node, move_idx:int) -> void:
	if onOffense.moves.size() <= move_idx:
		return

	var move:MoveStats = onOffense.moves[move_idx]

	var e := "Enemy " if onOffense == Enemy.active_SoulRemnant else ""

	yield(info_box_.set_text("%s%s used %s!" % [e, onOffense.name, move.name]), "done")
	if move.fx:
		var fx = move.fx.instance()
		fx.Defender_Textures = Defending_Textures.find_node("SoulRemnant")
		fx.attacker_Textures = Attacking_Textures.find_node("SoulRemnant")
		fx.info_box = info_box_
		add_child(fx)
		yield(fx.play(), "done")
		fx.queue_free()

	var Damage = damage_(onOffense, onDefense, move)
	var critical = 1.5 if randf() > 0.9 else 1.0
	
	onDefense.hp -= Damage * critical
	yield(Defending_Textures.find_node("SR_stats").animate_hp(onDefense.hp), "animate_hp_done")

	if critical >= 1.5:
		yield(info_box_.set_text_for_confirm("Critical hit!"), "done")

	info_box_.clear_text()
	emit_signal("action_applied")

# character design in combat
func game_() -> void:
	Player_Textures_.N_pc.show_back()
	Enemy_Textures_.N_pc.show_front()
	Player_Textures_.N_pc.begin($tween)
	Enemy_Textures_.N_pc.begin($tween)
	yield($tween.block(), "done")
	
	var begin_battle = Enemy.battle_begin
	for line in begin_battle.text.split("\n"):
		yield(info_box_.set_text_for_confirm(line), "done")

	yield(info_box_.set_text_for_confirm("%s wants to fight!" % Enemy.name), "done")
	info_box_.clear_text()

	apply_enemy_swap_SRfunc_(0)
	yield(self, "action_applied")
	
	apply_player_swap_SRfunc_(0)
	yield(self, "action_applied")

	while true:
		var player_action = yield(get_next_player_move_(), "action_choosen")
		var enemy_move = get_next_enemy_move_()
		
		pop_menu_()
		pop_menu_()
		
		match player_action.type:
			Action.Type.Attack:
				apply_player_attack_(player_action.idx)
				yield(self, "action_applied")
			Action.Type.Swap_SR:
				apply_player_swap_SRfunc_(player_action.idx)
				yield(self, "action_applied")
			Action.Type.Escape:
				yield(info_box_.set_text_for_confirm("You begin to Escape away..."), "done")
				emit_signal("done")

		if Enemy.active_SoulRemnant.is_dead():
			Enemy_Textures_.stats.visible = false
			yield(Enemy_Textures_.get_pokemon().faint(), "done")
			yield(info_box_.set_text_for_confirm("Enemy %s fainted!" % Enemy.active_SoulRemnant.name), "done")

			var last_level = Player.active_SoulRemnant.level
			Player.active_SoulRemnant.xp += Enemy.active_SoulRemnant.get_exp_if_beat()
			yield(info_box_.set_text_for_confirm("%s gained %d EXP." % [Player.active_SoulRemnant.name, Enemy.active_SoulRemnant.get_exp_if_beat()]), "done")
			
			if last_level != Player.active_SoulRemnant.level:
				Player_Textures_.SoulRemants.level_up()
				Player_Textures_.stats.set_from_pokemon(Player.active_SoulRemnant)
				yield(info_box_.set_text_for_confirm("%s leveled up!" % [Player.active_SoulRemnant.name]), "done")
				var move_to_learn = Player.active_SoulRemnant.moves_to_learn.get(Player.active_SoulRemnant.level)
				if move_to_learn:
					Player_Textures_.SoulRemants.learn()
					yield(info_box_.set_text_for_confirm("%s learnt %s!" % [Player.active_pokemon.name, move_to_learn.name]), "done")
					Player.active_SoulRemnant.moves.push_back(move_to_learn)
					invalidate_attack_menu_(Player.active_SoulRemnant)

			if Enemy.is_dead():
				yield(info_box_.set_text_for_confirm("%s is defeated!" % Enemy.name), "done")
				break

			var next_Enemy_SoulRemnant_idx = Enemy.SoulRemnant.find(Enemy.active_SoulRemnant) + 1
			var next_Enemy_SoulRemnant = Enemy.SoulRemnant[next_Enemy_SoulRemnant_idx]
			yield(info_box_.set_text("%s is about to use %s." % [Enemy.name, next_Enemy_SoulRemnant.name]), "done")
			yield(info_box_.set_text("Will %s?" % [Player.name], 0.0), "done")

			push_menu_(Options_menu)
			var action:Action = yield(self, "action_choosen")
			info_box_.clear_text()
			if action.type == Action.Type.Swap_SR:
				apply_player_swap_SRfunc_(action.idx)
				yield(self, "action_applied")
			
			pop_menu_()

			apply_enemy_swap_SRfunc_(next_Enemy_SoulRemnant)
			yield(self, "action_applied")
			continue
			
		apply_enemy_attack_(enemy_move)
		yield(self, "action_applied")
		
		if Player.active_SoulRemnant.hp <= 0:
			yield(info_box_.set_text("%s fainted." % Player.active_SoulRemnant.name), "done")
			Player_Textures_.stats.visible = false
			yield(Player_Textures_.SoulRemants.faint(), "done")
			
			if Player.is_dead():
				yield(info_box_.set_text("You're out of Soul Remants. You lose"), "done")
				break
			else:
				push_menu_(SoulRemnants_)
				SoulRemnants_.In_battle_text.set_text("Which Soul Remnant would you like to summon?")
				info_box_.clear_text()
				var action:Action = yield(self, "action_choosen")
				apply_player_swap_SRfunc_(action.idx)
				yield(self, "action_applied")

	if Enemy.is_dead():
		Player_Textures_.SRstats.visible = false
		Enemy_Textures_.N_pc.enter($tween)
		yield($tween.block(), "done")
		
		var battle_loose = Enemy.BLT
		for line in battle_loose.text.split("\n"):
			yield(info_box_.set_text_for_confirm(line), "done")


	Enemy.active_SoulRemnant = null
	Player.active_SoulRemnant = null

	emit_signal("done")
