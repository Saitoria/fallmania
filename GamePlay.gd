extends Node2D

var box = preload("res://Box.tscn") 
var power_up = preload("res://powerup.tscn") 
var rng = RandomNumberGenerator.new()
export(int) var speed: int = 200
export(int) var box_speed = 300
var current_speed = 300
export var move_rate = 0.4
export var can_move = true
export var can_powerup_move = true
var direction = Vector2(0,+1)

onready var parallax = $Control/ParallaxBackground
onready var admob = $Control/AdMob
	

func _ready():
	if Changer.isPlaypressed:
		print("Changer.randChanger")
		pass
	Changer.isPlaypressed = false
	var audioplayer = AudioStreamPlayer.new()
	self.add_child(audioplayer)
	audioplayer.stream = load("res://resources/audio/xeonn.ogg")
	audioplayer.volume_db = 0
	if Changer.isMusicOn:
		audioplayer.play()
	else:
		audioplayer.stop()
		pass
	loadAds()
	admob.show_banner()
	pass

func loadAds() -> void:
	admob.load_banner()
	admob.load_interstitial()
	admob.load_rewarded_video()
	pass

func _process(delta):
	if !Global.isdead:
		if !Changer.ismovable:
			speed=0
			if !Global.isrevived:
				box_speed += 0.25
			else:
				box_speed += 0.5
		else:
			if !Global.isrevived:
				speed += 1
				box_speed += 0.25
			else:
				speed += 1.5
				box_speed += 0.5
			pass
	
		get_node("Control/Sprite/Label").text = str(Changer.bulletCount)
		parallax.scroll_offset += direction*speed*delta/4
		rng.randomize()
		var randNo = rng.randi_range(1, 7)
		var  box_instance = box.instance()
		box_instance.position = Vector2((get_viewport().size.x/8)*randNo,0)
		box_instance.apply_impulse(Vector2(),Vector2(0,box_speed))
		
		var  powerup_instance = power_up.instance()
		powerup_instance.position = Vector2((get_viewport().size.x/8)*randNo,0)
		powerup_instance.apply_impulse(Vector2(),Vector2(0,200))
		
		if can_move:
			get_tree().get_root().add_child(box_instance)
			can_move = false
			yield(get_tree().create_timer(move_rate),"timeout")
			can_move = true
			
		if can_powerup_move:
			get_tree().get_root().add_child(powerup_instance)
			can_powerup_move = false
			yield(get_tree().create_timer(7),"timeout")
			can_powerup_move = true
		
	
	else:
		var enemies = get_tree().get_nodes_in_group("box")
		for enemy in enemies:
			enemy.queue_free()
			
		var powerups = get_tree().get_nodes_in_group("powerup")
		for p in powerups:
			p.queue_free()

		var bullets = get_tree().get_nodes_in_group("bullet")
		for b in bullets:
			b.queue_free()
			
		get_tree().change_scene("res://GameOver.tscn")
		pass






