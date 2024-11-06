extends Area2D
class_name Item

@onready var sprite: Sprite2D = $Sprite2D

var can_interact : bool

func interactable() -> bool:
	return can_interact

func collect() -> void:
	queue_free()
	print("folder picked")


func _on_area_entered(area: Area2D) -> void:
	if area is InteractItems:
		can_interact = true


func _on_area_exited(area: Area2D) -> void:
	if area is InteractItems:
		can_interact = false
