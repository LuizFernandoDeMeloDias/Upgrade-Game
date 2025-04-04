extends Area2D

export var amount: int 
export var nome: String
export var description: String
export var icon: Texture
export var estocavel: bool
export(String) var funcionalidade  # Adicionamos essa variável

var dados_coletavel = {}

func _ready():
	description = nome + ': ' + description
	get_node("texture").texture = icon
	dados_coletavel = {
		'amount': amount,
		'nome': nome,
		'description': description,
		'icon': icon,
		'estocavel': estocavel,
		'funcionalidade': funcionalidade,  # Guardamos a funcionalidade
		'backup': null
	}

func coletar():
	get_tree().call_group('inventario', 'add_item', dados_coletavel)
	queue_free()
