extends Node

func _ready() -> void:
	var limit_min_x = -8.63
	var limit_max_x = 2.678

	var limit_min_z = 2.989
	var limit_max_z = 3.857

	$Player.min_clamp_x = limit_min_x
	$Player.max_clamp_x = limit_max_x

	$Player.min_clamp_z = limit_min_z
	$Player.max_clamp_z = limit_max_z


func _on_go_to_crossroads_interactable_action_triggered() -> void:
	get_tree().change_scene_to_file.bind("res://src/environments/crossroads/crossroads.tscn").call_deferred()
