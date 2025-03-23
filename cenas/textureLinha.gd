extends Sprite

var amount
var nome
var description
var icon
var estocavel

func coletar():
	amount = 3
	nome = 'linha'
	description = 'linha teste'
	icon = preload("res://texture/cenarios/mundo cama/Linha_item.png")
	estocavel = true
	get_tree().call_group('inventario', 'add_item', amount, nome, description, icon, estocavel)
	queue_free()
	pass
