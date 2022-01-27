extends AudioStreamPlayer


func _ready():
	var audioplayer = AudioStreamPlayer.new()
	self.add_child(audioplayer)
	audioplayer.stream = load("res://resources/audio/explosion.ogg")
	audioplayer.volume_db = -20
	audioplayer.play()
	pass 
