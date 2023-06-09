extends Node
class_name Tracker

var last_velocity = Vector3.ZERO

@export var frequency : float = 100
@export var track_position : bool = true
@export var track_velocity : bool = false
@export var track_acceleration : bool = false

var history : Array
var log_time : float = 0
var time : float = 0

@onready var tracked_body = get_parent()

func _physics_process(delta):
	time += delta
	while time - log_time > 1/frequency: 
		log_instant(time, delta)
		log_time += 1/frequency
	last_velocity = tracked_body.linear_velocity


func log_instant(time, delta):
	var instant_info = {
		time = time
	}
	if track_position:
		instant_info["pos"] = tracked_body.position
	if track_velocity:
		instant_info["vel"] = tracked_body.linear_velocity
	if track_acceleration:
		instant_info["acc"] = (tracked_body.linear_velocity - last_velocity)/delta
	history.append(instant_info)
