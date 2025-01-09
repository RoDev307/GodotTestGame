class_name bullet
extends RigidBody2D

@export var OutOfWindow = 1000

# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if position.y > OutOfWindow:
		queue_free()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	$CollisionShape2D.disabled
	pass # Replace with function body.
