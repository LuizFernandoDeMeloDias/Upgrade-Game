extends KinematicBody2D

export var speed = 50

var motion: Vector2 = Vector2.ZERO


func _physics_process(delta):
	move_behaviour()
	move_and_slide(motion)

func move_behaviour() -> void:
	var move_horizontal = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var move_vertical = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	motion.x = move_horizontal * speed 
	motion.y = move_vertical * speed
