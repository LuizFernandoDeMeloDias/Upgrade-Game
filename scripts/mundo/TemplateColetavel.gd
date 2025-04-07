extends Area2D

export var amount: int 
export var totalAmount: int
export var nome: String
export var description: String
export var icon: Texture
export var estocavel: bool

export(Resource) var item_script

var dados_coletavel = {}

func _ready():
	description = nome + ': ' + description
	get_node("texture").texture = icon
	dados_coletavel = {
		'amount': amount,
		'totalAmount': totalAmount,
		'nome': nome,
		'description': description,
		'icon': icon,
		'estocavel': estocavel,
		'funcionalidade': item_script, 
		'backup': null
	}

func coletar():
	get_tree().call_group('inventario', 'add_item', dados_coletavel)
	queue_free()
