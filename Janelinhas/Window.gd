extends Window
class_name InstantiateWindow
signal okPressed


func _on_close_requested():
	queue_free()
	

func _on_control_2_ok_pressed():
	queue_free()
	emit_signal("okPressed")

