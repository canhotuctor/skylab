extends Label
@onready var spinbox = $SpinBox
@onready var slider = $HSlider
signal changedValue(value)
var valor = 0


func _on_h_slider_value_changed(value):
	spinbox.value = value
	changedValue.emit(value)
	valor = value


func _on_spin_box_value_changed(value):
	slider.value = value
	valor = value

