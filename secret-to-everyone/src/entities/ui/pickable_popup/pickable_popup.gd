extends Control

var item_name: String:
	set(value):
		item_name = value
		$Background/ItemNameLabel.text = value

var item_sprite: Texture2D:
	set(value):
		item_sprite = value
		$Background/ItemTexture.texture = value

var description: String:
	set(value):
		description = value
		$Background/DescriptionLabel.text = value

func _ready() -> void:
	get_tree().call_group("Player", "freeze")
