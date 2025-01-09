class_name Enemy
extends CharacterBody2D

var speed = 100
@export var player:Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = (player.position - position)/100
	look_at(player.position)
	rotation_degrees += 90
	pass
