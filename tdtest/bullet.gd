extends Area2D

var origin_pos : Vector2
var target_pos : Vector2
var velocity : Vector2
var speed = 400
var direction : Vector2
var damage = 1

func _ready():
	position = origin_pos
	direction = target_pos - origin_pos
	#print("target_pos:" + str(target_pos) + " , origin_pos:" + str(origin_pos))
	set_sprite_rotation()
	
	velocity = direction.normalized() * speed

func _physics_process(delta):
	position += velocity * delta

func set_sprite_rotation():
	var angle
	
	#print(str(direction))
	
	if direction.y != 0:
		angle = atan(direction.x / direction.y) * 180 / PI
	else:
		if direction.x > 0:
			angle = 90
		elif direction.x < 0:
			angle = 270
	
	if direction.x >= 0 and direction.y >= 0:
		# 4th quadrant
		$bsprite.rotation_degrees = 180 - angle
	elif direction.x >= 0 and direction.y <= 0:
		# 1st quadrant
		$bsprite.rotation_degrees = abs(angle)
	elif direction.x <= 0 and direction.y >= 0:
		# 3rd quadrant
		$bsprite.rotation_degrees = 180 + abs(angle)
	elif direction.x <= 0 and direction.y <= 0:
		# 2nd quadrant
		$bsprite.rotation_degrees = 360 - angle


func _on_bullet_area_entered(area):
	if "Enemyg" in area.name:
		area.take_damage(damage)
		queue_free()
