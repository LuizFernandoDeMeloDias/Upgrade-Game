extends TextureButton

var dados_slot = {
	"nome": null,
	"icon": null,
	"amount": 0,
	"description": '',
	'backup': self,
	'estocavel': null,
	"funcionalidade": null
}
func _ready():
	pass


func _on_SlotItem_mouse_entered():
	if dados_slot['nome'] != null:
		$slottexture/background.show()

func _on_SlotItem_mouse_exited():
	$slottexture/background.hide()

func atualizar_slot(data):
	if data['amount'] == 0 and data['nome'] != ' ' and data['estocavel']:
		set_empty_slot()
		return
	dados_slot = data
	get_node("itemTexture").texture = dados_slot['icon']
	get_node("slottexture/amount").text = str(dados_slot['amount'])
	get_node("slottexture/background/description").text = dados_slot['description']
	dados_slot['backup'] = self
	get_tree().call_group('inventario', 'atualizarInventario')
	
	
	
func get_drag_data(position):
	var data = dados_slot
	var preview = TextureRect.new()
	preview.texture = get_node("itemTexture").texture
	preview.expand = true
	preview.rect_min_size = Vector2(8, 8)
	set_drag_preview(preview)
	set_empty_slot()
	return data

func set_empty_slot():
	var emptySlot = {
	"nome": null,
	"icon": null,
	"amount": 0,
	"description": '',
	'backup': self,
	'estocavel': null,
	"funcionalidade": null
	}
	print('a')
	dados_slot = emptySlot
	atualizar_slot(dados_slot)
	get_tree().call_group('inventario', 'atualizarInventario')



func can_drop_data(position, data):
	return true


func drop_data(position, data):
	data.backup.atualizar_slot(dados_slot)
	atualizar_slot(data)
	
	get_tree().call_group('inventario', 'atualizarInventario')
	
	

