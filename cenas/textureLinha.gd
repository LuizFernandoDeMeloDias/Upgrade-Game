extends Sprite

var amount
var nome
var description
var icon
var estocavel

func coletar():
	amount = 1
	nome = 'alguma coisa'
	description = 'testezin de descrição maior que dê certo'
	icon = preload("res://texture/cenarios/mundo cama/teste3.png")
	estocavel = true
	get_tree().call_group('inventario', 'add_item', amount, nome, description, icon, estocavel)
	queue_free()
	pass
