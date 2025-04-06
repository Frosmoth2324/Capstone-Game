extends CharacterBody2D


const SPEED = 8000
@onready var sprite_2d = $Sprite2D


func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	if direction:
		velocity = direction * SPEED * delta
	else:
		velocity = Vector2.ZERO
	if direction.x > 0:
		sprite_2d.flip_h = false
	elif direction.x < 0:
		sprite_2d.flip_h = true
	move_and_slide()

	move_and_slide()
