extends Node2D

export var damage_value = 1
export var hp = 5


func take_damage(damage):
	hp -= damage
	if hp <= 0:
		#emit_signal("mob_defeated")
		queue_free()
