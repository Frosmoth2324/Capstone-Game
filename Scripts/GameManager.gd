extends Node

var oil = 15
var dead = false

func _process(_delta):
	print(oil)
	if dead == true and oil != -1000:
		get_tree().change_scene_to_file("res://Scenes/die_screen.tscn")
		oil = -1000
