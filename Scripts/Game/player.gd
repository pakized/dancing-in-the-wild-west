extends CharacterBody2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("moveLeft"):
		if $AnimatedSprite2D.frame == 2:
			$AnimatedSprite2D.frame = 1
		else:
			$AnimatedSprite2D.frame = 0
	if Input.is_action_just_pressed("moveRight"):
		if $AnimatedSprite2D.frame == 0:
			$AnimatedSprite2D.frame = 1
		else:
			$AnimatedSprite2D.frame = 2

	pass	
