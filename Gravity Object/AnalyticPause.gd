extends HBoxContainer
@onready var paused = false
#@onready var hslider : HSlider = get_node("TimeScale")
@onready var pauseButton : Button = get_node("Pause Button")

func _on_pause_button_pressed():
	get_tree().paused = not get_tree().paused 
	paused = not paused
	#hslider.value = int(not paused)
	if paused:
		pauseButton.text = "Unpause"
	else :
		pauseButton.text = "Pause"
#
#func _on_time_scale_value_changed(value):
#	if (value == 0) :
#		Engine.time_scale = 1
#		get_tree().paused = true
#		paused = true
#		hslider.value = int(not paused)
#		pauseButton.text = "Unpause"
#	else:
#		get_tree().paused = false
#		paused = false
#		pauseButton.text = "Pause"
