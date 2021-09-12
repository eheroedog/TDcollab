extends Node2D

var target_list = []
var range_toggle = false

export var tower_range = 100
export var tower_cost = 2

signal shoot_projectile

func _ready():
	print(str($Range/CollisionShape2D.shape.radius))# = tower_range #TODO redo range scaling
	#var colScaling = tower_range / 600.0
	#$Range/CollisionShape2D.scale = Vector2(colScaling,colScaling)
	#$Range/CollisionShape2D.shape.radius = 600 #TODO redo range scaling
	#var rangeScaling = tower_range / 600.0
	#$range_overlay.scale = Vector2(rangeScaling,rangeScaling)
	$range_overlay.visible = false

func _on_AttackSpeed_timeout():
	if target_list.size() > 0:
		var projectile_origin_pos = position
		emit_signal("shoot_projectile", projectile_origin_pos, target_list[0].global_position)

func _on_Range_area_entered(area):
	if "Enemyg"in area.name or "bossg" in  area.name:
		target_list.append(area)

func _on_Range_area_exited(area):
	if "Enemyg" in area.name or "bossg" in  area.name and target_list.size() > 0:
		target_list.erase(area)

func _on_Select_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if range_toggle:
			range_toggle = false
			$range_overlay.visible = true
		else:
			$range_overlay.visible = false
			range_toggle = true
