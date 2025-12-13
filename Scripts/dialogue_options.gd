extends VBoxContainer
class_name DialogueManager

const action_buton_theme = preload("res://Assets/PLaceHolder/UI/Button_UI.tres")

@onready var option_1: Button = $Answer1
@onready var option_2: Button = $Answer2
@onready var option_3: Button = $Answer3


#Dialog Optionen
@export var answer_1: Array = ["Option1.1", "Option1.2", "Option1.3", "Decision.x"]
@export var answer_2: Array = ["Option2.1", "Option2.2", "Option2.3", "Decision.y"]
@export var answer_3: Array = ["Option3.1", "Option3.2", "Option3.3", "Decision.z"]


#Übersicht der Antworten
var choosen_question: int
var answer_counter = 0
var choosen_questions: int = 0
var round_tracer: int = 0


func _ready() -> void:
	answer_text()
	pass


#Textauswhal für Dialog-Optionen
func answer_text():
	option_1.text = answer_1[0 + answer_counter]
	option_2.text = answer_2[0 + answer_counter]
	option_3.text = answer_3[0 + answer_counter]


func _process(delta: float) -> void:
	pass


#Button 1
func _on_answer_1_pressed() -> void:
	choosen_question = 1
	choosen_questions = choosen_question + round_tracer
	handle_answers()


#Button 2
func _on_answer_2_pressed() -> void:
	choosen_question = 2
	choosen_questions = choosen_question + round_tracer
	handle_answers()


#Button 3
func _on_answer_3_pressed() -> void:
	choosen_question = 3
	choosen_questions = choosen_question + round_tracer
	handle_answers()


#Löschen der Antworten nach auswählen
#Nicht mehr anfassen, ist nicht mehr durchschaubar
func handle_answers():
	if is_instance_valid(self):
		hide()
		await get_tree().create_timer(0.3).timeout
		show()
		if answer_counter < 3:
			answer_counter += 1
		get_parent().handle_dialogue_counter()
		print(choosen_questions)
		answer_text()
		round_tracer += 3
		print("round_tracer", round_tracer)
		print("Answer Counter: ", answer_counter)
		button_change()
		scene_transition()


#Ändern des Button Themes für die Auswahl
func button_change():
	if answer_counter == 3:
		option_1.theme = action_buton_theme
		option_2.theme = action_buton_theme
		option_3.theme = action_buton_theme


#Löschen des Dialogfensters
func delete_dialogue_window():
		queue_free()


#Transition zu MainRoom
func scene_transition():
	if round_tracer == 12:
		set_final_decision()
		hide()
		await get_tree().create_timer(4).timeout
		get_tree().change_scene_to_file("res://Scenes/Rooms/MainRoom.tscn")
		delete_dialogue_window()


func set_final_decision():
	var final_decision = choosen_questions -9
	print("final decision ", final_decision)
