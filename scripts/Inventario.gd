extends Control

export(NodePath) var grid_container_path
var itens = []

var indexSelectedSlot = 0

func atualizar_slot(index):
	get_node("GridContainer").get_child(index).dados_slot[index] = itens[index]
	get_node("GridContainer").get_child(index).atualizar_slot(itens[index])

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

func add_item(dados_coletavel):
	itens.append(dados_coletavel)
	for item in itens:
		print(item['nome'])
	for i in range(get_node("GridContainer").get_child_count()):
		var slot = get_node("GridContainer").get_child(i)
		


