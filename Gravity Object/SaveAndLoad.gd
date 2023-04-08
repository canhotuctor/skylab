extends Node

const SAVE_PATH_PACKED_SCENE = "user://save_packed_scene.scn"


func _on_save_button_pressed():
	var scene := PackedScene.new()
	scene.pack(get_tree().current_scene)
	ResourceSaver.save(scene, SAVE_PATH_PACKED_SCENE)


func _on_load_button_pressed():
	if FileAccess.file_exists(SAVE_PATH_PACKED_SCENE):
		get_tree().change_scene_to_file(SAVE_PATH_PACKED_SCENE)
