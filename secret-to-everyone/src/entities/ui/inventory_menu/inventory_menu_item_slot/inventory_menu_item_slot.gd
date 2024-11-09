extends TextureRect

signal on_inventory_item_clicked

var index := 0

var icon: Texture2D:
	set(value):
		icon = value
		$ItemIcon.texture_normal = value


func _on_item_icon_pressed() -> void:
	if not icon:
		return

	emit_signal("on_inventory_item_clicked", index)
