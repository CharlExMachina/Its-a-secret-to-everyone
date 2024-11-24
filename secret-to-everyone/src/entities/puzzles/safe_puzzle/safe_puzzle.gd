extends Node3D


@onready var screen_text = $Screen/ScreenText


func add_text(event: InputEvent, letter: String) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if (screen_text.text as String).length() < 22:
				screen_text.text += letter


func remove_text(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if (screen_text.text as String).length() > 0:
				var written_text = screen_text.text as String
				var result = written_text.erase(written_text.length() - 1, 1)
				screen_text.text = result


func _on_a_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "A")


func _on_q_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "Q")


func _on_w_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "W")


func _on_e_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "E")


func _on_r_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "R")


func _on_t_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "T")


func _on_y_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "Y")


func _on_u_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "U")


func _on_i_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "I")


func _on_o_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "O")


func _on_p_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "P")


func _on_backspace_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	remove_text(event)


func _on_s_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "S")


func _on_d_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "D")


func _on_f_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "F")


func _on_g_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "G")


func _on_h_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "H")


func _on_j_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "J")


func _on_k_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "K")


func _on_l_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "L")


func _on_z_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "Z")


func _on_x_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "X")
