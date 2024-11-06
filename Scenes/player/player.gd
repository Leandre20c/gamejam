extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var velocity_component = $VelocityComponent


var ennemies_on_collision: int = 0
var can_take_damage = true
var base_speed: float


func _ready():
	base_speed = velocity_component.max_speed
	
	
func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity_component.accelerate_in_direction(direction)
	velocity_component.move(self)
	
	#if movement_vector.x != 0 or movement_vector.y != 0:
		#animated_sprite_2d.play("run")
		#if movement_vector.x > 0:
			#$Visuals.scale.x = 1
		#else:
			#$Visuals.scale.x = -1
	#else:
		#animated_sprite_2d.play("idle")


func get_movement_vector():	
	var x_movement = Input.get_action_strength('move_right') - Input.get_action_strength('move_left')
	var y_movemement = Input.get_action_strength('move_down') - Input.get_action_strength('move_up')
	
	return Vector2(x_movement, y_movemement)
