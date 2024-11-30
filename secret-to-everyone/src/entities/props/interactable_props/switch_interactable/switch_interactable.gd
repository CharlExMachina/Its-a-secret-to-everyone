extends Area3D

@export var target: Node3D
@export var required_item: InventoryItem = null
@export var requirement_message: String = "It's locked..."

var is_in_focus: bool = false


func _ready():
	target.hide()


func _input(event):
	if is_in_focus and event is InputEventMouseButton and event.is_action_released("pan_view"):
		if required_item and not ProgressManager.has_item(required_item):
			ToastLoader.show_toast(requirement_message)
			return
		
		target.show()
		queue_free()
		
		get_viewport().set_input_as_handled()


func _on_mouse_entered() -> void:
	get_tree().call_group("CursorController", "set_pickup_cursor")
	is_in_focus = true


func _on_mouse_exited() -> void:
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")
	is_in_focus = false
