extends Node2D

const animation_player_scene = preload("res://Scenes/DialogueWindow.tscn")
const dialogue_manager_scene = preload("res://Scenes/dialogue_manager.tscn")


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


@onready var dialogue_manager = dialogue_manager_scene.instantiate()
@onready var animation_player_node = animation_player_scene.instantiate()
var animated_player_visible: bool = false
var dialogue_options: Dictionary

#Auswahl und Instanz des Besuchers
func _ready() -> void:
	var animation_player = animation_player_node.get_child(0)
	var rich_text_label = animation_player.get_child(0)
	print(animation_player)
	var choosen_questions: int = dialogue_manager.choosen_questions
	for choice in choosen_questions:
		#var rich_text_label: RichTextLabel = animation_player.get_child(0)
		rich_text_label.text = dialogue_options[choice]
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


func hide_animation_player():
	add_child(animation_player_node)
	if animation_player_node:
		print("EEEEEEEEEEEEHHH")
	var animation_player = animation_player_node.get_child(0)
	var rich_text_label = animation_player.get_child(0)


func handle_dialogue_window():
	add_child(dialogue_manager)
	if dialogue_manager:
		print("AAAAAAAAAAAAHHHHHH")


#Wählt den richtigen Dialog aus dem Dictionary oben
func handle_dialogue_counter():
	var animation_player = animation_player_node.get_child(0)
	var rich_text_label = animation_player.get_child(0)
	var choosen_questions: int = dialogue_manager.choosen_questions
	#var rich_text_label: RichTextLabel = animation_player.get_child(0)
	rich_text_label.text = dialogue_options[choosen_questions]
	animation_player.play("typewriter_effect")


func handle_default_text():
	var animation_player = animation_player_node.get_child(0)
	var rich_text_label = animation_player.get_child(0)
	#var rich_text_label: RichTextLabel = animation_player.get_child(0)
	rich_text_label.text = visitor_default_text
	animation_player.play("typewriter_effect")
