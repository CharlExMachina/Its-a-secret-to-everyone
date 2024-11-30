extends Area3D

@export var scene_to_load: PackedScene
@export var required_item: InventoryItem = null
@export var requirement_message: String = "Hmm... I'm missing something here."

var is_in_focus: bool = false


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if is_in_focus and event is InputEventMouseButton and event.is_action_released("pan_view"):
		if required_item and not ProgressManager.has_item(required_item):
			ToastLoader.show_toast(requirement_message)
			return
		
		get_tree().change_scene_to_packed.bind(scene_to_load).call_deferred()


func _on_mouse_entered() -> void:
	get_tree().call_group("CursorController", "set_pickup_cursor")
	is_in_focus = true


func _on_mouse_exited() -> void:
	is_in_focus = false
	get_tree().call_group("CursorController", "set_default_cursor")
