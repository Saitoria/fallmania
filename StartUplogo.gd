extends Node2D

onready var timer = get_node("Control/Timer")

func _ready():
	timer.set_wait_time(3)
	timer.start()
	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://MainMenu.tscn")
	timer.stop()
	get_tree().get_root().get_node("res://StartUplogo.tscn").queue_free()
	pass 
