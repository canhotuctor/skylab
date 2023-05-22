extends Control
@onready var paused_state = false


func _on_pause_button_toggled(button_pressed):
	paused_state = not paused_state
	get_tree().paused = true
