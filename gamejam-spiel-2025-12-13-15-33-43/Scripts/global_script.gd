extends Node


var final_decision: int
var fuel: int
var add_visitor: bool
var current_day: int = 1
var visitor_index: int = 0
var round_tracer: int
var door_scene: Node2D = null


func call_scene_function():
	print("Aufgerufene global")
	print(door_scene)
	if door_scene != null:
		door_scene.on_room_exit()


#Momentan unnötig
func handle_visitors():
	if add_visitor == true:
		print("Ist True")
		add_visitor = false
		


#Visitor IDs
var visitor_list: Dictionary = {
		1 : [
		"res://Scenes/Visitors/Visitor1.1.tscn", 
		"res://Scenes/Visitors/Visitor1.2.tscn", 
		"res://Scenes/Visitors/Visitor1.1.tscn"],
		
		2 : [
		"res://Scenes/Visitors/Visitor2.1.tscn", 
		"res://Scenes/Visitors/Visitor2.2.tscn", 
		"res://Scenes/Visitors/Visitor2.3.tscn"],
		
		3 : [
		"res://Scenes/Visitors/Visitor3.1.tscn", 
		"res://Scenes/Visitors/Visitor3.2.tscn", 
		"res://Scenes/Visitors/Visitor3.3.tscn"],
		
		4 : [
		"res://Scenes/Visitors/Visitor4.1.tscn", 
		"res://Scenes/Visitors/Visitor4.2.tscn", 
		"res://Scenes/Visitors/Visitor4.3.tscn"],
		
		5 : [
		"res://Scenes/Visitors/Visitor5.1.tscn", 
		"res://Scenes/Visitors/Visitor5.2.tscn", 
		"res://Scenes/Visitors/Visitor5.3.tscn"]
	}

func get_current_visitor_scene() -> PackedScene:
	var day_list = visitor_list.get(current_day, [])
	if visitor_index >= day_list.size():
		return null
	return load(day_list[visitor_index])


func advance_visitor():
	visitor_index += 1
	print(visitor_index)


func reset_for_next_day():
	visitor_index = 0
	current_day += 1
