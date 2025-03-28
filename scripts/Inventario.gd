extends Control

export(NodePath) var grid_container_path
var itens = []
var maxslots = 16

var indexSelectedSlot = 0

func atualizar_slot(index):
	get_node("GridContainer").get_child(index).dados_slot[index] = itens[index]
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_scroll_down") and indexSelectedSlot != 0:
		indexSelectedSlot -= 1
		get_node("GridContainer").get_child(indexSelectedSlot).modulate = 'ff4a4a'
		get_node("GridContainer").get_child(indexSelectedSlot + 1).modulate = 'ffffff'
	if Input.is_action_just_pressed("ui_scroll_up") and indexSelectedSlot != 15:
		indexSelectedSlot += 1
		get_node("GridContainer").get_child(indexSelectedSlot).modulate = 'ff4a4a'
		get_node("GridContainer").get_child(indexSelectedSlot - 1).modulate = 'ffffff'
	
func _ready():
	atualizar_itens()
	get_node("GridContainer").get_child(indexSelectedSlot).modulate = 'ff4a4a'


func atualizar_itens():
	pass

func add_item(amount, description, nome, icon, estocavel):
	for i in range(len(itens)):
		if itens[i]["nome"] == nome and itens[i]["estocavel"]:
			itens[i]["amount"] += amount
			return
			
	for i in range(len(itens)):
		if itens[i]["nome"] == 'null':
			itens[i] = {
				"nome": nome,
				"amount": amount,
				"icone": icon,
				"description": description,
				"estocavel": estocavel
		}
			atualizar_slot(i)


