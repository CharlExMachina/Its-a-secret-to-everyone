extends Area3D

@export var target: Node3D

var is_in_focus: bool = false


func _ready():
	target.hide()


func _input(event):
	if is_in_focus and event is InputEventMouseButton and event.is_action_released("pan_view"):
		target.show()
		queue_free()


func _on_mouse_entered() -> void:
	get_tree().call_group("CursorController", "set_pickup_cursor")
	is_in_focus = true


func _on_mouse_exited() -> void:
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")
	is_in_focus = false
