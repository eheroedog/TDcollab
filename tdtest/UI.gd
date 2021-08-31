extends Node

var tower_range = 100

func set_tower_preview(mouse_position):
	var range_texture = Sprite.new()
	range_texture.position = Vector2(32,32)
	var scaling = tower_range / 600.0
	range_texture.scale = Vector2(scaling,scaling)
	var texture = load("res://Assets/range_overlay.png")
	range_texture.texture = texture
	range_texture.modulate = Color("ad54ff3c")
	
	var control = Contorl.new()
	control.add_child(range_texture,true)
	control.rect_position = mouse_position
	pass
