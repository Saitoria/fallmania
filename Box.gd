extends RigidBody2D

onready var box = ["res://resources/assets/obstacles/obj1.png","res://resources/assets/obstacles/obj2.png","res://resources/assets/obstacles/obj3.png","res://resources/assets/obstacles/obj4.png","res://resources/assets/obstacles/obj5.png","res://resources/assets/obstacles/obj6.png","res://resources/assets/obstacles/obj7.png","res://resources/assets/obstacles/obj8.png","res://resources/assets/obstacles/obj9.png","res://resources/assets/obstacles/obj10.png"]

func _ready():
	if Changer.obstacle ==1:
		get_node("Sprite").texture = load(box[0])
	elif Changer.obstacle ==2:
		get_node("Sprite").texture = load(box[1])
	elif Changer.obstacle ==3:
		get_node("Sprite").texture = load(box[2])
	elif Changer.obstacle ==4:
		get_node("Sprite").texture = load(box[3])
	elif Changer.obstacle ==5:
		get_node("Sprite").texture = load(box[4])
	elif Changer.obstacle ==6:
		get_node("Sprite").texture = load(box[5])
	elif Changer.obstacle ==7:
		get_node("Sprite").texture = load(box[6])
	elif Changer.obstacle ==8:
		get_node("Sprite").texture = load(box[7])
	elif Changer.obstacle ==9:
		get_node("Sprite").texture = load(box[8])
	elif Changer.obstacle ==10:
		get_node("Sprite").texture = load(box[9])
	else:
		get_node("Sprite").texture = load(box[7])
	pass 


func _on_Box_body_entered(body):
	if body.is_in_group("wall"):
		Global.points += 1
		if Global.points>Global.highscore:
			Global.highscore = Global.points
		pass
		queue_free()
		pass
		
	if body.is_in_group("player"):
		Global.isdead = true
		pass
	
	if body.is_in_group("bullet"):
		queue_free()
		pass
	pass
