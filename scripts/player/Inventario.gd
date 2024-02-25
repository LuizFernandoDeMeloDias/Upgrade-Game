extends Node

enum lista_item {
	MONTE,
	a,
	b,
	c,
	d,
	NOME
}

var lista_inventario: Array

func enviar_item(lista: Array) -> void:
	var nova_lista: Array = lista.duplicate(true)
	for i in lista_inventario.size():
		if lista_inventario[i][lista_item.NOME] == nova_lista[lista_item.NOME]:
			if lista_inventario[i][lista_item.MONTE] < 9:
				lista_inventario[i][lista_item.MONTE] += 1
				get_tree().call_group("inventario", "atualizar_slot_item", i, lista_inventario[i][lista_item.MONTE])
				return

func atualizar_alost(index_slot: int, novo_monte: int) -> void:
	lista_inventario[index_slot][lista_item.MONTE] = novo_monte
	get_tree().call_group("inventario", "atualizar_item_slot", index_slot, novo_monte)
