extends Node2D

var linhaQtd: int
var panoQtd: int

var item: String

func adicionar_item(valor, item) -> void:
	match item:
		"linha":
			linhaQtd += valor
			$qtdLinha.text = str(linhaQtd)
		"pano":
			print('oi')
			panoQtd += valor
			$qtdPano.text = str(panoQtd)
	
func tirar_item(valor, item) -> void:
	match item:
		"linha":
			linhaQtd -= valor
			$qtdLinha.text = str(linhaQtd)
		"pano":
			panoQtd -= valor
			$qtdPano.text = str(panoQtd)
		

