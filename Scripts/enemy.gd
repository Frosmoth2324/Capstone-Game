extends CharacterBody2D

@onready var player = %Player
@onready var sprite = $Sprite

var SPEED = 100
var health = 10
var damage = 10

func _ready():
	GameManager.enemies_remaining += 1

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
		GameManager.enemies_remaining -= 1
		queue_free()


func _on_area_2d_body_entered(body):
	if body.has_method("hit") and body.has_method("is_player"):
			body.hit(damage)
