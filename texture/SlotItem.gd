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
	return dados_slot  

func can_drop_data(position, data):
	return data.has("nome") 

func drop_data(position, data):
	print(data['nome'] + ' ', dados_slot['nome'])
	dados_slot["nome"] = data["nome"]
	dados_slot["icon"] = data["icon"]
	dados_slot["totalAmount"] += data["totalAmount"]
	dados_slot["description"] = data["description"]

	atualizar_slot(dados_slot["nome"], dados_slot["icon"], dados_slot["totalAmount"], dados_slot["description"])

