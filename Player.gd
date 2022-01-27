extends KinematicBody2D

var bullet = preload("res://Bullet.tscn")

export var bullet_speed = -800
export var can_fire = true
onready var bulletsoundplayer = AudioStreamPlayer.new()

func _ready():
	self.add_child(bulletsoundplayer)
	bulletsoundplayer.stream = load("res://resources/audio/shoot.wav")
	bulletsoundplayer.volume_db = -25
	pass 

func _input(event):
	if event is InputEventScreenDrag:
		if Changer.sensitivity == 0:
			self.move_and_collide(Vector2(event.relative.x/1.5,0))
		elif Changer.sensitivity == 1:
			self.move_and_collide(Vector2(event.relative.x,0))
		else:
			self.move_and_collide(Vector2(event.relative.x*1.5,0))
			pass

	if event is InputEventScreenTouch and can_fire:
		if Changer.bulletCount>0:
			can_fire=false
			if Changer.isSoundOn:
				bulletsoundplayer.play()
			else:
				bulletsoundplayer.stop()
				pass
			var bullet_instance = bullet.instance()
			bullet_instance.position = $BulletPoint.get_global_position()
			bullet_instance.apply_impulse(Vector2(),Vector2(0,bullet_speed))
			get_tree().get_root().add_child(bullet_instance)
			Changer.bulletCount -= 1
			yield(get_tree().create_timer(0.15),"timeout")
			can_fire = true
		else:
			pass
		pass
