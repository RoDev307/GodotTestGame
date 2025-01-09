class_name navesita
extends CharacterBody2D

@export var speed = 300
@export var dash_accel = 100
@export var bulletSpeed = 500
const ESCENABALA = preload("res://Escenas/bullet.tscn")

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees += 90
	pass

func _physics_process(delta: float):
	var directionX = Input.get_axis("Left","Right")
	velocity.x = speed * directionX
	var directionY = Input.get_axis("Up", "Down")
	velocity.y = speed * directionY
	move_and_slide()
	if Input.is_action_just_pressed("Click"):
		bulletShot()
	pass

func bulletShot():
	var instanciabullet = ESCENABALA.instantiate()
	instanciabullet.position = $Sprite2D.position
	add_child(instanciabullet)
	
