extends Node

var isPlaypressed = false
var isGamePaused = false
var isMusicOn = true setget set_MusicStatus
var isSoundOn = true setget set_SoundStatus
var isVibrationOn = true setget set_VibrationStatus
var sensitivity = 1 setget set_SensitivityStatus
var currency = 0 setget set_Currency
var instant_currency = 0
var ismovable = true
var obstacle = 8
var bulletCount = 0 setget set_bulletCount
const filepath2 = "user://bulletcount.dat"

func _ready():
	load_bulletCount()
	pass
	
func load_bulletCount():
	var file = File.new()
	if not file.file_exists(filepath2): return
	file.open(filepath2, File.READ)
	bulletCount = file.get_var()
	isMusicOn = file.get_var()
	isSoundOn = file.get_var()
	isVibrationOn = file.get_var()
	sensitivity = file.get_var()
	currency = file.get_var()
	file.close()
	pass

func save_bulletCount():
	var file = File.new()
	file.open(filepath2, File.WRITE)
	file.store_var(bulletCount)
	file.store_var(isMusicOn)
	file.store_var(isSoundOn)
	file.store_var(isVibrationOn)
	file.store_var(sensitivity)
	file.store_var(currency)
	file.close()
	pass

func set_bulletCount(new_value):
	bulletCount = new_value
	save_bulletCount()
	pass

func set_MusicStatus(new_value):
	isMusicOn = new_value
	save_bulletCount()
	pass

func set_SoundStatus(new_value):
	isSoundOn = new_value
	save_bulletCount()
	pass

func set_VibrationStatus(new_value):
	isVibrationOn = new_value
	save_bulletCount()
	pass

func set_SensitivityStatus(new_value):
	sensitivity = new_value
	save_bulletCount()
	pass

func set_Currency(new_value):
	currency = new_value
	save_bulletCount()
	pass
