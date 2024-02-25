extends AnimatedSprite
var run = false

export(NodePath) onready var anim = get_node(anim) as AnimationPlayer

func _ready():
	playing = true

func _process(delta):
	if run:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://cenas/main.tscn")
	if frame == 14 and !run:
		anim.play("papel")
		playing = false



func _on_animation_animation_finished(anim_name):
	if anim_name == "papel":
		anim.stop()
		run = true
