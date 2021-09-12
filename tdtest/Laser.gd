extends RayCast2D

var is_casting := false setget set_is_casting

var origin_pos : Vector2
var target_pos : Vector2
var direction : Vector2
var damage = 1

func _ready() -> void:
	set_physics_process(false)
	$Line2D.points[1] = Vector2.ZERO
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		self.is_casting = event.pressed
	pass


func _physics_process(delta: float) -> void:
	direction = target_pos - origin_pos
	
	var cast_point := cast_to
	force_raycast_update()
	
	set_sprite_rotation_t()
	if is_colliding():
		cast_point = to_local(get_collision_point())
		
	$Line2D.points[1] = cast_point

func set_is_casting(cast: bool) -> void:
	is_casting = cast
	
	if is_casting:
		appear()
	else:
		disappear()
	set_physics_process(is_casting)
	
func appear() -> void:
	$Tween.stop_all()
	$Tween.interpolate_property($Line2D, "width", 0, 10.0, 0.2)
	$Tween.start()
		
func disappear() -> void:
	$Tween.stop_all()
	$Tween.interpolate_property($Line2D, "width", 10.0, 0, 0.1)
	$Tween.start()


func _on_Laser_shoot_laser(origin,target):
	origin_pos = origin
	target_pos = target
	self.is_casting = true

func set_sprite_rotation_t():
	pass

func set_sprite_rotation():
	var angle
	
	if direction.y != 0:
		angle = atan(direction.x / direction.y) * 180 / PI
	else:
		if direction.x > 0:
			angle = 90
		elif direction.x < 0:
			angle = 270
	
	if direction.x >= 0 and direction.y >= 0:
		# 4th quadrant
		rotation = 180 - angle
	elif direction.x >= 0 and direction.y <= 0:
		# 1st quadrant
		rotation = abs(angle)
	elif direction.x <= 0 and direction.y >= 0:
		# 3rd quadrant
		rotation = 180 + abs(angle)
	elif direction.x <= 0 and direction.y <= 0:
		# 2nd quadrant
		rotation = 360 - angle
