extends ItemBase

class_name Regador

func usar(dadosItem, slotRef):
	if dadosItem["amount"] > 0 and Global.plantaEmFoco:
		if Global.plantaEmFoco.podeSerMolhada():
			dadosItem["amount"] -= 1
			slotRef.atualizar_slot(dadosItem)
			Global.plantaEmFoco.molharPlanta()
