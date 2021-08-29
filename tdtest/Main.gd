extends Node2D

onready var Enemy = preload("res://enemy1.tscn")
onready var tower = preload("res://basicTower.tscn")
onready var bullet = preload("res://bullet.tscn")

func _on_Basic_shoot_projectile(origin, target):
	var projectile_instance = bullet.instance()
	projectile_instance.origin_pos = origin
	projectile_instance.target_pos = target
	$entities.add_child(projectile_instance)
