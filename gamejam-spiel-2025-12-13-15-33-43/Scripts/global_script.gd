extends Node

var final_decision: int

var fuel: int

var add_visitor: bool



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
		
	}


func _ready() -> void:
	print(visitor_list[1])
