extends RigidBody2D


var ispowerup = false

func _on_RigidBody2D_body_entered(body):
	if body.is_in_group("player"):
		Changer.bulletCount += 15
		print(Changer.bulletCount)
		queue_free()

	if body.is_in_group("wall"):
		queue_free()
	pass 




