extends Area2D

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("balls"):
			var distance = global_position.distance_to(body.global_position)

			if distance <= 50:
				body.queue_free()
