extends RigidBody2D

var explosion = preload("res://Explosion.tscn")
var explosion_sound = preload("res://ExplosionSound.tscn")
var  explosion_sound_instance = explosion_sound.instance()

func _ready():
	pass


func _on_Bullet_body_entered(body):
	if body.is_in_group("box"):
		if Changer.isVibrationOn:
			Input.vibrate_handheld(10)
		else:
			pass
		Global.points += 3
		
		if Changer.isSoundOn:
			get_tree().get_root().add_child(explosion_sound_instance)
		else:
			pass
		var explosion_instance = explosion.instance()
		explosion_instance.position = get_global_position()
		get_tree().get_root().add_child(explosion_instance)
		queue_free()
		if Global.points>Global.highscore:
			Global.highscore = Global.points
	
	if body.is_in_group("start_wall"):
		queue_free()
	pass 
