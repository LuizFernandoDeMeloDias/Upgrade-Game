extends StaticBody2D

var loja_aberta = false

func interagir():
	abrir_loja()

func abrir_loja():
	loja_aberta = true
	# Mostrar a aba da loja
	$Texture/CanvasLayer/AbaDaLoja.show()
	# Pausar o jogo
	get_tree().paused = true

func fechar_loja():
	loja_aberta = false
	# Ocultar a aba da loja
	$Texture/CanvasLayer/AbaDaLoja.hide()
	# Despausar o jogo
	get_tree().paused = false


func _on_Button_pressed():
	pass # Replace with function body.
