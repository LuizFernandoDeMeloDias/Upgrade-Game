extends ItemBase

var dadosCotton: Dictionary = {
	'tempoDeCrescimento': 10,
	'quantidadeColheita': 2,
}


func usar(dadosItem, slotRef):
	if dadosItem["amount"] > 0 and Global.plantaEmFoco:
		if Global.plantaEmFoco.podeSerPlantada():
			dadosItem["amount"] -= 1
			slotRef.atualizar_slot(dadosItem)
			Global.plantaEmFoco.plantarPlanta(dadosCotton)
