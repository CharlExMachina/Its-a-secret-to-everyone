extends Button

var is_mouse_in := false
var clicked_tween_is_playing := false


func _on_mouse_entered() -> void:
	is_mouse_in = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1.15, 1.15), 0.2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.play()


func _on_mouse_exited() -> void:
	is_mouse_in = false
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.play()


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and is_mouse_in and event.button_index == 1 and event.pressed and not clicked_tween_is_playing:
		clicked_tween_is_playing = true
		var tween = get_tree().create_tween()

		tween.tween_property(self, "scale", Vector2(1.30, 1.30), 0.35).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "scale", Vector2(1, 1), 0.15).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)

		await tween.finished
		clicked_tween_is_playing = false
