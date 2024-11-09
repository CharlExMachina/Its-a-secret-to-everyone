extends Control

@onready var item_slots = $GridContainer.get_children()

var items: Array[InventoryItem]

func _ready() -> void:
	var index := 0

	for item in items:
		var icon = item.item_sprite
		var item_slot = item_slots[index]
		item_slot.icon = icon
		index += 1
