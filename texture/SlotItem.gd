extends TextureButton

var dados_slot = {
	"nome": null,
	"icon": null,
	"totalAmount": 0,
	"description": '',
}
func _ready():
	pass
	
func _on_SlotItem_mouse_entered():
	if !self.name.begins_with('emptySlot'):
		$slottexture/background.show()

func _on_SlotItem_mouse_exited():
	$slottexture/background.hide()



