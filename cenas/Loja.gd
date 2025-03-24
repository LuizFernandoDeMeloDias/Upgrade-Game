extends StaticBody2D

var dados_loja = {
	"upgrades": [
		{
			'id': 'Correr Mais rapido',
			'custo': 500,
			'inStock': true
		},
		{
			'id': 'texte2',
			'custo': 100,
			'inStock': true
		},
		{
			'id': 'pular',
			'custo': 200,
			'inStock': true
		},
	]
}

var itemStore = preload("res://cenas/itemStore.tscn")


var loja_aberta = false

export(NodePath) onready var player = get_node(player) as KinematicBody2D

func interagir():
	abrir_loja()

const DISTANCIA_MAXIMA = 55  # Defina a distância máxima para fechar a loja

func _process(delta):
	if loja_aberta:
		var distancia = global_position.distance_to(player.global_position)
		if distancia > DISTANCIA_MAXIMA:
			fechar_loja()

func remover_upgrade(id):
	for i in range(dados_loja['upgrades'].size()):
		if dados_loja['upgrades'][i]['id'] == id:
			dados_loja['upgrades'].remove(i)
			break

func abrir_loja():
	
	var vcon = player.find_node('verticalCont', true, false)
	var hud = player.find_node('controllHUD', true, false)
	var upgrades = dados_loja['upgrades']
	
	if vcon and !loja_aberta:
		hud.show()
		loja_aberta = true
		
		for upgrade in upgrades:
			var itemSotreInstance = itemStore.instance()
			itemSotreInstance.get_node("itemName").text = upgrade['id']
			itemSotreInstance.get_node("Price").text = str(upgrade['custo'])
			
			if upgrade['inStock'] == true:
				vcon.add_child(itemSotreInstance)
		loja_aberta  = true

func fechar_loja():
	var vcon = player.find_node('verticalCont', true, false)
	var hud = player.find_node('controllHUD', true, false)
	if vcon:
		hud.hide()
		for child in vcon.get_children():
			child.queue_free() 
	loja_aberta = false

