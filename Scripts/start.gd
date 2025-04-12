extends Control

@onready var label = $Label
@onready var animation_player = $AnimationPlayer
@onready var start_sound = $StartSound

func _ready():
	label.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 1.0, 2.0).set_trans(Tween.TRANS_SINE)
	animation_player.play("flicker")
	
func _process(_delta):
	if Input.is_action_just_pressed("Pulse"):
		start_sound.play()
		await get_tree().create_timer(.5).timeout
		get_tree().change_scene_to_file("res://Scenes/level.tscn")
