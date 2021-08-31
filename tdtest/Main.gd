extends Node2D

onready var Enemy = preload("res://enemy1.tscn")
onready var tower = preload("res://basicTower.tscn")
onready var bullet = preload("res://bullet.tscn")

var can_place_tower = false
var invalid_tiles

func _ready():
	
	# towers cannot be placed on these tiles
	invalid_tiles = $Nav/TileMap_nav.get_used_cells()

func _unhandled_input(event):
	if event is InputEventMouseMotion and can_place_tower:
		$tower_placement.clear()
		
		# get the tile location of the mouse cursor
		var tile = $tower_placement.world_to_map(event.position)
		
		if not tile in invalid_tiles:
			# color green / valid tile
			$tower_placement.set_cell(tile.x, tile.y, 0)
		else:
			# color red / invalid tile
			$tower_placement.set_cell(tile.x, tile.y, 1)
	elif event is InputEventMouseButton and can_place_tower and event.pressed:
		# get the tile location of the mouse cursor
		var tile = $tower_placement.world_to_map(event.position)
		
		if not tile in invalid_tiles:
			can_place_tower = false
			$tower_placement.clear()
			
			# the tile is now invalid for other towers
			invalid_tiles.append(tile)
			
			# place the tower
			var tower_instance = tower.instance()
			tower_instance.connect("shoot_projectile", self, "shoot_projectile")
			tower_instance.position = tile * Vector2(64, 64)
			$entities.add_child(tower_instance)

func _on_Basic_shoot_projectile(origin, target):
	var projectile_instance = bullet.instance()
	projectile_instance.origin_pos = origin
	projectile_instance.target_pos = target
	$entities.add_child(projectile_instance)
