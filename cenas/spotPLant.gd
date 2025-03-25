extends Area2D

var mouse_interact: bool = false



func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept") and mouse_interact:
		molhar_planta()

func molhar_planta():
	var slot = preload("res://texture/cenarios/terra/spotplanting2.png")
	self.get_node("spotTexture").texture = slot 






func _on_spotPLant_mouse_entered():
	mouse_interact = true
	print(self.name + ' entrou ')

func _on_spotPLant_mouse_exited():
	mouse_interact = false
	print(self.name + ' saiu  ')
