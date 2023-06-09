extends TextureRect

const RAY_LENGTH = 1000.0

var dragging = false
var mouseInside = false
var querry_delete = false
@onready var initialPosition = position
var dragMinDist = 100
@onready var camera : Camera3D = get_viewport().get_camera_3d()
@onready var pauseButton = $"../../AnalyticPause"
@export_file('*.tscn') var planet_to_load : String

func _input(event):
	if event is InputEventMouseButton:
		dragging = (event.pressed and mouseInside)
		if(not dragging):
			if(position.distance_to(initialPosition) > dragMinDist):
				querry_delete = true
			# Reset thumbnail position:
			position = initialPosition
	if event is InputEventMouseMotion and dragging:
		position += event.relative

func _physics_process(_delta):
	if querry_delete:
		var space_state = camera.get_world_3d().direct_space_state
		var mousepos = get_viewport().get_mouse_position()
		var origin = camera.project_ray_origin(mousepos)
		var end = origin + camera.project_ray_normal(mousepos) * RAY_LENGTH
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		var result = space_state.intersect_ray(query)
		querry_delete = false
		if result.has('collider') and result.collider:
			result.collider.queue_free()

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
