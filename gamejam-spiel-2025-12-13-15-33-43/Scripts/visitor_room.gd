extends Node2D


var visitor_scene = preload("res://Scenes/Visitors/Visitor1.1.tscn")

@onready var visitor: Node2D = $Visitor

var current_visitor: Node2D


func _ready() -> void:
	current_visitor = visitor_scene.instantiate()
	add_child(current_visitor)
	if current_visitor:
		print("Toll")


func _on_bach_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/MainRoom.tscn")


func _process(delta: float) -> void:
	handle_visitors()


func handle_visitors():
	if GlobalScript.add_visitor == true:
		pass
