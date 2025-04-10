extends Node

@onready var player = %Player

var wave: int = 1
var enemies_remaining: int = 0
var enemy = preload("res://Scenes/enemy.tscn")
var spawn_radius_min = 1500
var spawn_radius_max = 3000
func _ready():
	pass

func _process(delta):
	if enemies_remaining == 0:
		wave += 1
		new_wave()

func new_wave():
	pass
