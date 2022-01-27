extends Node2D

onready var admob = $Control/AdMob
func _ready():
	if Global.points>15 and Global.points<50:
		Changer.instant_currency = 1
		pass
	else:
		Changer.instant_currency = int(Global.points/50)
		pass
	get_node("Control/GameOverContainer/ScoreHolder/ScoreLabel").text = str(Global.points)
	get_node("Control/GameOverContainer/RecordHolder/RecordLabel").text = str(Global.highscore)
	if !Global.isrevived:
		get_node("Control/GameOverContainer/CurrenyHolder/CurrencyLabel").text = str(Changer.instant_currency)
	else:
		get_node("Control/GameOverContainer/CurrenyHolder/CurrencyLabel").text = str(2*Changer.instant_currency)
		pass
	loadAds()
	admob.show_banner()
	pass 


func loadAds() -> void:
	admob.load_banner()
	admob.load_interstitial()
	admob.load_rewarded_video()
	pass

func _on_RetryButton_pressed():
	Global.isdead = false
	Global.points = 0
	Changer.isPlaypressed = true
	if !Global.isrevived:
			Changer.currency += Changer.instant_currency
	else:
			Changer.currency += 2*Changer.instant_currency
	Global.isrevived = false
	Changer.instant_currency = 0
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().change_scene("GamePlay.tscn")
	pass 

func _on_AdMob_rewarded_video_loaded():
	if Global.isrevived == false:
		get_tree().get_root().get_node("GameOver/Control/GameOverContainer/AdButton").show()
	else:
		get_tree().get_root().get_node("GameOver/Control/GameOverContainer/AdButton").hide()
	pass 

func _on_AdMob_rewarded_video_closed():
	get_tree().get_root().get_node("GameOver/Control/GameOverContainer/AdButton").hide()
	pass 

func _on_AdMob_rewarded(currency, ammount):
	currency = null
	ammount = null
	Global.isdead = false
	Global.isrevived = true
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://GamePlay.tscn")
	pass 

func _on_AdButton_pressed():
	admob.show_rewarded_video()
	pass 


func _on_CloseButton_pressed():
	admob.show_interstitial()
	if !Global.isrevived:
		Changer.currency += Changer.instant_currency
	else:
		Changer.currency += 2*Changer.instant_currency
	Global.isrevived = false
	Changer.instant_currency = 0
	get_tree().change_scene("res://MainMenu.tscn")
	pass 









