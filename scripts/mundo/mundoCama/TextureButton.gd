extends TextureButton



func _on_TextureButton_pressed():
	var loja = get_tree().get_root().find_node("loja", true, false)
	var ID = get_node('../itemName').text
	loja.remover_upgrade(ID)
	get_node('../').queue_free()
