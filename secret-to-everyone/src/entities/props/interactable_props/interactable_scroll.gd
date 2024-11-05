extends Area3D

var information_popup = preload("res://src/entities/ui/information_popup/information_popup.tscn")

@export var item_name: String = ""
@export_multiline var item_description: String = ""

var frames_pressed := 0.0

var is_pressing := false


func _process(delta: float) -> void:
	if is_pressing:
		frames_pressed += delta


func _on_mouse_entered() -> void:
	get_tree().call_group("CursorController", "set_investigation_cursor")


func _on_mouse_exited() -> void:
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseMotion:
		get_tree().call_group("CursorController", "set_investigation_cursor")
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_pressing = true
		elif event.button_index == MOUSE_BUTTON_LEFT and event.is_released() and is_pressing:
			is_pressing = false

			if frames_pressed <= 0.5:
				var popup_instance = information_popup.instantiate()

				popup_instance.title = item_name
				popup_instance.description = item_description

				get_parent().add_child(popup_instance)

			frames_pressed = 0.0
