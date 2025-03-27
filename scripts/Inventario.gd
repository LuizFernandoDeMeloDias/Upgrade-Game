extends Control

export(NodePath) var grid_container_path
var itens = []
var maxslots = 16

var selectedSlot = 0



func _process(delta):
	if Input.is_action_just_pressed("ui_scroll_down") and selectedSlot != 0:
		selectedSlot -= 1
		get_node("GridContainer").get_child(selectedSlot).modulate = 'ff4a4a'
		get_node("GridContainer").get_child(selectedSlot + 1).modulate = 'ffffff'
	if Input.is_action_just_pressed("ui_scroll_up") and selectedSlot != 15:
		selectedSlot += 1
		get_node("GridContainer").get_child(selectedSlot).modulate = 'ff4a4a'
		get_node("GridContainer").get_child(selectedSlot - 1).modulate = 'ffffff'
	
	
	if Input.is_action_just_pressed("ui_accept"):
		if get_node("GridContainer").get_child(selectedSlot).dados_slot["nome"] == 'Regador':
			for node in get_tree().get_nodes_in_group("areaPlant"):
				node.regar = true
		else:
			for node in get_tree().get_nodes_in_group("areaPlant"):
				node.regar = false




func _ready():
	
	criar_slots(maxslots)
	get_node("GridContainer").get_child(selectedSlot).modulate = 'ff4a4a'

func criar_slots(maxslots):
	var slots = preload("res://cenas/SlotItem.tscn")
	for i in range(maxslots):
		var slot_instance = slots.instance()
		slot_instance.name = 'emptySlot' + str(i)
		itens.append(
			{
				'nome': "null",
				'icone': null,
				'description': 'null',
				'amount': 0,
				'estocavel': false
			}
		)
		get_node("GridContainer").add_child(slot_instance)

func add_item(amount, description, nome, icon, estocavel):
	for i in range(len(itens)):
		if itens[i]["nome"] == nome and itens[i]["estocavel"]:
			var slot = get_node("GridContainer").get_child(i)
			itens[i]["amount"] += amount
			slot.atualizar_amount(itens[i]["amount"])
			return

	# Impede duplicação de itens não estocáveis
	for i in range(len(itens)):
		if itens[i]["nome"] == nome and not itens[i]["estocavel"]:
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
			var slot = get_node("GridContainer").get_child(i)
			slot.atualizar_slot(nome, icon, amount, description)
			return

