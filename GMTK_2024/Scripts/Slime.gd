extends CharacterBody2D


@onready var player = get_node("/root/Game/Player")


func _physics_process(delta):
	
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 30.0
	if direction != Vector2.ZERO:
		if $AnimatedSprite2D.animation != "walk":
			$AnimatedSprite2D.play("walk")
		
		# Adjust the flip direction of the sprite based on movement
		$AnimatedSprite2D.flip_h = direction.x < 0
	else:
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.play("idle")
	move_and_slide()
