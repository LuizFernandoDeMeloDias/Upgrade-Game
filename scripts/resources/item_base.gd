
extends Resource
class_name ItemBase

export(String) var nome
export(Texture) var icone

func usar(dados_item, slot_ref):
	print("Usando item base (deve ser sobrescrito)")
