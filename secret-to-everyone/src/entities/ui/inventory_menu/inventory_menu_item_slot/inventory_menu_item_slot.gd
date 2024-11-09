extends TextureRect

var icon: Texture2D:
	set(value):
		icon = value
		$ItemIcon.texture = value
