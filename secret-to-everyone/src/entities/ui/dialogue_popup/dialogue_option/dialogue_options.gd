extends Panel

var dialogue_option = preload("res://src/entities/ui/dialogue_popup/dialogue_option/dialogue_option.tscn")

var options: Array[Option]:
	set(value):
		options = value

		for option in value:
			var instance = dialogue_option.instantiate() as Button
			$ScrollContainer/MarginContainer/OptionsContainer.add_child(instance)

			var parent = get_parent() as DialoguePopup

			instance.pressed.connect(
					Callable(parent.set_dialogue_sequence).bind(option.outcome)
			)

			instance.text = option.title
