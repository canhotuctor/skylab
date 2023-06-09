extends ItemList

const DIR_PATH = "user://saves"
var dir : DirAccess

@onready var erase_button = $"../HBoxContainer/EraseButton"
@onready var save_button = $"../HBoxContainer/SaveButton"
@onready var text_edit = $"../HBoxContainer/LineEdit"

func _ready():
	refresh()


func refresh():
	clear()
	if not DirAccess.dir_exists_absolute(DIR_PATH):
		DirAccess.make_dir_absolute(DIR_PATH)
	dir = DirAccess.open(DIR_PATH)
	
	for file in dir.get_files():
		if file.get_extension() == "scn":
			add_item(file.get_basename().substr(file.get_base_dir().length()))


func _on_item_activated(index):
	var save_path = DIR_PATH + "/" + get_item_text(index) + ".scn"
	get_tree().change_scene_to_file(save_path)


func _on_item_selected(index):
	erase_button.disabled = false


func _on_erase_button_pressed():
	if get_selected_items().size() > 0:
		var index = get_selected_items()[0]
		dir.remove(get_item_text(index) + ".scn")
		erase_button.disabled = true
		refresh()


func _on_save_button_pressed():
	var save_path = DIR_PATH + "/" + text_edit.text + ".scn"
	var scene := PackedScene.new()
	scene.pack(get_tree().current_scene)
	ResourceSaver.save(scene, save_path)
	refresh()


func _on_line_edit_text_changed(new_text):
	save_button.disabled = (text_edit.text.length() == 0)
