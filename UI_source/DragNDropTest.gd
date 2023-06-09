extends TextureRect
var dragging = false
var mouseInside = false
@onready var initialPosition = position
var dragMinDist = 100
@onready var camera : Camera3D = %Camera3D
@onready var pauseButton = $"../../../AnalyticPause"

func _input(event):
	if event is InputEventMouseButton:
		dragging = (event.pressed and mouseInside)
		if(not dragging):
			if(position.distance_to(initialPosition) > dragMinDist):
				if(pauseButton.paused == false):
					# Dynamic instantiate
					var planeta : GravityObject = load("res://Corpos/planeta1.tscn").instantiate()
					planeta.position = camera.project_position(get_viewport().get_mouse_position(), 10) 
					planeta.linear_velocity = (camera.project_position(Input.get_last_mouse_velocity(), 10) - camera.project_position(Vector2.ZERO, 10))
					#planeta.linear_velocity = 0.01*Vector3(Input.get_last_mouse_velocity().x, -1*Input.get_last_mouse_velocity().y,0)
					get_tree().current_scene.add_child(planeta)
					planeta.owner = get_tree().current_scene #necessario para salvar posteriormente pela função PackedScene.pack()
				else:
					# Analytic instantiate:
					var janela : InstantiateWindow = load("res://Janelinhas/InstantiateWindow.tscn").instantiate()
					get_tree().current_scene.add_child(janela)
					janela.owner = get_tree().current_scene.find_child("CanvasLayer")
					pass
					
			# Reset thumbnail position:
			position = initialPosition
			
	if event is InputEventMouseMotion and dragging:
		position += event.relative
		


func _on_mouse_exited():
	mouseInside = false
	
	
func _on_mouse_entered():
	mouseInside = true
