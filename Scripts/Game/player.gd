extends CharacterBody2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("moveLeft"):
			$AnimatedSprite2D.frame = 0
	if Input.is_action_just_pressed("moveRight"):
			$AnimatedSprite2D.frame = 2

	pass	
