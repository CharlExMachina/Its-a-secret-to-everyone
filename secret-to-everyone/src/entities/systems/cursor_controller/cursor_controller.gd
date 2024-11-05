extends Node

var open_hand = preload("res://src/assets/sprites/cursors/hand_open.png")
var pointer_hand = preload("res://src/assets/sprites/cursors/hand_point.png")
var closed_hand = preload("res://src/assets/sprites/cursors/hand_closed.png")
var investigate_object_cursor = preload("res://src/assets/sprites/cursors/zoom.png")

var cursor_override_enabled := false

func _ready() -> void:
	set_default_cursor()


func set_default_cursor() -> void:
	if cursor_override_enabled:
		return

	Input.set_custom_mouse_cursor(open_hand)


func set_cursor_pointer() -> void:
	if cursor_override_enabled:
		return

	Input.set_custom_mouse_cursor(pointer_hand)
	cursor_override_enabled = true


func set_cursor_pan() -> void:
	if cursor_override_enabled:
		return

	Input.set_custom_mouse_cursor(closed_hand)
	cursor_override_enabled = true


func set_investigation_cursor() -> void:
	if cursor_override_enabled:
		return

	Input.set_custom_mouse_cursor(investigate_object_cursor)
	cursor_override_enabled = true


func reset_cursor() -> void:
	if cursor_override_enabled == false:
		return

	cursor_override_enabled = false


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_IN:
		set_default_cursor()
