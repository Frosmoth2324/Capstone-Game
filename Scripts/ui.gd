extends CanvasLayer

@onready var oil_bar = $UI/VBoxContainer/HBoxContainer/OilBar

func _ready():
	oil_bar.max_value = GameManager.MAX_OIL

func _process(_delta):
	oil_bar.value = GameManager.oil
