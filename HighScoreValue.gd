extends Label


func _ready():
	if Global.points>Global.highscore:
		Global.highscore = Global.points
	text = str(Global.highscore)
	pass 
