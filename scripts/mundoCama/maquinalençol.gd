extends StaticBody2D

export (NodePath) onready var itens_player = get_node(itens_player)

onready var timer: Timer = Timer.new()

var qtd_linha_maquina = 0
var valor_saida: int = 2
var valor_entrada: int = 1
var qtd_max = 2

var buttons = 0

func _ready():

	add_child(timer)
	timer.wait_time = 15
	timer.connect("timeout", self, "_on_Timer_timeout")

func _process(delta):
	var percent = (timer.wait_time - timer.time_left) / timer.wait_time * 100
	get_node("ProgressBar").value = percent


func fabricar() -> void:
	if timer.is_stopped():
		get_node("texture").play("linha1")
		get_node("ProgressBar").visible = true
		get_node("texture/animation").play("maquina_ligada")
		timer.start()


func reset() -> void:
	get_node("texture").play("idle")
	get_node("texture/animation").play("RESET")
	timer.stop()
	timer.wait_time = 15
	get_node("ProgressBar").value = 0
	get_node("ProgressBar").visible = false
	get_node("alavanca1/timer").frame = 2
	get_node("alavanca2/timer").frame = 2
	get_node("alavanca3/timer").frame = 2


func interagir() -> void:
	if itens_player.linhaQtd >= 1:
		itens_player.tirar_item(1, "linha")
		qtd_linha_maquina += valor_entrada
		get_node("qtd").text = str(qtd_linha_maquina)

func _on_Timer_timeout():
	qtd_linha_maquina -= valor_saida
	get_node("saidaMaquina").add_value(valor_saida)
	get_node("qtd").text = str(qtd_linha_maquina)
	get_node("ProgressBar").visible = false
	timer.stop()
	reset()








