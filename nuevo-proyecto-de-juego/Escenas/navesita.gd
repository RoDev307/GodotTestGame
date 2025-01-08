class_name navesita
extends CharacterBody2D

@export var speed = 100

func _physics_process(delta):
	var directionX = Input.get_axis("Left","Right")
	velocity.x = speed * directionX
	var directionY = Input.get_axis("Up", "Down")
	velocity.y = speed * directionY
	move_and_slide()
	pass
