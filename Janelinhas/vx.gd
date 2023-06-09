extends Label
@onready var spinbox = $SpinBox
@onready var slider = $HSlider

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_h_slider_value_changed(value):
	spinbox.value = value


func _on_spin_box_value_changed(value):
	slider.value = value
