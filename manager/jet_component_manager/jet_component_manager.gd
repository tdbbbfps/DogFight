extends Node

var data_path : String = "res://data/component_data.json"
var componenet_data : Dictionary
func _ready() -> void:
	load_component_data()
	
func load_component_data():
	var file = FileAccess.open(data_path, FileAccess.READ)
	var json = JSON.new()
	var json_string = file.get_as_text()
	file.close()
	print(typeof(json_string))
	prints(json_string)
