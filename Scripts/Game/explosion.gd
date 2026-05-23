extends Area2D

signal hit_player

var already_hit = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not already_hit:
		#print("you lose")
		hit_player.emit()
		already_hit = true
	#print(body.name)

func reset():
	already_hit = false
