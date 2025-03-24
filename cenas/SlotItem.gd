extends TextureButton

var amounttotal = 0

func atualizar_slot(nome, icon, amount, description):
	get_node("slottexture/background/description").text = description
	get_node("itemTexture").texture = icon
	get_node(".").name = nome
	get_node("slottexture/amount").text = str(amounttotal + amount)
	
func atualizar_amount(amount):
	get_node("slottexture/amount").text = str(amounttotal + amount)


func _on_SlotItem_mouse_entered():
	if !get_node(".").name.begins_with('empt'):
		$slottexture/background.show()


func _on_SlotItem_mouse_exited():
	$slottexture/background.hide()
