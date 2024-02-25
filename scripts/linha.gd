extends RigidBody2D

var locker = Mutex.new() # Criando uma trava



func aplicar_forca_aleatoria():
	angular_damp = rand_range(1, 3)
	linear_damp = rand_range(1, 3)
	linear_velocity = Vector2(rand_range(-100, 100), rand_range(-100, 100))

func _ready():
	aplicar_forca_aleatoria()

func interagir():
	if is_instance_valid(self): # Verifica se o nó ainda é válido
		locker.lock() # Bloqueia a trava
		if is_instance_valid(get_tree()): # Verifica se a árvore está válida
			get_tree().call_group("itens_player", "adicionar_item", 1, "linha")
		self.queue_free()
		locker.unlock() # Desbloqueia a trava
