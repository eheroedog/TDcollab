extends PathFollow2D


export var moveSpeed = 20


func _process(delta):
	
	var newOffset = get_offset() + moveSpeed * delta
	
	set_offset(newOffset)
	
	if (loop == false and get_unit_offset() ==1):
		queue_free	()
