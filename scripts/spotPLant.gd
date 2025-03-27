extends Area2D

var mouse_interact: bool = false
var regar = false


func _process(delta):
	if mouse_interact:
		get_node("spotTexture").modulate = "7c7c7c"
	else:
		get_node("spotTexture").modulate = "ffffff"
	if Input.is_action_just_pressed("ui_accept") and mouse_interact:
		molhar_planta()
func regar(canregar):
	regar = canregar
	return regar
func molhar_planta():
	if regar :
		var slot = preload("res://texture/cenarios/terra/spotplanting2.png")
		self.get_node("spotTexture").texture = slot 






func _on_spotPLant_mouse_entered():
	mouse_interact = true

func _on_spotPLant_mouse_exited():
	mouse_interact = false
