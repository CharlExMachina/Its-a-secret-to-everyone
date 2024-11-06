@icon("res://src/core/message_dots_square.png")
extends Resource
class_name Dialogue

@export_multiline var content: String = ""
@export var next: Dialogue
@export var options: Array[Option] = []
