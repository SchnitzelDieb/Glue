extends Node

var final_decision: int

var fuel: int

var add_visitor: bool

func handle_visitors():
	if add_visitor == true:
		print("Ist True")
		add_visitor = false
	
	
	#Visitor IDs
	var visitor_list: Dictionary = {
		#"Visitor1.1": 
	}
