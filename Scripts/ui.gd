extends CanvasLayer

@onready var health_bar = $UI/VBoxContainer/Health/HealthBar
@onready var oil_bar = $UI/VBoxContainer/Oil/OilBar


func _ready():
	oil_bar.max_value = GameManager.MAX_OIL
	health_bar.max_value = GameManager.MAX_HEALTH

func _process(_delta):
	oil_bar.value = GameManager.oil
	health_bar.value = GameManager.health
