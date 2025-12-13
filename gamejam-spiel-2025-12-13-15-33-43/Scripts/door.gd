extends Node2D

@onready var dialogue_manager: DialogueManager = $Visitor/DialogManager

const visitor_scene = preload("res://Scenes/Visitors/Visitor.tscn")

var final_decision: int
var visitor: Node2D
var visitor_room: Node2D

#Instanzinierung des Besuchers in der Szene
func _ready() -> void:
	visitor = visitor_scene.instantiate()
	add_child(visitor)
	dialogue_manager = visitor.get_node("DialogManager") as DialogueManager


func _process(delta: float) -> void:
	if GlobalScript.final_decision > 0:
		execute_decision()


func execute_decision():
	#Töten für Benzin
	if final_decision == 1:
		visitor.queue_free()
		GlobalScript.fuel += 1
		print("Anzahl Fuel: ", GlobalScript.fuel)
	#Wegschicken
	elif final_decision == 2:
		visitor.queue_free()
	#Reinlassen
	elif final_decision == 3:
		GlobalScript.add_visitor = true
