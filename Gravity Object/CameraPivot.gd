extends Node3D

@onready var camera = %Camera3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation.y += (delta)/Engine.time_scale
	if Input.is_action_pressed("ui_left"):
		rotation.y += (-delta)/Engine.time_scale
	if Input.is_action_pressed("ui_up"):
		rotation.x += (-delta)/Engine.time_scale
	if Input.is_action_pressed("ui_down"):
		rotation.x += (delta)/Engine.time_scale
	if Input.is_action_just_released("scroll_up") and camera.position.z > 1:
		camera.position.z *= exp(-delta*10/Engine.time_scale)
	if Input.is_action_just_released("scroll_down") and camera.position.z < 10000:
		camera.position.z *= exp(delta*10/Engine.time_scale)
