extends StaticBody2D

export(NodePath) onready var itens_player = get_node(itens_player)

var linha_item = preload("res://cenas/linha.tscn")
var fabricar = true


onready var timer: Timer = Timer.new()
var qtd_linha: int = 0
var max_linha = 10
func _ready():
	add_child(timer)
	timer.wait_time = 1
	timer.start()
	timer.connect("timeout", self, "_on_Timer_timeout")

func _process(delta):
	var qtd_intance_linha = get_node("linhas").get_child_count()
	$qtd.text = str(qtd_intance_linha)
	if qtd_intance_linha != 10:
		fabricar = true
		$ProgressBar.visible = true
	else:
		$ProgressBar.visible = false
		fabricar = false
	var percentage = (timer.wait_time - timer.time_left) / timer.wait_time * 100.0
	get_node("ProgressBar").value = percentage

func _on_Timer_timeout():
	var linha = linha_item.instance()
	var qtd_intance_linha = get_node("linhas").get_child_count()
	if fabricar:
		$linhas.add_child(linha)


