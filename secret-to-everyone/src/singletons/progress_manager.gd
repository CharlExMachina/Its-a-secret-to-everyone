extends Node

var items: Array[InventoryItem] = []
var player_name: String
var met_viktor := false


func add_to_inventory(item: InventoryItem) -> void:
	ProgressManager.items.append(item)


func get_inventory() -> Array[InventoryItem]:
	return ProgressManager.items


func has_item(item: InventoryItem) -> bool:
	return items.has(item)
