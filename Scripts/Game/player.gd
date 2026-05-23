extends CharacterBody2D

@onready var hitbox = $LegCollisionShape



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("moveLeft"):
			$AnimatedSprite2D.frame = 0
	if Input.is_action_just_pressed("moveRight"):
			$AnimatedSprite2D.frame = 2
	match $AnimatedSprite2D.frame:
		0:
			hitbox.position = Vector2(662, 492)  # Bein links
			hitbox.shape.size = Vector2(86, 165)
			
		1:
			hitbox.position = Vector2(547, 492)   # Stand
			hitbox.shape.size = Vector2(750, 165)
		2:
			hitbox.position = Vector2(547, 488.5) # Bein rechts
			hitbox.shape.size = Vector2(86, 165)			

	pass	
