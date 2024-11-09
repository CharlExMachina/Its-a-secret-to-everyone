extends Control

signal on_inventory_opened


func _on_open_inventory_button_pressed() -> void:
	emit_signal("on_inventory_opened")
