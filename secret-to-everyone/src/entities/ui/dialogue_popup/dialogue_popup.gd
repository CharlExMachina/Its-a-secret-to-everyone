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
	if dialogue_secuence == null:
		return

	current_dialogue_step = dialogue_secuence
	$ContentSection/ContentLabel.text = current_dialogue_step.content


func set_npc_name(name: String) -> void:
	$NpcNameLabel.text = name


func setup_sequence() -> void:
	if current_dialogue_step.options.size() > 0:
		$ContinueButton.visible = false
		$DialogueOptions.visible = true
		$ContentSection/ContentLabel.text = current_dialogue_step.content

		$DialogueOptions.options = current_dialogue_step.options
	else:
		$ContinueButton.visible = true
		$DialogueOptions.visible = false
		$ContentSection/ContentLabel.text = current_dialogue_step.content

		if current_dialogue_step.next == null:
			$ContinueButton.text = "Finish"


func _on_continue_button_pressed() -> void:
	if current_dialogue_step.next == null:
		queue_free()
		return

	current_dialogue_step = current_dialogue_step.next
	setup_sequence()
