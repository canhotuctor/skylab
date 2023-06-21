extends TextureRect
var dragging = false
var mouseInside = false
@onready var initialPosition = position
var dragMinDist = 100
@onready var camera : Camera3D = %Camera3D
@onready var pauseButton = $"../../AnalyticPause"
@export_file('*.tscn') var planet_to_load : String

func _input(event):
	if event is InputEventMouseButton:
		dragging = (event.pressed and mouseInside)
		if(not dragging):
			if(position.distance_to(initialPosition) > dragMinDist):
				if(pauseButton.paused == false):
					# Dynamic instantiate
					var planeta : GravityObject = load(planet_to_load).instantiate()
					planeta.position = camera.project_position(get_viewport().get_mouse_position(), camera.position.z) 
					planeta.linear_velocity = (camera.project_position(Input.get_last_mouse_velocity(), camera.position.z) - camera.project_position(Vector2.ZERO, camera.position.z))
					get_tree().current_scene.add_child(planeta)
					planeta.owner = get_tree().current_scene #necessario para salvar posteriormente pela função PackedScene.pack()
				else:
					# Analytic instantiate:
					var janela : InstantiateWindow = load("res://Janelinhas/InstantiateWindow.tscn").instantiate()
					get_tree().current_scene.find_child("CanvasLayer").add_child(janela)
					janela.owner = get_tree().current_scene.find_child("CanvasLayer")
					janela.okPressed.connect(_on_ok_pressed)
					
					
			# Reset thumbnail position:
			position = initialPosition
			
	if event is InputEventMouseMotion and dragging:
		position += event.relative


func _on_ok_pressed(pos, vel):
	var planeta : GravityObject = load(planet_to_load).instantiate()
	planeta.position = pos
	planeta.linear_velocity = vel
	get_tree().current_scene.add_child(planeta)
	planeta.owner = get_tree().current_scene #necessario para salvar posteriormente pela função PackedScene.pack()


func _on_mouse_exited():
	mouseInside = false


func _on_mouse_entered():
	mouseInside = true
