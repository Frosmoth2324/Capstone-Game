extends Node

@onready var player = %Player

var enemy_scene = preload("res://Scenes/enemy.tscn")
var spawn_radius_min = 500
var spawn_radius_max = 1000
func _ready():
	GameManager.start_wave.connect(_on_next_wave)

func _process(_delta):
	if GameManager.enemies_remaining == 0:
		GameManager.next_wave()

func _on_next_wave(wave):
	var enemies = wave * 2 + 3
	for i in enemies:
		print(enemies)
		var angle = randf_range(0, TAU)
		var distance = randf_range(spawn_radius_min, spawn_radius_max)
		var spawn_pos = player.global_position + Vector2.from_angle(angle) * distance   
		var enemy = enemy_scene.instantiate() as CharacterBody2D
		enemy.global_position = spawn_pos
		enemy.player = self.player
		$"../Enemies".add_child(enemy)
		GameManager.enemies_remaining += 1
