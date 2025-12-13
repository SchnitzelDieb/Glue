extends Node2D

const dialogue_manager_scene = preload("res://Scenes/dialogue_manager.tscn")

@onready var rich_text_label: RichTextLabel = $AnimationPlayer/RichTextLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

#Visitor Typ muss entweder "Imposter" oder "Roommate sein
@export var visitor_type: String

var dialogue_manager = dialogue_manager_scene.instantiate()


#Dictionary mit Antworten des Besuchers
var dialogue_options: Dictionary = {
	1 : "Option1.1",
	2 : "Option2.1",
	3 : "Option3.1",
	4 : "Option1.2",
	5 : "Option2.2",
	6 : "Option3.2",
	7 : "Option1.3",
	8 : "Option2.3",
	9 : "Option3.3",
	10 : "Decision.x",
	11 : "Decision.y",
	12 : "Decision.z"
	}


#Auswahl und Instanz des Besuchers
func _ready() -> void:
	add_child(dialogue_manager)
	var choosen_questions: int = dialogue_manager.choosen_questions
	for choice in choosen_questions:
		rich_text_label.text = dialogue_options[choice]
		print("hat geklappt!")
	animation_player.play("typewriter_effect")


#Wählt den richtigen Dialog aus dem Dictionary oben
func handle_dialogue_counter():
	var choosen_questions: int = dialogue_manager.choosen_questions
	rich_text_label.text = dialogue_options[choosen_questions]
	animation_player.play("typewriter_effect")
