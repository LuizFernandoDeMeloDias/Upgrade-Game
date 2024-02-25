extends AnimatedSprite

export (NodePath) onready var maquina = get_node(maquina)


func _ready():
	play("idle")
func _process(delta):
	estados_animation()

func estados_animation() -> void:
	pass
