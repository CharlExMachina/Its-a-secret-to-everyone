extends Control

signal item_picked

var item: InventoryItem

var item_name: String:
	set(value):
		item_name = value
		$Background/ItemNameLabel.text = value

var item_sprite: Texture2D:
	set(value):
		item_sprite = value
		$Background/ItemTexture.texture = value

var description: String:
	set(value):
		description = value
		$Background/DescriptionLabel.text = value


func _ready() -> void:
	get_tree().call_group("Player", "freeze")


func _on_button_pressed() -> void:
	ProgressManager.add_to_inventory(item)
	get_tree().call_group("Player", "unfreeze")
	emit_signal("item_picked")
	queue_free()
