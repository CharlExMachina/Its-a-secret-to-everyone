extends Node

var toast_notification = preload("res://src/entities/ui/toast_notification/toast_notification.tscn")

func show_toast(text: String) -> void:
	var toast_instance = toast_notification.instantiate()
	toast_instance.text = text
	get_parent().add_child(toast_instance)
