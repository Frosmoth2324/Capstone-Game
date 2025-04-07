extends Node

const MAX_OIL = 15
var oil = MAX_OIL
var dead = false

func _process(_delta):
	if dead == true and oil != -1000:
		get_tree().change_scene_to_file("res://Scenes/die_screen.tscn")
		oil = -1000
