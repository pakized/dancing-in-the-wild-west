extends Node

var movements = ["left", "right"]
var waiting = true
var counter = 0
var animatedSpritePlayer: AnimatedSprite2D  
func _ready() -> void:
	animatedSpritePlayer  = $Player.get_node("AnimatedSprite2D")


func _process(delta):
	if waiting:
		waiting = false
		start_sequence()

func start_sequence() -> void:
	counter += 1

	# Dynamische Wartezeit
	var wait_time := 2.0
	if counter >= 30:
		wait_time = 0.5
	elif counter >= 20:
		wait_time = 1.0
	elif counter >= 10:
		wait_time = 1.5

	# 1. Text setzen
	$keysShownNode.text = movements.pick_random()
	# 2. Warten (abhängig vom Counter)
	await get_tree().create_timer(wait_time).timeout

	# 3. Explosion anzeigen
	if $keysShownNode.text == "left":
		$"ExplosionRight".visible = false
		$"ExplosionLeft".visible = true
	else:
		$"ExplosionLeft".visible = false
		$"ExplosionRight".visible = true

	# Explosion nach 0.5 Sekunden ausblenden
	await get_tree().create_timer(0.5).timeout
	$"ExplosionLeft".visible = false
	$"ExplosionRight".visible = false
	
	animatedSpritePlayer.frame = 1
	
	# Wieder freigeben
	waiting = true
