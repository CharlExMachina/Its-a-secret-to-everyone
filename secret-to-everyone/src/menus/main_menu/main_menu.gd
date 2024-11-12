extends Control


func _ready() -> void:
	$GameLogo.position = Vector2(152, -46)
	$GameLogo.self_modulate = Color(Color.WHITE, 0.0)

	$StartGameButton.self_modulate = Color(Color.WHITE, 0.0)

	animate_logo()
	animate_start_button()


func animate_logo() -> void:
	var logo = $GameLogo
	var tween = get_tree().create_tween().set_parallel()

	tween.tween_property(logo, "position", Vector2(152, 55), 5.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(logo, "self_modulate", Color(Color.WHITE, 1.0), 4.5)

	tween.play()


func animate_start_button() -> void:
	await get_tree().create_timer(2.0).timeout

	var button = $StartGameButton
	var tween = get_tree().create_tween()

	tween.tween_property(button, "self_modulate", Color(Color.WHITE, 1.0), 3.5)
