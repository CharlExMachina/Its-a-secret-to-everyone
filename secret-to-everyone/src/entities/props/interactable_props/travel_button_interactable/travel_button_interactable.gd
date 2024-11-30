extends Area3D

@export var scene_to_load: PackedScene

var is_in_focus: bool = false



func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if is_in_focus and event is InputEventMouseButton and event.is_action_released("pan_view"):
		get_tree().change_scene_to_packed.bind(scene_to_load).call_deferred()


func _on_mouse_entered() -> void:
	get_tree().call_group("CursorController", "set_pickup_cursor")
	is_in_focus = true

	var tween = get_tree().create_tween()
	var sprite = $Sprite3D

	tween.tween_property(sprite, "scale", Vector3(1.8, 1.8, 1.8), 0.2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.play()


func _on_mouse_exited() -> void:
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")
	is_in_focus = false
	
	var tween = get_tree().create_tween()
	var sprite = $Sprite3D

	tween.tween_property(sprite, "scale", Vector3(1.5, 1.5, 1), 0.2)
	tween.play()
