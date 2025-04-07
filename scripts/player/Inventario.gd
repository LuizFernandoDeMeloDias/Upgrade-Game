extends Control

export(NodePath) var grid_container_path
var itens = []

var indexSelectedSlot = 0

func _process(delta):
	Global.slot = get_node("GridContainer").get_child(indexSelectedSlot)
	if Input.is_action_just_pressed("ui_accept"):
		usar_item()
	if Input.is_action_just_pressed("ui_scroll_down") and indexSelectedSlot != 0:
		indexSelectedSlot -= 1
		get_node("GridContainer").get_child(indexSelectedSlot).modulate = 'ff4a4a'
		get_node("GridContainer").get_child(indexSelectedSlot + 1).modulate = 'ffffff'
	if Input.is_action_just_pressed("ui_scroll_up") and indexSelectedSlot != 15:
		indexSelectedSlot += 1
		get_node("GridContainer").get_child(indexSelectedSlot).modulate = 'ff4a4a'
		get_node("GridContainer").get_child(indexSelectedSlot - 1).modulate = 'ffffff'
	
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

func atualizarinventario():
	itens.clear()
	for i in range(get_node("GridContainer").get_child_count()):
		var slot = get_node("GridContainer").get_child(i)
		itens.append(slot.dadosslot)

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

