extends CanvasLayer

@onready var health_bar = $UI/VBoxContainer/Health/HealthBar
@onready var health_number = $UI/VBoxContainer/Health/HealthNumber
@onready var oil_bar = $UI/VBoxContainer/Oil/OilBar
@onready var oil_number = $UI/VBoxContainer/Oil/OilNumber


func _ready():
	oil_bar.max_value = GameManager.MAX_OIL
	health_bar.max_value = GameManager.MAX_HEALTH
	oil_number.text = str(GameManager.MAX_OIL)
	health_number.text = str(GameManager.MAX_HEALTH)

func _process(_delta):
	oil_bar.value = GameManager.oil
	health_bar.value = GameManager.health
	oil_number.text = str(GameManager.oil)
	health_number.text = str(GameManager.health)
	if GameManager.oil > GameManager.MAX_OIL:
		pass
	else:
		pass
	
