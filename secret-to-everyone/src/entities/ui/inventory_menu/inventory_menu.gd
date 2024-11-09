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
	print("PRESSED ON ", item_to_show.item_name)
