extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var light = $PointLight2D
@onready var oil_timer = $OilTimer
@onready var animation_player = $AnimationPlayer
@onready var hit_sound = $HitSound

const SPEED = 12500

func _ready():
	oil_timer.start()

func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	if direction:
		velocity = direction * SPEED * delta
	else:
		velocity = Vector2.ZERO
	if direction.x > 0:
		sprite_2d.play("right")
	elif direction.x < 0:
		sprite_2d.play("left")
	elif direction.y > 0:
		sprite_2d.play("down")
	elif direction.y < 0:
		sprite_2d.play("up")
	move_and_slide()

func _process(_delta):
	if light.enabled == false:
		GameManager.dead = true
	if GameManager.oil > 5:
		light.scale = Vector2(2, 2)
	elif GameManager.oil <= 5:
		light.scale = (2.0/5.0) * Vector2(GameManager.oil, GameManager.oil)
	if GameManager.health <= 0:
		animation_player.play("flame_out")


func _on_oil_timer_timeout():
	if GameManager.oil > 0:
		GameManager.oil -= 1
		oil_timer.start()
	elif GameManager.oil == 0:
		animation_player.play("flame_out")

func hit(hurt):
	hit_sound.play()
	GameManager.health -= hurt

func is_player():
	print("sup dude")
