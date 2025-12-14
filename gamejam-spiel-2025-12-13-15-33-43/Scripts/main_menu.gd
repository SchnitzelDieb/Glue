extends Node2D

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/intro.tscn")


func _on_close_game_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
