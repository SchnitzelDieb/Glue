extends Node2D


const visitor_scene = preload("res://Scenes/Visitor.tscn")


var visitor: Node2D

#Instanzinierung des Besuchers in der Szene
func _ready() -> void:
	visitor = visitor_scene.instantiate()
	add_child(visitor)


func _process(delta: float) -> void:
	pass
