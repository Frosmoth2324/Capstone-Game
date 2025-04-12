extends Control

@onready var animation_player = $AnimationPlayer

func _ready():
		animation_player.play("die_message_fade_in")
		print("Wave: " + str(GameManager.wave))
