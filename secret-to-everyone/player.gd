extends Camera3D

@export var movement_speed = 400
@export var sensitivity_value = 0.006

const MOTION_X_MIN_THRESHOLD := 13.0
const MOTION_Y_MIN_THRESHOLD := 13.0
var is_moving := false


var mouse_drag_start_pos: Vector2
var mouse_drag_current_pos: Vector2


func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("pan_view"):
		stop_movement()

	var motion = calculate_span_motion()
	var velocity_x := 0.0
	var velocity_y := 0.0

	if is_moving:
		if abs(motion.x) > MOTION_X_MIN_THRESHOLD:
			velocity_x = clampf(-motion.x, -800, 800) # we invert the X value so the spanning motion feels natural
		else:
			velocity_x = 0.0

		if abs(motion.y) > MOTION_X_MIN_THRESHOLD:
			velocity_y = clampf(-motion.y, -300, 300) # we invert Y for the same reason as above
		else:
			velocity_y = 0.0

		position += Vector3(velocity_x, 0.0, velocity_y) * delta * sensitivity_value


func stop_movement() -> void:
	is_moving = false
	mouse_drag_start_pos = Vector2.ZERO
	mouse_drag_current_pos = Vector2.ZERO


func calculate_span_motion() -> Vector2:
	if Input.is_action_just_pressed("pan_view"):
		mouse_drag_start_pos = get_viewport().get_mouse_position()
		is_moving = true

	if Input.is_action_pressed("pan_view"):
		mouse_drag_current_pos = get_viewport().get_mouse_position()

	return mouse_drag_current_pos - mouse_drag_start_pos
