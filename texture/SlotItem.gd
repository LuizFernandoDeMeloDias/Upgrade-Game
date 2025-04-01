extends TextureButton

var dados_slot = {
	"nome": null,
	"icon": null,
	"amount": 0,
	"description": '',
	'backup': self
}
func _ready():
	pass
	
func _on_SlotItem_mouse_entered():
	if dados_slot['nome'] != null:
		$slottexture/background.show()

func _on_SlotItem_mouse_exited():
	$slottexture/background.hide()

func atualizar_slot(data):
	dados_slot = data
	get_node("itemTexture").texture = dados_slot['icon']
	get_node("slottexture/amount").text = str(dados_slot['amount'])
	get_node("slottexture/background/description").text = dados_slot['description']
	dados_slot['backup'] = self
	
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
	dados_slot = {
	"nome": null,
	"icon": null,
	"amount": 0,
	"description": '',
	'backup': self
	}
	atualizar_slot(dados_slot)


func can_drop_data(position, data):
	return true


func drop_data(position, data):
	data.backup.atualizar_slot(dados_slot)
	atualizar_slot(data)
	
	get_tree().call_group('inventario', 'atualizar_inventario')
	
	

