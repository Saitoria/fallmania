extends Sprite

onready var player = ["res://resources/assets/player/player.png","res://resources/assets/player/player2.png","res://resources/assets/player/player3.png","res://resources/assets/player/player4.png"]
func _ready():
	if Global.playerchosen == 0:
		self.texture = load(player[0])
	elif Global.playerchosen == 1:
		self.texture = load(player[1])
	elif Global.playerchosen == 2:
		self.texture = load(player[2])
	elif Global.playerchosen == 3:
		self.texture = load(player[3])
	else:
		self.texture = load(player[0])
	pass 
