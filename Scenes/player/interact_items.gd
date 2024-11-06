extends Area2D
class_name InteractItems

@onready var player: CharacterBody2D = $".."
const OUTLINE_MATERIAL = preload("res://outline_material.tres")

var items_in_range : Array[Item] = []

func _process(delta: float) -> void:
	if !items_in_range.is_empty():
		var nearest_item := items_in_range[0]
		for item in items_in_range:
			var pos = player.global_position.distance_squared_to(item.global_position)
			if pos < player.global_position.distance_squared_to(nearest_item.global_position):
				nearest_item = item
		
		if nearest_item.sprite:
			nearest_item.sprite.material = OUTLINE_MATERIAL
		
		if Input.is_action_just_pressed("interact"):
			nearest_item.collect()
		
		
func _on_area_entered(area: Area2D) -> void:
	if area is Item:
		items_in_range.append(area)

func _on_area_exited(area: Area2D) -> void:
	if area is Item:
		area.sprite.material = null
		var area_index := items_in_range.find(area)
		if area_index != -1:
			items_in_range.remove_at(area_index)
