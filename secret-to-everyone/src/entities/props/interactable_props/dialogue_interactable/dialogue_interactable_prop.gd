extends Area3D

var dialogue_popup = preload("res://src/entities/ui/dialogue_popup/dialogue_popup.tscn")

@export var npc_name: String = ""
@export var portrait_texture: Texture2D
@export var dialogue_sequence: Dialogue

var frames_pressed := 0.0

var is_pressing := false


func _ready() -> void:
	pass
	#$Sprite3D.texture = sprite


func _process(delta: float) -> void:
	if is_pressing:
		frames_pressed += delta


func _on_mouse_entered() -> void:
	get_tree().call_group("CursorController", "set_cursor_dialogue")


func _on_mouse_exited() -> void:
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseMotion:
		get_tree().call_group("CursorController", "set_cursor_dialogue")
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_pressing = true
		elif event.button_index == MOUSE_BUTTON_LEFT and event.is_released() and is_pressing:
			is_pressing = false

			if frames_pressed <= 0.5:
				pass
				var popup_instance = dialogue_popup.instantiate()

				popup_instance.character_portrait = portrait_texture
				popup_instance.dialogue_secuence = dialogue_sequence

				get_parent().add_child(popup_instance)

			frames_pressed = 0.0
