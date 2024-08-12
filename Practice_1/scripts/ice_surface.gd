extends Area2D

var friction = 0.5  # Example ice friction value, adjust as needed

func _on_body_entered(body):
	if body.name == "Player":
		var player = body
		player.on_ice = true  # Indicate that the player is on the ice
		player.friction = friction  # Apply the ice friction
		print("Player entered ice area, applying friction: ", friction)

func _on_body_exited(body):
	if body.name == "Player":
		var player = body
		player.on_ice = false  # Indicate that the player is no longer on ice
		player.friction = 1.0  # Restore normal friction
		print("Player left ice area, restoring normal friction")
