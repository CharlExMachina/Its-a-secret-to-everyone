extends Control

var title: String:
	get:
		return title
	set(value):
		title = value
		$Panel/TitleLabel.text = value

var description: String:
	get:
		return description
	set(value):
		description = value
		$Panel/DescriptionLabel.text = value


func _ready() -> void:
	get_tree().call_group("Player", "freeze")


func _process(_celta: float) -> void:
	get_tree().call_group("CursorController", "set_cursor_pointer")


func _on_exit_button_pressed() -> void:
	get_tree().call_group("CursorController", "reset_cursor")
	get_tree().call_group("CursorController", "set_default_cursor")
	get_tree().call_group("Player", "unfreeze")

	queue_free()
