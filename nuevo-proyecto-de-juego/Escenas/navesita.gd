class_name navesita
extends CharacterBody2D

###############################################################################
#Variables Modificables
@export var speed = 300
@export var dash_accel = 10
@export var bullet_speed = 1000
@export var fire_rate = 0.2

###############################################################################
#Variables externas
@onready var PropulsorAnim = $AnimationPlayer
@onready var AnimTree : AnimationTree = $AnimationTree
var ESCENABALA = preload("res://Escenas/bullet.tscn")

###############################################################################
#Variables internas
var dashDirection = Vector2.ZERO
var dash_vector = Vector2.LEFT

###############################################################################
#Funciones principales
func _ready() -> void:
	AnimTree.active = true

func _process(delta: float) -> void:
	MouseFollow()
	updateAnimParameters()
	if Input.is_action_just_pressed("Click"):
		bulletShot()
		
	pass


func _physics_process(delta: float):
	movement()
	dash()
	pass

###############################################################################
#Funciones generales
#Funcion encargada de instanciar balas
func bulletShot():
	var instanciabullet = ESCENABALA.instantiate()
	instanciabullet.position = $bulletpoint.get_global_position()
	instanciabullet.rotation_degrees = rotation_degrees
	instanciabullet.apply_impulse(Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().add_child(instanciabullet)
	
#Funcion encargada de la mecanica dash
func dash():
	if Input.is_action_just_pressed("Shift"):
		velocity = velocity * dash_accel
		move_and_slide()
		print("dash")
	pass
#Funcion encargada de que la nave siga el cursor
func MouseFollow():
	look_at(get_global_mouse_position())
	pass

#Funcion encargada del movimiento del personaje
func movement():
	var directionX = Input.get_axis("Left","Right")
	velocity.x = speed * directionX
	var directionY = Input.get_axis("Up", "Down")
	velocity.y = speed * directionY
	move_and_slide()
	
	pass

#Funcion encargada de las animaciones
func updateAnimParameters():
	if (velocity == Vector2.ZERO):
		AnimTree["parameters/conditions/idle"] = true
		AnimTree["parameters/conditions/is_moving"] = false
	else:
		PropulsorVisible()
		AnimTree["parameters/conditions/idle"] = false
		AnimTree["parameters/conditions/is_moving"] = true
	
	pass
#Funcion encargada de la visibilidad del propusor Idle
func PropulsorVisible():
	$Propulsor.visible = !$Propulsor.visible
