extends Node

var score = 0

func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("cueballs").is_empty():
		print("ЕБЛАН")
	if get_tree().get_nodes_in_group("must_sink_balls").is_empty():
		print("крутой")
