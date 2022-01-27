extends Node2D

onready var admob = $Control/AdMob
var playertoken = 0
var playerskinpopup
var playerdescription = ["FREE",
"150",
"300",
"450"
]
func _ready():
	playerskinpopup = get_tree().get_root().get_node("Shop/Control/PopupMenu")
	loadAds()
	admob.show_banner()
	pass 

func loadAds() -> void:
	admob.load_banner()
	admob.load_interstitial()
	admob.load_rewarded_video()
	pass

func _process(delta):
	get_node("Control/CurrencyTag/CurrencyLabel").text = str(Changer.currency)
	pass

func _on_BackButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
	pass 

func _on_Player1Button_pressed():
	playertoken=0
	playerskinpopup.show()
	get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").hide()
	get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").show()
	get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/PriceHolder/PriceLabel").text = playerdescription[0]
	pass 

func _on_Player2Button_pressed():
	playertoken = 1
	get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/PriceHolder/PriceLabel").text = playerdescription[1]
	playerskinpopup.show()
	if Changer.currency < 150 and playertoken == 1 and !Global.player2unlocked:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").hide()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").hide()
	elif Changer.currency >= 150 and playertoken == 1 and !Global.player2unlocked:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").show()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").hide()
	else:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").hide()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").show()
	pass 


func _on_Player3Button_pressed():
	playertoken = 2
	get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/PriceHolder/PriceLabel").text = playerdescription[2]
	playerskinpopup.show()
	if Changer.currency < 300 and playertoken == 2 and !Global.player3unlocked:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").hide()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").hide()
	elif Changer.currency >= 300 and playertoken == 2 and !Global.player3unlocked:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").show()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").hide()
	else:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").hide()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").show()
	pass 


func _on_Player4Button_pressed():
	playertoken = 3
	get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/PriceHolder/PriceLabel").text = playerdescription[3]
	playerskinpopup.show()
	if Changer.currency < 450 and playertoken == 3 and !Global.player4unlocked:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").hide()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").hide()
	elif Changer.currency >= 450 and playertoken == 3 and !Global.player4unlocked:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").show()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").hide()
	else:
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/UnlockButton").hide()
		get_tree().get_root().get_node("Shop/Control/PopupMenu/ShopCover/SelectButton").show()
	pass 

func _on_UnlockButton_pressed():
	if playertoken == 1 :
		Changer.currency = Changer.currency - 150
		Global.player2unlocked = true
		Global.playerchosen = 1
		playerskinpopup.hide()

	if playertoken == 2 :
		Changer.currency = Changer.currency - 300
		Global.player3unlocked = true
		Global.playerchosen = 2
		playerskinpopup.hide()

	if playertoken == 3 :
		Changer.currency = Changer.currency - 450
		Global.player3unlocked = true
		Global.playerchosen = 3
		playerskinpopup.hide()
	pass 


func _on_SelectButton_pressed():
	if playertoken==0:
		Global.playerchosen = 0
		playerskinpopup.hide()
	elif playertoken==1:
		Global.playerchosen = 1
		playerskinpopup.hide()
	elif playertoken==2:
		Global.playerchosen = 2
		playerskinpopup.hide()
	else:
		Global.playerchosen = 3
		playerskinpopup.hide()
	pass 

func _on_CloseButton_pressed():
	playerskinpopup.hide()
	pass 









