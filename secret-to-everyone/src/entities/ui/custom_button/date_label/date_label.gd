extends Label
class_name DateLabel


func _ready() -> void:
	display_full_date()


func display_full_date() -> void:
	var time := Time.get_datetime_dict_from_system()

	var month = time["month"]
	var year = time["year"]
	var day = time["day"]

	var month_name: String

	match month:
		1:
			month_name = "January"
		2:
			month_name = "February"
		3:
			month_name = "March"
		4:
			month_name = "April"
		5:
			month_name = "May"
		6:
			month_name = "June"
		7:
			month_name = "July"
		8:
			month_name = "August"
		9:
			month_name = "September"
		10:
			month_name = "October"
		11:
			month_name = "November"
		12:
			month_name = "December"

	text = "It's %s %s, %s..." % [month_name, day, year]


func display_day_of_the_week() -> void:
	var time := Time.get_datetime_dict_from_system()

	var month = time["month"]
	var weekday = time["weekday"]
	var year = time["year"]
	var day = time["day"]

	var weekday_name: String

	match weekday:
		0:
			weekday_name = "sunday"
		1:
			weekday_name = "monday"
		2:
			weekday_name = "tuesday"
		3:
			weekday_name = "wednesday"
		4:
			weekday_name = "thursday"
		5:
			weekday_name = "friday"
		6:
			weekday_name = "saturday"

	text = "It should have been a %s like any other, but I found something I cannot explain, considering how much time has passed ever since he suddenly vanished from our lives..." % [weekday_name]
