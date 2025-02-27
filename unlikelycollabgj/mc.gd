extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# character action variables
	var is_falling:= velocity.y > 0.0 and not is_on_floor()
	var is_jumping := Input.is_action_just_pressed("jump") and is_on_floor()
	var is_idling:= is_on_floor() and is_zero_approx(velocity.x)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	#print("physics process of character is working")
	player_jump(delta, is_jumping)
	player_walk(delta)
	#player_swim(delta):
	move_and_slide()


func player_jump(delta, is_jumping):
	#print("jumping?")
	
	# Handle jump.
	if is_jumping:
		#print("jumping!")
		velocity.y = JUMP_VELOCITY

		
		
func player_walk(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
