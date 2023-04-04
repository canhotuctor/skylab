class_name GravityObject
extends RigidBody3D

const gravity_group_name := "gravity_object"
#const G := 6.6743 * pow(10,-11) # m³/kg*s²
const G := 3600 * 24 * 6.6743 * pow(10,-5) # m³/Mg*day²

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(gravity_group_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var gravity_list := get_tree().get_nodes_in_group(gravity_group_name)
	for body in gravity_list:
		if self != body:
			apply_force(gravity_force(body))


func gravity_force(body) -> Vector3:
	if not (body is GravityObject):
		return Vector3.ZERO
	#GmM/r²
	var direction = position.direction_to(body.position)
	var force = G * mass * body.mass / position.distance_squared_to(body.position)
	print(force)
	return direction * force

