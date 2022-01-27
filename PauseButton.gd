extends TextureButton

var on_image = preload("res://resources/assets/icons/Pause_BTN.png")
var off_image = preload("res://resources/assets/icons/Play_BTN.png")

func _ready():
	if Changer.isGamePaused == false:
		texture_normal = on_image
	else:
		texture_normal = off_image
	pass 

func _on_PauseButton_pressed():
	if texture_normal == on_image:
		texture_normal = off_image
		get_tree().paused=true
	else:
		texture_normal = on_image
		get_tree().paused=false

	if Changer.isGamePaused == false:
		Changer.isGamePaused = true
	else:
		Changer.isGamePaused = false
	pass 

