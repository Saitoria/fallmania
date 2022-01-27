extends Node2D

onready var admob = $Control/AdMob
var mainmenupopup

func _ready():
	mainmenupopup = get_tree().get_root().get_node("Node2D/Control/MainMenuPopup")
	
	if Changer.isMusicOn:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/MusicLabel").text = "On"
	else:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/MusicLabel").text = "Off"
		pass
	
	if Changer.isSoundOn:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SoundLabel").text = "On"
	else:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SoundLabel").text = "Off"
		pass
	
	if Changer.isVibrationOn:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/VibrationLabel").text = "On"
	else:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/VibrationLabel").text = "Off"
		pass
	
	if Changer.sensitivity == 0:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SenitivityLabel").text = "LOW"
	elif Changer.sensitivity == 1:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SenitivityLabel").text = "MEDIUM"
	else:
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SenitivityLabel").text = "HIGH"
		pass
		
	loadAds()
	admob.show_banner()
	pass 

func loadAds() -> void:
	admob.load_banner()
	admob.load_interstitial()
	admob.load_rewarded_video()
	pass

func _on_TextureButton_pressed():
	Global.isdead = false
	Global.isrevived = false
	Global.points = 0
	Changer.isPlaypressed = true
	get_tree().change_scene("GamePlay.tscn")
	pass 

func _on_ExitButton_pressed():
	get_tree().quit()
	pass 

func _on_SettingsButton_pressed():
	mainmenupopup.show()
	get_node("Control/MainMenuPopup/Sprite/SettingsContainer").show()
	get_node("Control/MainMenuPopup/Sprite/InstructionsLabel").hide()
	pass 


func _on_InstructionButton_pressed():
	mainmenupopup.show()
	get_node("Control/MainMenuPopup/Sprite/InstructionsLabel").show()
	get_node("Control/MainMenuPopup/Sprite/SettingsContainer").hide()
	pass 


func _on_CloseButton_pressed():
	mainmenupopup.hide()
	pass


func _on_MusicButton_pressed():
	if Changer.isMusicOn:
		Changer.isMusicOn = false
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/MusicLabel").text = "Off"
	else:
		Changer.isMusicOn = true
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/MusicLabel").text = "On"
	pass 


func _on_SoundButton_pressed():
	if Changer.isSoundOn:
		Changer.isSoundOn = false
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SoundLabel").text = "Off"
	else:
		Changer.isSoundOn=true
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SoundLabel").text = "On"
	pass 


func _on_VibrationButton_pressed():
	if Changer.isVibrationOn:
		Changer.isVibrationOn = false
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/VibrationLabel").text = "Off"
	else:
		Changer.isVibrationOn=true
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/VibrationLabel").text = "On"
	pass 


func _on_SensitivityButton_pressed():
	if Changer.sensitivity == 0:
		Changer.sensitivity += 1
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SenitivityLabel").text = "MEDIUM"
	elif Changer.sensitivity == 1:
		Changer.sensitivity += 1
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SenitivityLabel").text = "HIGH"
	else:
		Changer.sensitivity = 0
		get_node("Control/MainMenuPopup/Sprite/SettingsContainer/SenitivityLabel").text = "LOW"
	pass 


func _on_ShopButton_pressed():
	admob.show_interstitial()
	get_tree().change_scene("res://Shop.tscn")
	pass 
