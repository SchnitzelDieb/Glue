extends Node2D


func _on_bach_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/MainRoom.tscn")
