extends PanelContainer

onready var DialogueBox_ = find_node("Dialogue_Box")
onready var tween_ = find_node("tween")
onready var arrow_ = find_node("NEXT_arrow")
onready var success = find_node("success_sound")

func set_text(text, post_delay:float = 0.7) -> Tween:
	DialogueBox_.percent_visible = 0
	DialogueBox_.bbcode_text = str(text)
	tween_.interpolate_property(DialogueBox_, "percent_visible", null, 1, 0.5)
	tween_.interpolate_method(tween_, "nop", 0, 0, post_delay, 0, 0, 0.5)
	return tween_.block()

func set_text_for_confirm(text) -> Tween:
	DialogueBox_.percent_visible = 0
	DialogueBox_.bbcode_text = str(text)
	tween_.interpolate_property(DialogueBox_, "percent_visible", null, 1, 0.5)
	tween_.step_property(arrow_, "visible", false, true, 0.5)
	tween_.interpolate_method(tween_, "nop", 0, 0, 999999999, 0, 0, 0.5)
	tween_.connect("tween_all_completed", arrow_, "set_visible", [false], CONNECT_ONESHOT | CONNECT_REFERENCE_COUNTED)
	tween_.connect("tween_all_completed", $Clicking_sound, "play", [], CONNECT_ONESHOT | CONNECT_REFERENCE_COUNTED)
	return tween_.block()

func clear_text() -> void:
	arrow_.visible = false
	DialogueBox_.bbcode_text = ""
