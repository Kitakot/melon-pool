extends RigidBody2D

var held = false
var ready_to_shoot = true
var mouse_start_pos = Vector2()
var shot_vector = Vector2()
@export var shot_power = 1.0
@export var velocity_epsilon = 10

func _ready() -> void:
	add_to_group("balls")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and ready_to_shoot:
			held = true
			mouse_start_pos = event.position
			print(mouse_start_pos)
		elif not event.pressed and held:
			held = false
			ready_to_shoot = false
			shot_vector = event.position - mouse_start_pos
			shot_vector *= shot_power
			print(shot_vector)
			linear_velocity = - shot_vector

func _physics_process(delta: float) -> void:
	#print(linear_velocity.length_squared())
	if linear_velocity.length_squared() <= velocity_epsilon:
		linear_velocity = Vector2(0, 0)
		ready_to_shoot = true
