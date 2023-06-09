extends Control

func _on_pause_button_pressed():
	get_tree().paused = not get_tree().paused 
