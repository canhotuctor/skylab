extends LineEdit

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.position.x < position.x or event.position.x > position.x + size.x \
		or event.position.y < position.y or event.position.y > position.y + size.y:
			release_focus()
