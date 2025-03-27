extends TextureButton

var dados_slot = {
	"nome": '',
	"icon": null,
	"totalAmount": 0,
	"description": '',
}

func atualizar_slot(nome, icon, amount, description):
	dados_slot["nome"] = nome
	dados_slot["icon"] = icon
	dados_slot["totalAmount"] = amount
	dados_slot["description"] = description
	
	self.name = dados_slot["nome"]
	
	get_node("itemTexture").texture = dados_slot["icon"]
	get_node("slottexture/background/description").text = dados_slot["description"]
	get_node("slottexture/amount").text = str(amount)

func atualizar_amount(amount):
	dados_slot['totalAmount'] = amount
	get_node("slottexture/amount").text = str(amount)

func _on_SlotItem_mouse_entered():
	if !self.name.begins_with('emptySlot'):
		$slottexture/background.show()

func _on_SlotItem_mouse_exited():
	$slottexture/background.hide()

func get_drag_data(position):
	var preview = TextureRect.new()
	preview.texture = dados_slot["icon"]
	set_drag_preview(preview)

	var data_to_send = dados_slot.duplicate()
	data_to_send["origem"] = self 
	return data_to_send

func can_drop_data(position, data):
	return data.has("nome")

func drop_data(position, data):
	if "origem" in data and data["origem"] != self:
		
		atualizar_slot(data["nome"], data["icon"], data["totalAmount"], data["description"])
		
		var origem_index = data["origem"].get_index()
		var destino_index = get_index()
		
		var inventory_manager = get_tree().get_nodes_in_group("inventario")[0]
		inventory_manager.itens[destino_index] = inventory_manager.itens[origem_index]
		inventory_manager.itens[origem_index] = {
			'nome': "null",
			'icone': null,
			'description': 'null',
			'amount': 0,
			'estocavel': false
		}

		data["origem"].limpar_slot()

func limpar_slot():
	dados_slot = {
		"nome": '',
		"icon": null,
		"totalAmount": 0,
		"description": '',
	}
	get_node("itemTexture").texture = null
	get_node("slottexture/amount").text = ""
	get_node("slottexture/background/description").text = ""

