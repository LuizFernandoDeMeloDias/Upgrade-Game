extends Control


export(NodePath) var grid_container_path


var itens = []

var maxslots = 16

func _ready():
	criar_slots(maxslots)
	
func criar_slots(maxslots):
	var slots = preload("res://cenas/SlotItem.tscn")
	for i in range(maxslots):
		var slot_instance = slots.instance()
		slot_instance.name = 'emptySlot' + str(i)
		itens.append(
			{
				'nome': "null",
				'icone': 'null',
				'description': 'null',
				'amount': 0,
				'estocavel': false
			}
		)
		get_node("GridContainer").add_child(slot_instance)

func add_item( amount, description , nome, icon, estocavel):
	for i in range(len(itens)):
		if itens[i]["nome"] == nome and itens[i]["estocavel"] == true:
			var slot = get_node("GridContainer").get_child(i)
			amount = itens[i]["amount"] + amount
			slot.atualizar_amount(amount)
			return

	for i in range(len(itens)):
		if itens[i]["nome"] == 'null':
			itens[i]["nome"] = nome
			itens[i]["amount"] = amount
			itens[i]["icone"] = icon
			itens[i]["description"] = description
			itens[i]['estocavel'] = estocavel
			var slot = get_node("GridContainer").get_child(i)
			slot.atualizar_slot(nome, icon, amount, description)
			return
