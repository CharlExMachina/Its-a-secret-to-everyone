extends Node

@export var mansion_keys_item: InventoryItem
@export var initial_dialog_sequence: Dialogue
@export var ending_dialog_sequence: Dialogue
@export var npc_portrait: Texture2D

var dialogue_popup = preload("res://src/entities/ui/dialogue_popup/dialogue_popup.tscn")
var enter_name_popup = preload("res://src/entities/ui/enter_name_popup/enter_name_popup.tscn")

func _ready() -> void:
	var limit_min_x = -8.63
	var limit_max_x = 2.678

	var limit_min_z = 2.989
	var limit_max_z = 3.857

	$Player.min_clamp_x = limit_min_x
	$Player.max_clamp_x = limit_max_x

	$Player.min_clamp_z = limit_min_z
	$Player.max_clamp_z = limit_max_z


func _on_enter_mansion_interactable_action_triggered() -> void:
	if ProgressManager.has_item(mansion_keys_item):
		get_tree().change_scene_to_file.bind("res://src/environments/mansion_interior_1/mansion_interior_1.tscn").call_deferred()
	else:
		if ProgressManager.met_viktor:
			ToastLoader.show_toast("I need a key to enter")
		else:
			ProgressManager.met_viktor = true
			ToastLoader.show_toast('"The door won\'t open, now what!?"')

			await get_tree().create_timer(2.0).timeout

			var popup_instance = dialogue_popup.instantiate()

			popup_instance.connect("dialogue_finished", handle_name_prompt)
			popup_instance.character_portrait = npc_portrait
			popup_instance.set_dialogue_sequence(initial_dialog_sequence)
			popup_instance.set_npc_name("Viktor")

			get_parent().add_child(popup_instance)


func handle_name_prompt() -> void:
	var popup_instance = enter_name_popup.instantiate()

	add_child(popup_instance)

	popup_instance.connect("name_set", set_player_name.bind())


func handle_end_of_first_conversation_with_viktor() -> void:
	ToastLoader.show_toast('"I need those keys, maybe I start by exploring other places"')


func set_player_name(name: String) -> void:
	ProgressManager.player_name = name

	get_node("EnterNamePopup").queue_free()

	var popup_instance = dialogue_popup.instantiate()

	get_parent().add_child(popup_instance)
	ending_dialog_sequence.variables.append(name)

	popup_instance.connect("dialogue_finished", handle_end_of_first_conversation_with_viktor)
	popup_instance.character_portrait = npc_portrait
	popup_instance.set_dialogue_sequence(ending_dialog_sequence)
	popup_instance.set_npc_name("Viktor")


func _on_go_to_crossroads_interactable_action_triggered() -> void:
	get_tree().change_scene_to_file.bind("res://src/environments/crossroads/crossroads.tscn").call_deferred()
