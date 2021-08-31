extends Area2D

export var hp = 10

func _on_End_area_entered(area):
	var entered = area.name
	if entered == "Enemyg" or entered == "bossg":
		hp = hp - 1 #TODO take enemy damage
		get_tree().get_root().get_node("lvl1").get_node("UI/HPLabel").text = str(hp)
