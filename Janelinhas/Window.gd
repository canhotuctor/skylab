extends Window
class_name InstantiateWindow

func _on_close_requested():
	queue_free()
