extends Node

@export var mansion_keys_item: InventoryItem
@export var initial_dialog_sequence: Dialogue
@export var npc_portrait: Texture2D

var dialogue_popup = preload("res://src/entities/ui/dialogue_popup/dialogue_popup.tscn")

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
		print("CAN ENTER")
	else:
		ToastLoader.show_toast('"The door won\'t open, now what!?"')

		await get_tree().create_timer(2.0).timeout

		var popup_instance = dialogue_popup.instantiate()

		popup_instance.character_portrait = npc_portrait
		popup_instance.set_dialogue_sequence(initial_dialog_sequence)
		popup_instance.set_npc_name("Viktor")

		get_parent().add_child(popup_instance)
