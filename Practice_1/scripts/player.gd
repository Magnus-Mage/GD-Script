#extends CharacterBody2D
#
#
#const SPEED = 120.0
#const JUMP_VELOCITY = -300.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta 
	##if is_on_floor():
		##velocity.y = 0
	##print("Velocity: ", velocity.y)
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	#else:
		#$AnimatedSprite2D.play("idle")
#
	##if Input.is_action_just_pressed("ui_accept") 
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	##var direction = Input.get_axis("a_key", "d_key")
	#
	##var frameno = 0
	##if direction:
		##
		##$AnimatedSprite2D.play("walk"[frameno])
		##frameno += 1
		##velocity.x = direction * SPEED		
	##else:
		##velocity.x = move_toward(velocity.x, 0, SPEED)
		##frameno = 0
##
	##move_and_slide()
	#var direction = Input.get_axis("a_key", "d_key")
	#var frameno = $AnimatedSprite2D.frame
	#print(frameno)
	#
#
	#if direction != 0:
		## Play the "walk" animation
		#for i in range(16):
			#if $AnimatedSprite2D.animation != "walk":
				#$AnimatedSprite2D.play("walk")
				 #
			#frameno = frameno + 0.05
			#print(frameno)
			## Set the velocity based on direction and speed
		#velocity.x = direction * SPEED
#
		## Optional: Adjust the flip direction of the sprite based on movement
		#if direction > 0:
			#$AnimatedSprite2D.flip_h = false  # Facing right
		#elif direction < 0:
			#$AnimatedSprite2D.flip_h = true   # Facing left
	#else:
		## Stop the walking animation
		#$AnimatedSprite2D.stop()
		#
		## Optional: Set the sprite to an idle frame (if you have one)
		#$AnimatedSprite2D.play("idle")
		 #
		## Gradually reduce velocity to 0 when not moving
		#velocity.x = move_toward(velocity.x, 0, SPEED)
				#
#
		#
#
		### Set the velocity based on direction and speed
		##velocity.x = direction * SPEED
##
		### Optional: Adjust the flip direction of the sprite based on movement
		##if direction > 0:
			##$AnimatedSprite2D.flip_h = false  # Facing right
		##elif direction < 0:
			##$AnimatedSprite2D.flip_h = true   # Facing left
	##else:
		### Stop the walking animation
		##$AnimatedSprite2D.stop()
		##
		### Optional: Set the sprite to an idle frame (if you have one)
		##$AnimatedSprite2D.play("idle")
		 ##
		### Gradually reduce velocity to 0 when not moving
		##velocity.x = move_toward(velocity.x, 0, SPEED)
#
	## Move the character
	#move_and_slide()







extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var can_double_jump = false

func _physics_process(delta):
	# Apply gravity if the character is not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jumping
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			can_double_jump = true
		elif can_double_jump:
			velocity.y = JUMP_VELOCITY
			if $AnimatedSprite2D.animation != "roll":
				$AnimatedSprite2D.play("roll")
			can_double_jump = false  # Disable further jumps until back on the ground
		
		

	# Handle horizontal movement
	var direction = Input.get_axis("a_key", "d_key")
	
	if direction != 0:
		# Set the velocity based on direction and speed
		velocity.x = direction * SPEED
		
		# Only start the walk animation if it is not already playing
		if $AnimatedSprite2D.animation != "walk":
			$AnimatedSprite2D.play("walk")
		
		# Adjust the flip direction of the sprite based on movement
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		# Only play the idle animation if it is not already playing
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.play("idle")
		
		# Gradually reduce velocity to 0 when not moving
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move the character
	move_and_slide()
