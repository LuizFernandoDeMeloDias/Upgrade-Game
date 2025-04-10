extends Control

export(NodePath) var grid_container_path
var itens = []

onready var slot = get_node("GridContainer").get_child(indexSelectedSlot)

var indexSelectedSlot = 0
var totalSlots = 16






func _process(delta):
	Global.slot = slot
	
	if Input.is_action_just_pressed("ui_accept"):
		usar_item()

	if Input.is_action_just_pressed("ui_scroll_down") and indexSelectedSlot > 0:
		update_slot_selection(indexSelectedSlot, indexSelectedSlot - 1)
		indexSelectedSlot -= 1

	if Input.is_action_just_pressed("ui_scroll_up") and indexSelectedSlot < totalSlots - 1:
		update_slot_selection(indexSelectedSlot, indexSelectedSlot + 1)
		indexSelectedSlot += 1

func update_slot_selection(previous_index, new_index):
	var grid = get_node("GridContainer")
	grid.get_child(previous_index).modulate = Color("ffffff")
	grid.get_child(new_index).modulate = Color("ff4a4a")


func _ready():
	get_node("GridContainer").get_child(indexSelectedSlot).modulate = 'ff4a4a'
	for i in range(get_node("GridContainer").get_child_count()):
		var slot = get_node("GridContainer").get_child(i)
		itens.append(slot.dados_slot)


func usar_item():
	var slot = get_node("GridContainer").get_child(indexSelectedSlot)
	var item_data = slot.dados_slot
	if item_data['funcionalidade'] != null:
		item_data['funcionalidade'].usar(item_data, slot)

func atualizarInventario():
	itens.clear()
	for i in range(get_node("GridContainer").get_child_count()):
		var slot = get_node("GridContainer").get_child(i)
		itens.append(slot.dados_slot)
		
func add_item(dados_coletavel):
	for i in range(get_node("GridContainer").get_child_count()):
		if itens[i]['nome'] == dados_coletavel['nome']: # verifica se tem um item com o mesmo nome do que foi coletado
			if dados_coletavel['estocavel'] == true: 
				var slot = get_node("GridContainer").get_child(i)
				itens[i]['amount'] += dados_coletavel['amount']
				slot.atualizar_slot(itens[i])
				return 
			continue
	for i in range(get_node("GridContainer").get_child_count()):
		if itens[i]['nome'] == null: # Verifica se tem um slot vazio
			itens[i] = dados_coletavel
			var slot = get_node("GridContainer").get_child(i)
			slot.atualizar_slot(itens[i])
			return

