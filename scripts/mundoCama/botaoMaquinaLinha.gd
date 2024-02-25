extends StaticBody2D

export(NodePath) onready var maquina = get_node(maquina)

func interagir():
	if maquina.qtd_linha_maquina >= 2:
		
		maquina.fabricar()
