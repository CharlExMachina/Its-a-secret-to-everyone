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
