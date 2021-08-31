extends Node2D

export var damage_value = 5
export var hp = 20

func _ready():
	pass

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		#emit_signal("mob_defeated")
		queue_free()
