extends Area3D

var pickable_popup = preload("res://src/entities/ui/pickable_popup/pickable_popup.tscn")

@export var item_name: String = ""
@export var item_sprite: Texture2D
@export_multiline var description: String = ""

var frames_pressed := 0.0
var is_pressing := false


func _ready() -> void:
	$Sprite3D.texture = item_sprite


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseMotion:
		get_tree().call_group("CursorController", "set_investigation_cursor")
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_pressing = true
		elif event.button_index == MOUSE_BUTTON_LEFT and event.is_released() and is_pressing:
			is_pressing = false

			if frames_pressed <= 0.5:
				pass
				var popup_instance = pickable_popup.instantiate()

				popup_instance.item_name = item_name
				popup_instance.item_sprite = item_sprite
				popup_instance.description = description

				get_parent().add_child(popup_instance)

			frames_pressed = 0.0


func _on_mouse_entered() -> void:
	get_tree().call_group("CursorController", "set_pickup_cursor")


func _on_mouse_exited() -> void:
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")
