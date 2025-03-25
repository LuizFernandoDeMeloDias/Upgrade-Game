extends TextureButton

var dados_slot = {
	"nome": '',
	"icon": Texture,
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
	get_node("slottexture/amount").text = str(amount)
	dados_slot['totalAmount'] = amount + dados_slot['totalAmount']


func _on_SlotItem_mouse_entered():
	if !get_node(".").name.begins_with('empt'):
		$slottexture/background.show()

func _on_SlotItem_mouse_exited():
	$slottexture/background.hide()
	


func get_drag_data(position):
	var preview = TextureRect.new()
	preview.texture = dados_slot["icon"]
	set_drag_preview(preview)

	# Adiciona uma referência ao próprio slot nos dados enviados
	var data_to_send = dados_slot.duplicate()
	data_to_send["origem"] = self  # Salva a referência do slot de origem
	return data_to_send

func can_drop_data(position, data):
	print(self.name)
	return data.has("nome") 

func drop_data(position, data):
	print(data['nome'] + ' ', dados_slot['nome'])
	
	# Atualiza o slot atual com os dados recebidos
	atualizar_slot(data["nome"], data["icon"], data["totalAmount"], data["description"])

	# Se a referência do slot de origem existir, zera ele
	if "origem" in data and data["origem"] != null:
		data["origem"].limpar_slot()

func limpar_slot():
	atualizar_slot('', null, 0, '')  # Zera os dados do slot
