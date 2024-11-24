extends Node3D

@export var portrait_item: InventoryItem

@onready var screen_text = $Screen/ScreenText
@onready var status = $Status

var pickable_popup = preload("res://src/entities/ui/pickable_popup/pickable_popup.tscn")
var checkmark = preload("res://src/assets/sprites/puzzles/safe/check_mark.png")
var x = preload("res://src/assets/sprites/puzzles/safe/x.png")

var can_submit := true
var puzzle_is_complete := false


func _ready() -> void:
	$Control/FadeOutBg.self_modulate = Color(Color.WHITE, 0.0)
	await get_tree().create_timer(1).timeout
	ToastLoader.show_toast('"The password could be anything, a word, a phrase?"')


func animate_fade_out() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Control/FadeOutBg, "self_modulate", Color(Color.WHITE, 1.0), 1.8)
	tween.play()

	await tween.finished
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file.bind("res://src/environments/dinner_hall/dinner_hall.tscn").call_deferred()


func add_text(event: InputEvent, letter: String) -> void:
	if puzzle_is_complete:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if (screen_text.text as String).length() < 22:
				screen_text.text += letter


func remove_text(event: InputEvent) -> void:
	if puzzle_is_complete:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if (screen_text.text as String).length() > 0:
				var written_text = screen_text.text as String
				var result = written_text.erase(written_text.length() - 1, 1)
				screen_text.text = result


func animate_handle() -> void:
	var tween = get_tree().create_tween()
	var handle = $Handle

	tween.tween_property(handle, "rotation_degrees", Vector3(0, 0, 90), 1.8).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.play()


func on_item_picked_handler() -> void:
	ToastLoader.show_toast("%s added to inventory" % [portrait_item.item_name])
	animate_fade_out()


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


func _on_space_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, " ")


func _on_c_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "C")


func _on_v_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "V")


func _on_b_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "B")


func _on_n_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "N")


func _on_m_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	add_text(event, "M")


func _on_submit_collider_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if not can_submit:
					return

				can_submit = false
				puzzle_is_complete = true
				$Control/GoBackButton.disabled = true

				var text = $Screen/ScreenText.text

				if text == "BRILLIANT FUTURE AHEAD":
					status.texture = checkmark
					ProgressManager.unlocked_safe = true
					await get_tree().create_timer(1.5).timeout

					animate_handle()

					await get_tree().create_timer(0.5).timeout

					ToastLoader.show_toast('"You always loved your long passwords, huh?"')

					await get_tree().create_timer(2.7).timeout

					var popup_instance = pickable_popup.instantiate()

					popup_instance.item_name = portrait_item.item_name
					popup_instance.item_sprite = portrait_item.item_sprite
					popup_instance.description = portrait_item.description
					popup_instance.item = portrait_item
					popup_instance.connect("item_picked", on_item_picked_handler.bind())

					get_parent().add_child(popup_instance)
				else:
					status.texture = x
					await get_tree().create_timer(1.5).timeout
					status.texture = null
					can_submit = true


func _on_custom_button_pressed() -> void:
	get_tree().change_scene_to_file.bind("res://src/environments/dinner_hall/dinner_hall.tscn").call_deferred()
