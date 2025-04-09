extends CharacterBody2D

@onready var nav = $NavigationAgent2D
@onready var ray = $RayCast2D
@onready var player = %Player
@onready var sprite = $Sprite

var SPEED = 100
var health = 10
var damage = 50


func _ready():
	if ray.is_colliding():
		ray.set_target_position(player.position)
		nav.target_position = player.position

func _physics_process(delta):
	ray.set_target_position(player.position)
	if ray.is_colliding():
		nav.target_position = player.position
		if nav.is_navigation_finished():
			return
		var pos = position
		var target_pos = nav.get_next_path_position()
		velocity = pos.direction_to(target_pos) * SPEED * delta
		if pos.direction_to(target_pos).x > 0:
			sprite.flip_h = false
		elif pos.direction_to(target_pos).x < 0:
			sprite.flip_h = true
		if health > 0:
			move_and_slide()

func hit(hurt):
	health -= hurt


func _on_area_2d_body_entered(body):
	if body.has_method("hit"):
		body.hit(damage)
