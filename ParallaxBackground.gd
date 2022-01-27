extends ParallaxBackground

onready var bgchanger
onready var rngchanger = RandomNumberGenerator.new()
onready var backgrounds = ["res://resources/assets/background/bg1.png","res://resources/assets/background/bg2.png","res://resources/assets/background/bg3.png","res://resources/assets/background/bg4.png","res://resources/assets/background/bg5.png","res://resources/assets/background/bg6.png","res://resources/assets/background/bg7.png","res://resources/assets/background/bg8.png","res://resources/assets/background/bg9.png","res://resources/assets/background/bg10.png"]
func _ready():
	rngchanger.randomize()
	var randbgNo = rngchanger.randi_range(1, 10)
	if randbgNo==1:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[0])
		Changer.ismovable = true
		Changer.obstacle = 1
	elif randbgNo==2:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[1])
		Changer.ismovable = true
		Changer.obstacle = 2
	elif randbgNo==3:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[2])
		Changer.ismovable = true
		Changer.obstacle = 3
	elif randbgNo==4:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[3])
		Changer.ismovable = true
		Changer.obstacle = 4
	elif randbgNo==5:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[4])
		Changer.ismovable = true
		Changer.obstacle = 5
	elif randbgNo==6:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[5])
		Changer.ismovable = false
		Changer.obstacle = 6
	elif randbgNo==7:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[6])
		Changer.ismovable = false
		Changer.obstacle = 7
	elif randbgNo==8:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[7])
		Changer.ismovable = true
		Changer.obstacle = 8
	elif randbgNo==9:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[8])
		Changer.ismovable = true
		Changer.obstacle = 9
	elif randbgNo==10:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[9])
		Changer.ismovable = false
		Changer.obstacle = 10
	else:
		get_node("ParallaxLayer/Sprite").texture = load(backgrounds[7])
		Changer.obstacle = 8
		pass
	pass 
