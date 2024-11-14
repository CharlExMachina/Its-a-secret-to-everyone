extends Node

@export var required_item: InventoryItem


func _on_exit_to_mansion_action_triggered() -> void:
	if $Player.has_item(required_item):
		print("GO TO ST. ANGELA!!")
	else:
		ToastLoader.show_toast("You can't go to the island without an oar")
