extends Node

var points = 0 setget set_points
var isdead = false
var isrevived = false
var player1unlocked = true setget set_player1unloked
var player2unlocked = false setget set_player2unloked
var player3unlocked = false setget set_player3unloked
var player4unlocked = false setget set_player4unloked
var playerchosen = 0 setget set_playerchosen
var highscore = 0 setget set_highscore
const filepath = "user://highscore.dat"

func _ready():
	load_highscore()
	pass 

func load_highscore():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	highscore = file.get_var()
	points = file.get_var()
	player1unlocked = file.get_var()
	player2unlocked = file.get_var()
	player3unlocked = file.get_var()
	player4unlocked = file.get_var()
	playerchosen = file.get_var()
	file.close()
	pass

func save_highscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(highscore)
	file.store_var(points)
	file.store_var(player1unlocked)
	file.store_var(player2unlocked)
	file.store_var(player3unlocked)
	file.store_var(player4unlocked)
	file.store_var(playerchosen)
	file.close()
	pass

func set_highscore(new_value):
	highscore = new_value
	save_highscore()
	pass

func set_points(new_value):
	points = new_value
	save_highscore()
	pass

func set_player1unloked(new_value):
	player1unlocked = new_value
	save_highscore()
	pass

func set_player2unloked(new_value):
	player2unlocked = new_value
	save_highscore()
	pass

func set_player3unloked(new_value):
	player3unlocked = new_value
	save_highscore()
	pass

func set_player4unloked(new_value):
	player4unlocked = new_value
	save_highscore()
	pass

func set_playerchosen(new_value):
	playerchosen = new_value
	save_highscore()
	pass
