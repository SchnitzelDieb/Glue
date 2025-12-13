extends Node2D

var reactor_image: bool = false
var door_image: bool = false
var visitor_room_image: bool = false

#Räume erreichen
func _on_room_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/Reactor.tscn")

func _on_room_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/Door.tscn")

func _on_room_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/VisitorRoom.tscn")
