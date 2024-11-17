extends Node

func _ready() -> void:
	var limit_min_x = -1.97
	var limit_max_x = 13

	var limit_min_z = 5.679
	var limit_max_z = 6.956

	$Player.min_clamp_x = limit_min_x
	$Player.max_clamp_x = limit_max_x

	$Player.min_clamp_z = limit_min_z
	$Player.max_clamp_z = limit_max_z


func _on_action_interactable_action_triggered() -> void:
	get_tree().change_scene_to_file.bind("res://src/environments/grandpas_hut/grandpas_hut.tscn").call_deferred()
