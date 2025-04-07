extends CharacterBody2D


const SPEED = 8000
@onready var sprite_2d = $Sprite2D
@onready var light = $PointLight2D
@onready var oil_timer = $OilTimer

var oil = 15

func _ready():
	oil_timer.start()

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


func _on_oil_timer_timeout():
	oil -= 1
	print(oil)
	if oil > 0:
		oil_timer.start()
	else:
		light.enabled = false
