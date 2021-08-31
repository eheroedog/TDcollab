extends PathFollow2D


export var moveeSpeed = 75


func _process(delta):
	
	var newOffset = get_offset() + moveeSpeed * delta
	
	set_offset(newOffset)
	
	if (loop == false and get_unit_offset() ==1):
		queue_free	()
