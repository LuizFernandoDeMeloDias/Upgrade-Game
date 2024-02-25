extends Sprite

export(NodePath) onready var player = get_node(player) as KinematicBody2D
export(NodePath) onready var animation = get_node(animation) as AnimationPlayer
export(NodePath) onready var vision = get_node(vision) as RayCast2D
var direction = ""

func _process(delta):
	move_states()

func move_states() -> void:
	var lado = player.motion

	if lado.x > 0:
		flip_h = true
		animation.play("correndo_lado")
		direction = "direita"
		vision.rotation_degrees = -90
		
	elif lado.x < 0:
		flip_h = false
		animation.play("correndo_lado")
		direction = "esquerda"
		vision.rotation_degrees = 90
	else:
		if direction == "direita" or direction == "esquerda":
			animation.play("parado_lado")
	
	if lado.y < 0 and lado.x  == 0:
		animation.play("correndo_cima")
		direction = "cima"
		vision.rotation_degrees = -180
	
	elif lado.y > 0 and lado.x == 0:
		animation.play("correndo_baixo")
		direction = "baixo"
		vision.rotation_degrees = 0
		
	else:
		if lado.x > 0 and lado.y > 0:
			# Diagonal direita-baixo
			animation.play("correndo_diagonal")
			direction = "diagonal"
			vision.rotation_degrees = -45
		elif lado.x < 0 and lado.y > 0:
			# Diagonal esquerda-baixo
			animation.play("correndo_diagonal")
			direction = "diagonal"
			vision.rotation_degrees = 45
		elif lado.x > 0 and lado.y < 0:
			# Diagonal direita-cima
			animation.play("correndo_diagonal")
			direction = "diagonal"
			vision.rotation_degrees = -135
		elif lado.x < 0 and lado.y < 0:
			# Diagonal esquerda-cima
			animation.play("correndo_diagonal")
			direction = "diagonal"
			vision.rotation_degrees = 135
		else:
			if direction == "baixo":
				animation.play("parado_frente")
			elif direction == "cima":
				animation.play("parado_costas")
