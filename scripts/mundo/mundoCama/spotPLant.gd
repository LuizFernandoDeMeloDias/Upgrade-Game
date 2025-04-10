extends Area2D

var regar = false
var foiMolhada = false
var foiPlantada = false

var planta: Dictionary



func podeSerMolhada():
	return not foiMolhada

func molharPlanta():
	if not foiMolhada:
		var textura = preload("res://texture/cenarios/terra/spotplanting2.png")
		$spotTexture.texture = textura
		print("Planta molhada!")
		foiMolhada = true

func plantarPlanta(dadosPlanta: Dictionary) -> void:
	pass


func _on_spotPLant_mouse_entered():
	get_node("spotTexture").modulate = "7c7c7c"
	Global.plantaEmFoco = self

func _on_spotPLant_mouse_exited():
	get_node("spotTexture").modulate = "ffffff"
	if Global.plantaEmFoco == self:
		Global.plantaEmFoco = null
