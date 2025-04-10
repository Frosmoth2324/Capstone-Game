extends CharacterBody2D

@onready var player = %Player
@onready var sprite = $Sprite
@onready var enemy = $"."
@onready var enemies = $".."
@onready var oils = $"../../Oils"

var SPEED = 100
var health = 10
var damage = 10
var loot_num: int

var oil_scene = preload("res://Scenes/oil.tscn")

func _ready():
	loot_num = randi_range(0,100)
	WaveManager.enemies_remaining += 1

func _physics_process(delta):
		var direction = (player.global_position - global_position).normalized()
		if direction.x > 0:
			sprite.flip_h = false
		elif direction.x < 0:
			sprite.flip_h = true
		direction = direction.rotated(randf_range(-0.1, 0.1)) * (1.0 + randf_range(-0.1, 0.1))
		velocity = direction * SPEED
		if health > 0:
			move_and_slide()

func hit(hurt):
	health -= hurt
	print("enemy hit")
	if health <= 0:
		print("die")
		print(loot_num)
		WaveManager.enemies_remaining -= 1
		if  5 < loot_num and loot_num < 15:
			var oil = oil_scene.instantiate() as Node2D
			oil.position = enemy.global_position
			oils.add_child(oil)
		queue_free()
		
func _on_area_2d_body_entered(body):
	if body.has_method("hit") and body.has_method("is_player"):
			body.hit(damage)
