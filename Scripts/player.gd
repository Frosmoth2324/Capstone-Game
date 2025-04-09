extends CharacterBody2D

@onready var player = $"."
@onready var sprite_2d = $Sprite2D
@onready var light = $PointLight2D
@onready var oil_timer = $OilTimer
@onready var animation_player = $AnimationPlayer
@onready var hit_sound = $HitSound
@onready var cone_light = $ConeLight
@onready var cone_timer = $ConeTimer


const SPEED = 12500
var pulse_scene = preload("res://Scenes/pulse.tscn")
signal lantern_pulse(pos)

func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	if direction:
		velocity = direction * SPEED * delta
	else:
		velocity = Vector2.ZERO
	set_sprite_direction(direction)
	move_and_slide()

func _process(_delta):
	handle_cone()
	if light.enabled == false:
		GameManager.dead = true
	if GameManager.oil > 5:
		light.scale = Vector2(2, 2)
	elif GameManager.oil <= 5:
		light.scale = (2.0/5.0) * Vector2(GameManager.oil, GameManager.oil)
	if GameManager.health <= 0:
		animation_player.play("flame_out")
	if Input.is_action_just_pressed("Pulse") and GameManager.can_pulse:
		lantern_pulse.emit(player.global_position)

func handle_cone():
	if GameManager.can_cone == false:
		GameManager.is_coneing == false
	if Input.is_action_just_pressed("Cone"):
		if GameManager.is_coneing:
			GameManager.is_coneing = false
		else:
			if GameManager.can_cone:
				GameManager.is_coneing = true
		GameManager.is_cone_boosting = (GameManager.is_coneing and Input.is_action_pressed("Cone Boost"))
	cone_light.enabled = GameManager.is_coneing
	if GameManager.is_coneing and cone_timer.is_stopped():
		cone_timer.start()
		
	
	
func set_sprite_direction(direction):
	if direction.x > 0:
		sprite_2d.play("right")
	elif direction.x < 0:
		sprite_2d.play("left")
	elif direction.y > 0:
		sprite_2d.play("down")
	elif direction.y < 0:
		sprite_2d.play("up")

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

func _on_lantern_pulse(pos):
	var pulse = pulse_scene.instantiate() as Area2D
	pulse.position = pos
	$Pulses.add_child(pulse)


func _on_cone_timer_timeout():
	if GameManager.is_cone_boosting:
		GameManager.oil -= GameManager.cone_boost_cost
	elif GameManager.is_coneing and !GameManager.is_cone_boosting:
		GameManager.oil -= GameManager.cone_cost
