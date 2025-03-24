extends Area2D

export var amount: int 
export var nome: String
export var description: String
export var icon: Texture
export var estocavel: bool

func _ready():
	description = nome + ': ' +  description
	get_node("texture").texture = icon


func coletar():
	get_tree().call_group('inventario', 'add_item', amount, description , nome, icon, estocavel)
	queue_free()
