extends Path2D


var timer = 0
var bossTimer = 0
var followerSpawnTimer = 2
var bossSpawnTimer = 5
export var pause = false

var follower = preload("res://CharacterFollower.tscn")
var boss = preload("res://bossFollower.tscn")

func _process(delta):
	if !pause:
		timer = timer + delta
		bossTimer = bossTimer + delta
		
		if (timer > followerSpawnTimer):
			var newFollower = follower.instance()
			add_child(newFollower)
			timer = 0
			
		if (bossTimer > bossSpawnTimer):
			var newBoss = boss.instance()
			add_child(newBoss)
			bossTimer = 0

