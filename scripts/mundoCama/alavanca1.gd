extends StaticBody2D

export(NodePath) onready var maquina  = get_node(maquina) as StaticBody2D
var press_sucess = false


func _process(delta):
	var maquina_timer = maquina.timer.time_left
	if maquina_timer < 14 and maquina_timer > 12:
		get_node("timer").frame = 0
	elif maquina_timer < 12 and maquina_timer > 11:
		get_node("timer").frame = 1
	elif maquina_timer < 11 and press_sucess == false:
		get_node("timer").frame = 2
		maquina.reset()
		
func interagir() -> void:
	var maquina_timer = maquina.timer.time_left
	if maquina_timer > 11 and maquina_timer < 12:
		maquina.get_node("texture").play("linha2")
		press_sucess = true
	else:
		press_sucess = false
