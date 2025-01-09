extends Camera2D

@export var followObject:Node2D
# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	position = followObject.position
	
	pass
	
	
func _physics_process(delta: float) -> void:
	pass
