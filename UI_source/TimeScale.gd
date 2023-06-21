extends HSlider
@onready var texto : Label = get_children()[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Engine.time_scale = 2**value
	texto.text = "Time Scale: " + str(2**value)
