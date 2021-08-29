extends Path2D


var timer = 0
var SpawnTime = 2

var follower = preload("res://CharacterFollower.tscn")

func _process(delta):
	timer = timer + delta
	
	if (timer > SpawnTime):
		var newFollower = follower.instance()
		add_child(newFollower)
		timer = 0

