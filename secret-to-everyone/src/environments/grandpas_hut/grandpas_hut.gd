extends Node

@export var required_item: InventoryItem

func _ready() -> void:
	var limit_min_x = -8.63
	var limit_max_x = 2.678

	var limit_min_z = 2.989
	var limit_max_z = 3.857

	$Player.min_clamp_x = limit_min_x
	$Player.max_clamp_x = limit_max_x

	$Player.min_clamp_z = limit_min_z
	$Player.max_clamp_z = limit_max_z


func _on_exit_to_mansion_action_triggered() -> void:
	if $Player.has_item(required_item):
		print("GO TO ST. ANGELA!!")
	else:
		ToastLoader.show_toast("You can't go to the island without an oar")
