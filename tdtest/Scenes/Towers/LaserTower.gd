extends Node2D

var target_list = []

signal shoot_laser

func _physics_process(delta):
	if target_list.size() > 0:
		var projectile_origin_pos = position
		emit_signal("shoot_laser", projectile_origin_pos, target_list[0].global_position)

func _on_Range_area_entered(area):
	if "Enemyg"in area.name or "bossg" in  area.name:
		target_list.append(area)

func _on_Range_area_exited(area):
	if "Enemyg" in area.name or "bossg" in  area.name and target_list.size() > 0:
		target_list.erase(area)
