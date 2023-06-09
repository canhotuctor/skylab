extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation.y += (delta)
	if Input.is_action_pressed("ui_left"):
		rotation.y += (-delta)
	if Input.is_action_pressed("ui_up"):
		rotation.x += (-delta)
	if Input.is_action_pressed("ui_down"):
		rotation.x += (delta)
