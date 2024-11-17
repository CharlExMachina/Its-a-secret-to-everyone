extends Node

var items: Array[InventoryItem] = []


func add_to_inventory(item: InventoryItem) -> void:
	ProgressManager.items.append(item)


func get_inventory() -> Array[InventoryItem]:
	return ProgressManager.items


func has_item(item: InventoryItem) -> bool:
	return items.has(item)
