extends Area3D

signal action_triggered

@export var item: InventoryItem

var frames_pressed := 0.0
var is_pressing := false


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseMotion:
		get_tree().call_group("CursorController", "set_pickup_cursor")
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_pressing = true
		elif event.button_index == MOUSE_BUTTON_LEFT and event.is_released() and is_pressing:
			is_pressing = false

			if frames_pressed <= 0.3:
				emit_signal("action_triggered")

			frames_pressed = 0.0


func _on_mouse_entered() -> void:
	get_tree().call_group("CursorController", "set_pickup_cursor")

	var tween = get_tree().create_tween()
	var sprite = $Sprite3D

	tween.tween_property(sprite, "scale", Vector3(1.2, 1.2, 1.2), 0.2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.play()


func _on_mouse_exited() -> void:
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")

	var tween = get_tree().create_tween()
	var sprite = $Sprite3D

	tween.tween_property(sprite, "scale", Vector3(1, 1, 1), 0.2)
	tween.play()
