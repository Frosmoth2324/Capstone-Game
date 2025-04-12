extends Control

@onready var label = $Node2D/F
@onready var animation_player = $AnimationPlayer
@onready var start_sound = $StartSound
var flickertime1 = 0.0
var flickertime2 = 0.0

func _ready():
	#label.modulate.a = 0.0
	#var tween = create_tween()
	#tween.tween_property(label, "modulate:a", 1.0, 2.0).set_trans(Tween.TRANS_SINE)
	#animation_player.play("flicker")
	for i in 5:
		flickertime1 = randf_range(0.05,0.3)
		flickertime2 = randf_range(0.1,0.5)
		print(flickertime1)
		print(flickertime2)
		label.hide()
		await get_tree().create_timer(flickertime1).timeout
		label.show()
		await get_tree().create_timer(flickertime2).timeout
	
func _process(_delta):
	pass
		


func _on_start_button_pressed() -> void:
	start_sound.play()
	#await get_tree().create_timer(.5).timeout
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
