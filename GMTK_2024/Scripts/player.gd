extends CharacterBody2D

var SPEED = 60

func _physics_process(delta):
	var direction = Input.get_vector("A-Key", "D_Key", "W_Key", "S_Key")
	velocity = direction * SPEED
	
	if direction != Vector2.ZERO:
		if $AnimatedSprite2D.animation != "walk":
			$AnimatedSprite2D.play("walk")
		
		# Adjust the flip direction of the sprite based on movement
		$AnimatedSprite2D.flip_h = direction.x < 0
	else:
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.play("idle")

	# Move the character
	move_and_slide()
