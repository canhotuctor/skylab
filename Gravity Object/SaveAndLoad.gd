extends Control

var save_path = "user://save_packed_scene.scn"


func _on_save_button_pressed():
	var scene := PackedScene.new()
	scene.pack(get_tree().current_scene)
	ResourceSaver.save(scene, save_path)


func _on_load_button_pressed():
	if FileAccess.file_exists(save_path):
		get_tree().change_scene_to_file(save_path)
