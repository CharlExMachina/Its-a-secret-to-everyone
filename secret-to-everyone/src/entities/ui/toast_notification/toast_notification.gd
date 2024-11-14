extends Control
class_name ToastNotification

var text: String:
	set(value):
		text = value
		$Popup/Label.text = value


func _ready() -> void:
	var popup = $Popup
	popup.position = Vector2(791, -105)
	popup.modulate = Color(Color.WHITE, 0.0)

	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property(popup, "position", Vector2(791, 24), 0.3)
	tween.tween_property(popup, "modulate", Color(Color.WHITE, 1.0), 0.3)
	tween.play()

	await tween.finished
	await get_tree().create_timer(1.5).timeout

	var last_tween = get_tree().create_tween()
	last_tween.tween_property(popup, "modulate", Color(Color.WHITE, 0.0), 0.3)

	await last_tween.finished

	queue_free()
