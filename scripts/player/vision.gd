extends RayCast2D

export(NodePath) onready var button = get_node(button) as AnimatedSprite

func _process(delta):
	if is_colliding():
		var collider = get_collider() # Armazena o nó do colisor em uma variável
		if is_instance_valid(collider) and collider.is_in_group("interativo"):
			button.animation = "E"
			button.visible = true
			if Input.is_action_just_pressed("ui_accept"):
				collider.interagir()
		else:
			button.visible = false
	else:
		button.visible = false
