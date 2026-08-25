extends Area2D

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("balls"):
			body.queue_free()
