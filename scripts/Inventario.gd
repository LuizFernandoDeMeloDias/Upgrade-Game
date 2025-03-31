extends Control

export(NodePath) var grid_container_path
var itens = []

var indexSelectedSlot = 0

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
	get_node("GridContainer").get_child(indexSelectedSlot).modulate = 'ff4a4a'
	for i in range(get_node("GridContainer").get_child_count()):
		var slot = get_node("GridContainer").get_child(i)
		var dados_slot = slot.dados_slot
		itens.append(dados_slot)

func add_item(dados_coletavel):
	for i in range(get_node("GridContainer").get_child_count()):
		if itens[i]['nome'] == dados_coletavel['nome']: # verifica se tem um item com o mesmo nome do que foi coletado
			if dados_coletavel['estocavel'] == false: 
				continue # sai do loop se o item não for estocavel 
			itens[i] = dados_coletavel
			var slot = get_node("GridContainer").get_child(i)
			itens[i]['amount'] += dados_coletavel['amount']
			slot.atualizar_slot(itens[i])
			
			return
		elif itens[i]['nome'] == null: # Verifica se tem um slot vazio
			itens[i] = dados_coletavel
			var slot = get_node("GridContainer").get_child(i)
			slot.atualizar_slot(itens[i])
			return


