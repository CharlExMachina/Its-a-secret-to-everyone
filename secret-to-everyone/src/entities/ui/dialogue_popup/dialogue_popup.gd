extends Control
class_name DialoguePopup

var dialogue_secuence: Dialogue

var current_dialogue_step: Dialogue

var character_portrait: Texture2D:
	get:
		return character_portrait
	set(value):
		character_portrait = value
		$CharacterPortrait/Portrait.texture = value


func set_dialogue_sequence(sequence: Dialogue) -> void:
	current_dialogue_step = sequence
	setup_sequence()


func _ready() -> void:
	if not dialogue_secuence:
		return

	current_dialogue_step = dialogue_secuence
	$ContentSection/ContentLabel.text = current_dialogue_step.content


func setup_sequence() -> void:
	if current_dialogue_step.options.size() > 0:
		$ContinueButton.visible = false
		$DialogueOptions.visible = true
		$ContentSection/ContentLabel.text = current_dialogue_step.content

		$DialogueOptions.options = current_dialogue_step.options
	else:
		$DialogueOptions.visible = false
		$ContentSection/ContentLabel.text = current_dialogue_step.content


func _on_continue_button_pressed() -> void:
	if not current_dialogue_step.next:
		queue_free()

	current_dialogue_step = current_dialogue_step.next
	setup_sequence()
