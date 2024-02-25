extends StaticBody2D

export var qtd_lecol: int

func _ready():
	$Label.text = str(qtd_lecol)

func interagir():
	if qtd_lecol >= 2:
		get_tree().call_group("itens_player", "adicionar_item", qtd_lecol, "pano")
		qtd_lecol -= 2
		$Label.text = str(qtd_lecol)
		print(qtd_lecol)

func add_value(value) -> void:
	qtd_lecol += value
	$Label.text = str(qtd_lecol)
func sub_value(value) -> void:
	$Label.text
