extends Node

var fuel: int = 100
var max_fuel: int = 100

var can_kill: bool = true

var crewmate_killed: bool = false
var imposter_killed: bool = false

var imposter_count: int = 0
var crewmate_count: int = 0

var ship_repair: int = 0

#Handle Imposter threats
func night() -> void:
	fuel -= 20
	var i: int = imposter_count
	while i > 0:
			max_fuel -= 10
			crewmate_count -= 1
			if crewmate_count <= 0:
				get_tree().change_scene_to_file("res://Scenes/lose_screen.tscn")
			i = -1
	ship_repair += crewmate_count
	if ship_repair >= 6:
		get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")
	pass
