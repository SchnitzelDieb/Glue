extends Node2D

const dialogue_manager_scene = preload("res://Scenes/dialogue_manager.tscn")

@onready var rich_text_label: RichTextLabel = $AnimationPlayer/RichTextLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

#Visitor Typ muss entweder "Imposter" oder "Visitor sein
@export var visitor_type: String
@export var visitor_default_text: String

@export var option1_1: String
@export var option2_1: String
@export var option3_1: String
@export var option1_2: String
@export var option2_2: String
@export var option3_2: String
@export var decision1: String
@export var decision2: String
@export var decision3: String


var dialogue_manager = dialogue_manager_scene.instantiate()

var dialogue_options: Dictionary

#Auswahl und Instanz des Besuchers
func _ready() -> void:
	add_child(dialogue_manager)
	if dialogue_manager:
		print("AAAAAAAAAAAAHHHHHH")
	var choosen_questions: int = dialogue_manager.choosen_questions
	for choice in choosen_questions:
		rich_text_label.text = dialogue_options[choice]
	animation_player.play("typewriter_effect")
	handle_default_text()
	
	
	#Dictionary mit Antworten des Besuchers
	dialogue_options = {
		1 : option1_1,
		2 : option2_1,
		3 : option3_1,
		4 : option1_2,
		5 : option2_2,
		6 : option3_2,
		7 : decision1,
		8 : decision2,
		9 : decision3
		}
	
	print(dialogue_options[1])


#Wählt den richtigen Dialog aus dem Dictionary oben
func handle_dialogue_counter():
	var choosen_questions: int = dialogue_manager.choosen_questions
	rich_text_label.text = dialogue_options[choosen_questions]
	animation_player.play("typewriter_effect")


func handle_default_text():
	rich_text_label.text = visitor_default_text
