extends TextureButton

var amounttotal = 0

func atualizar_slot(nome, icon, amount):
	get_node("itemTexture").texture = icon
	get_node(".").name = nome
	get_node("slottexture/amount").text = str(amounttotal + amount)
	
func atualizar_amount(amount):
	get_node("slottexture/amount").text = str(amounttotal + amount)
