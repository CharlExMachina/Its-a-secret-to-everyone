extends Control

@onready var item_slots = $GridContainer.get_children()

var items: Array[InventoryItem]

func _ready() -> void:
	var index := 0

	for item in items:
		var icon = item.item_sprite
		var item_slot = item_slots[index]
		item_slot.icon = icon
		item_slot.index = index

		item_slot.connect("on_inventory_item_clicked", on_inventory_item_clicked.bind())

		index += 1


func on_inventory_item_clicked(index: int) -> void:
	var item_to_show = items[index]
	$DetailsPanel/ItemNameLabel.text = item_to_show.item_name
	$DetailsPanel/ScrollContainer/MarginContainer/ItemDescriptionLabel.text = item_to_show.description
	$DetailsPanel/ItemIcon.texture = item_to_show.item_sprite


func _on_exit_button_pressed() -> void:
	get_tree().call_group("Player", "unfreeze")
	queue_free()
