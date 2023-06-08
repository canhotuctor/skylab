extends Node
class_name Tracker

var before_velocity = Vector3.ZERO

@export var history_size : int = 1000
@export var track_position : bool = true
@export var track_velocity : bool = false
@export var track_acceleration : bool = false

@export var history : Array

@onready var tracked_body = get_parent()

func _physics_process(delta):
	var instant_info = {
		time = Time.get_ticks_msec() * 0.001
	}
	if track_position:
		instant_info["pos"] = tracked_body.position
	if track_velocity:
		instant_info["vel"] = tracked_body.linear_velocity
	if track_acceleration:
		instant_info["vel"] = tracked_body.linear_velocity - before_velocity
		before_velocity = tracked_body.linear_velocity
	history.append(instant_info)
	while history.size() > history_size:
		history.pop_front()
