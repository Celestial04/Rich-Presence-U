extends VBoxContainer

onready var node_list: = get_node("List")

func _ready() -> void:
	
	# Locale keys
	$Title.set_text("LANGUAGE_TITLE")
	
	# Fill list
	node_list.clear()
	node_list.add_item("LANGUAGE_AUTO", 0)
	node_list.add_item("English", 1)
	node_list.add_item("Español", 2)
	node_list.add_item("Magyar", 3)
	node_list.add_item("Nederlands", 4)
	node_list.add_item("Português", 5)
	node_list.set_item_metadata(0, "")
	node_list.set_item_metadata(1, "en")
	node_list.set_item_metadata(2, "es")
	node_list.set_item_metadata(3, "hu")
	node_list.set_item_metadata(4, "nl")
	node_list.set_item_metadata(5, "pt")
	
	# Find previously selected option
	for i in node_list.get_item_count():
		
		if node_list.get_item_metadata(i) == Main.settings["language"]:
			
			node_list.selected = i
			break

# Signals
func _on_List_item_selected(index: int) -> void:
	Main.settings["language"] = node_list.get_item_metadata(index)
	Main.emit_signal("language_changed", Main.settings["language"])
