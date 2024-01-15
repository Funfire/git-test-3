extends CharacterBody3D

var gravity = 1
var speed = 4
var jump_speed =  6.0
var mouse_sensitivity = 0.002
@onready var camera = $Camera3D

func get_input():
	var input = Input.get_vector("strafe_left", "strafe_right", "move_forward", "move_back")
	velocity.x = input.x * speed
	velocity.z = input.y * speed
	
func _physics_process(delta):
	velocity.y += -gravity * delta
	get_input()
	move_and_slide()
# Called when the node enters the scene tree for the first time.

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		
	if event.is_action("jump") and is_on_floor():
		velocity.y = jump_speed
