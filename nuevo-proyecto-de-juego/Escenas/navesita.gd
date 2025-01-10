class_name navesita
extends CharacterBody2D

@export var speed = 300
@export var dash_accel = 100
@export var bullet_speed = 1000
@export var fire_rate = 0.2


@onready var PropulsorAnim = $AnimationPlayer
@onready var AnimTree : AnimationTree = $AnimationTree
#@onready var Shield_anim = $Shield
var ESCENABALA = preload("res://Escenas/bullet.tscn")

func _ready() -> void:
	AnimTree.active = true

func bulletShot():
	var instanciabullet = ESCENABALA.instantiate()
	instanciabullet.position = $bulletpoint.get_global_position()
	instanciabullet.rotation_degrees = rotation_degrees
	instanciabullet.apply_impulse(Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().add_child(instanciabullet)
	

func MouseFollow():
	look_at(get_global_mouse_position())
	pass


func _process(delta: float) -> void:
	MouseFollow()
	updateAnimParameters()
	if Input.is_action_just_pressed("Click"):
		bulletShot()
		
	pass


func _physics_process(delta: float):
	movement()
	pass
	
	
func movement():
	var directionX = Input.get_axis("Left","Right")
	velocity.x = speed * directionX
	var directionY = Input.get_axis("Up", "Down")
	velocity.y = speed * directionY
	move_and_slide()
	
	pass
	
func updateAnimParameters():
	if (velocity == Vector2.ZERO):
		AnimTree["parameters/conditions/idle"] = true
		AnimTree["parameters/conditions/is_moving"] = false
	else:
		PropulsorVisible()
		AnimTree["parameters/conditions/idle"] = false
		AnimTree["parameters/conditions/is_moving"] = true
	
	pass

func PropulsorVisible():
	$Propulsor.visible = !$Propulsor.visible
