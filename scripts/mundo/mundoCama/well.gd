extends StaticBody2D

func interagir():
	if Global.slot.dados_slot['nome'] == 'Regador':
		var dadosItens = Global.slot.dados_slot
		dadosItens['amount'] = 10
		Global.slot.atualizar_slot(dadosItens)
		
