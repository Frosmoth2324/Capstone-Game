extends Control

@onready var animation_player = $AnimationPlayer
@onready var restart_label = $Label/RestartLabel
@onready var start_sound = $StartSound

func _ready():
		animation_player.play("die_message_fade_in")
		print("Wave: " + str(GameManager.wave))

func _process(_delta):
	if Input.is_action_just_pressed("Start"):
		start_sound.play()
		await get_tree().create_timer(.5).timeout
		GameManager.oil = GameManager.MAX_OIL
		GameManager.health = GameManager.MAX_HEALTH
		GameManager.dead = false
		GameManager.wave = 0
		GameManager.enemies_remaining = 0
		GameManager.is_in_wave = true
		
		get_tree().change_scene_to_file("res://Scenes/level.tscn")
