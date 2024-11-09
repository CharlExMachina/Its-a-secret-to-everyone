extends CharacterBody3D

@export var movement_speed := 400.0
@export var sensitivity_value := 0.02

const DRAG_MOTION_X_MIN_THRESHOLD := 13.0
const DRAG_MOTION_Y_MIN_THRESHOLD := 13.0

const DRAG_MOTION_MAX_X := 800.0
const DRAG_MOTION_MAX_Y := 300.0

const BODY_MAX_SPEED_X := 10.0
const BODY_MAX_SPEED_Y := 3.0

var is_moving := false
var is_frozen := false
var mouse_drag_start_pos: Vector2
var mouse_drag_current_pos: Vector2


func _physics_process(delta: float) -> void:
	if is_frozen:
		return

	if Input.is_action_just_released("pan_view"):
		stop_movement()

	var motion = calculate_span_motion()
	var velocity_x := 0.0
	var velocity_y := 0.0

	if is_moving and motion.length() > 40:
		get_tree().call_group("CursorController", "set_cursor_pan")

		if abs(motion.x) > DRAG_MOTION_X_MIN_THRESHOLD:
			velocity_x = clampf(-motion.x, -DRAG_MOTION_MAX_X, DRAG_MOTION_MAX_X) # we invert the X value so the spanning motion feels natural
		else:
			velocity_x = 0.0

		if abs(motion.y) > DRAG_MOTION_Y_MIN_THRESHOLD:
			velocity_y = clampf(-motion.y, -DRAG_MOTION_MAX_Y, DRAG_MOTION_MAX_Y) # we invert Y for the same reason as above
		else:
			velocity_y = 0.0

		var final_motion = Vector3(velocity_x, 0.0, velocity_y)

		velocity = final_motion * sensitivity_value

		velocity.x = clampf(velocity.x, -BODY_MAX_SPEED_X, BODY_MAX_SPEED_X)
		velocity.y = clampf(velocity.y, -BODY_MAX_SPEED_Y, BODY_MAX_SPEED_Y)
	else:
		velocity *= 0.8

	move_and_slide()


func freeze() -> void:
	is_frozen = true
	velocity = Vector3.ZERO


func unfreeze() -> void:
	is_frozen = false


func stop_movement() -> void:
	is_moving = false
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")


func calculate_span_motion() -> Vector2:
	if Input.is_action_just_pressed("pan_view"):
		mouse_drag_start_pos = get_viewport().get_mouse_position()
		is_moving = true

	if Input.is_action_pressed("pan_view"):
		mouse_drag_current_pos = get_viewport().get_mouse_position()

	return mouse_drag_current_pos - mouse_drag_start_pos


func add_to_inventory(item: InventoryItem) -> void:
	$PlayerInventory.items.append(item)
