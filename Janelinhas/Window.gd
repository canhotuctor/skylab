extends Window
class_name InstantiateWindow
signal okPressed(pos:Vector3, vel:Vector3)


func _on_close_requested():
	queue_free()
	

func _on_control_2_ok_pressed(pos, vel):
	queue_free()
	okPressed.emit(pos, vel)
