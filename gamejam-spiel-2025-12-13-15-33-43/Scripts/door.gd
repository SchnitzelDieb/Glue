extends Node2D

var dialogue_manager: DialogueManager
var final_decision: int
var visitor_room: Node2D
var current_visitor: Node = null


#Instanzinierung des Besuchers in der Szene
func _ready() -> void:
	GlobalScript.door_scene = self
	spawn_visitor()
	#visitor = visitor_scene.instantiate()
	#add_child(visitor)
	if current_visitor == null:
		return
	
	dialogue_manager = current_visitor.get_node("DialogManager") as DialogueManager
	


func spawn_visitor():
	var visitor_scene = GlobalScript.get_current_visitor_scene()
	
	if visitor_scene == null:
		start_night()
		return
	
	current_visitor = visitor_scene.instantiate()
	add_child(current_visitor)
	
	if current_visitor:
		current_visitor.hide_animation_player()
		current_visitor.handle_dialogue_window()


func start_night():
	ResourceManager.night()


func on_room_exit():
	print("Exit Room auzfgerufen")
	GlobalScript.advance_visitor()
	if GlobalScript.get_current_visitor_scene() == null:
		start_night()
	#Reinlassen
	# +1 bei reinlassen
	if final_decision == 1:
		GlobalScript.add_visitor = true
		print("Visitor wird reingelassen")
		
	#Wegschicken
	elif final_decision == 2:
		current_visitor.queue_free()
		
	#Töten für Fuel
	#auf true setzen
	elif final_decision == 3:
		current_visitor.queue_free()
		GlobalScript.fuel += 1
		print("Anzahl Fuel: ", GlobalScript.fuel)
