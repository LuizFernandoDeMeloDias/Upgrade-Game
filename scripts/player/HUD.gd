extends CanvasLayer


export(NodePath) var inventario_path

func _ready():
	var inventario = get_node(inventario_path)
	var icone_exemplo = preload("res://texture/cenarios/mundo cama/Linha_item.png") 

func _process(delta):
	if Input.is_action_just_pressed("tab") :
		get_node("Inventario").show()
	if Input.is_action_just_pressed("ui_cancel"):
		get_node("Inventario").hide()
