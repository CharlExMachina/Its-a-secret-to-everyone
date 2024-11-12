extends Control

@export_multiline var prologue_text: Array[String]

var date_step := 0
var narration_step := 0


func _ready() -> void:
	$ContinueButton.hide()

	disable_continue_button()
	fade_in_dates()


func fade_in_dates() -> void:
	var date_label = $DateLabel
	date_label.self_modulate = Color(Color.WHITE, 0.0)

	var tween = get_tree().create_tween()
	tween.tween_property(date_label, "self_modulate", Color(Color.WHITE, 1.0), 4.0)
	tween.play()

	await tween.finished

	show_continue_button()


func fade_out_dates() -> void:
	var date_label = $DateLabel
	date_label.self_modulate = Color(Color.WHITE, 1.0)

	var tween = get_tree().create_tween()
	tween.tween_property(date_label, "self_modulate", Color(Color.WHITE, 0.0), 2.0)
	tween.play()

	await tween.finished

	if date_step < 2:
		$DateLabel.display_day_of_the_week()
		fade_in_dates()
	else:
		$DateLabel.queue_free()


func fade_in_narration() -> void:
	var content_label = $ScrollContainer/ContentLabel
	content_label.self_modulate = Color(Color.WHITE, 0.0)

	var tween = get_tree().create_tween()
	tween.tween_property(content_label, "self_modulate", Color(Color.WHITE, 1.0), 4.0)
	tween.play()

	await tween.finished

	show_continue_button()


func fade_out_narration() -> void:
	var content_label = $ScrollContainer/ContentLabel
	content_label.self_modulate = Color(Color.WHITE, 1.0)

	var tween = get_tree().create_tween()
	tween.tween_property(content_label, "self_modulate", Color(Color.WHITE, 0.0), 2.0)
	tween.play()

	await tween.finished

	set_narration_text(narration_step)
	fade_in_narration()


func show_continue_button() -> void:
	var continue_button = $ContinueButton
	continue_button.visible = true
	continue_button.self_modulate = Color(Color.WHITE, 0.0)

	if narration_step == prologue_text.size() - 1:
		continue_button.text = "Finish"

	var tween = get_tree().create_tween()
	tween.tween_property(continue_button, "self_modulate", Color(Color.WHITE, 1.0), 1.1)
	tween.play()


func disable_continue_button() -> void:
	var continue_button = $ContinueButton

	var tween = get_tree().create_tween()
	tween.tween_property(continue_button, "self_modulate", Color(Color.WHITE, 0.0), 0.2)
	tween.play()

	await tween.finished

	continue_button.hide()

func set_narration_text(index: int) -> void:
	var text = prologue_text[index]
	$ScrollContainer/ContentLabel.text = text


func _on_continue_button_pressed() -> void:
	if $ContinueButton.text == "Finish":
		get_tree().change_scene_to_file("res://src/environments/grandpas_hut/grandpas_hut.tscn")
		return

	date_step += 1

	if date_step < 2:
		disable_continue_button()
		fade_out_dates()
	elif date_step == 2:
		disable_continue_button()
		fade_out_dates()
		await get_tree().create_timer(2.8).timeout
		set_narration_text(0)
		fade_in_narration()
	else:
		narration_step += 1
		disable_continue_button()
		fade_out_narration()
