extends Control

signal name_set


func _on_text_edit_text_changed() -> void:
	var text = $Panel/TextEdit.text as String
	
	if text.length() > 20:
		text = text.erase(21, 1)
		$Panel/TextEdit.text = text


func _on_custom_button_pressed() -> void:
	emit_signal("name_set", $Panel/TextEdit.text)
