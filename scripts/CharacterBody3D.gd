extends CharacterBody3D

const SPEED = 800
const JUMP_VELOCITY = 10

var gravity = 0
var movement_velocity : Vector3

@onready var animator = get_node("Mage/AnimationPlayer")

func _physics_process(delta):
	handle_input(delta)
	apply_gravity(delta)
	jump(delta)
	handle_animations()
	
	var applied_velocity : Vector3
	applied_velocity = velocity.lerp(movement_velocity, delta * 10)
	applied_velocity.y = -gravity
	
	velocity = applied_velocity
	
	var rotation_vector = Vector2(velocity.z, velocity.x)
	var rotation_direction : float
	if rotation_vector.length() > 0:
		rotation_direction = rotation_vector.angle()
		
	rotation.y = lerp_angle(rotation.y, rotation_direction, delta * 10)

	move_and_slide()
	
func handle_input(delta):
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forward", "move_backward")
	velocity = input * SPEED * delta
	
func apply_gravity(delta):
	if not is_on_floor():
		gravity += 25 * delta

func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		gravity = -JUMP_VELOCITY
		
	if gravity > 0 and is_on_floor():
		gravity = 0

func handle_animations():
	if is_on_floor():
		if abs(velocity.x) > 1 or abs(velocity.z) > 1:
			animator.play("Running_A", 0.3)
		else:
			if Input.is_action_pressed("cheer"):
				animator.play("Cheer", 0.3)
			else:
				animator.play("Idle", 0.3)
	else:
		animator.play("Jump_Idle")
