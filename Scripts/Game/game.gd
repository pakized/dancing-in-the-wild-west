extends Node

var movements = ["left", "right"]
var waiting = true
var counter = 0
var animatedSpritePlayer: AnimatedSprite2D  
var live
var score = 0
var liveLost = 0

func on_player_hit():
	live -= 1
	liveLost += 1
	$Player/AudioStreamPlayer2D.play()

func _ready() -> void:
	live = 3
	$Live.text = "Live %d" % live
	$Score.text = "Score %d" % score
	animatedSpritePlayer  = $Player.get_node("AnimatedSprite2D")
	$ExplosionLeft.monitoring = false
	$ExplosionRight.monitoring = false

	$"ExplosionRight".hit_player.connect(on_player_hit)
	$"ExplosionLeft".hit_player.connect(on_player_hit)
	
func _process(delta):
	if waiting:
		waiting = false
		start_sequence()

func start_sequence() -> void:
	counter += 1
	score = counter - liveLost
	# Dynamische Wartezeit
	var wait_time := 2.0
	if counter >= 20:
		wait_time = 0.5
	elif counter >= 16:
		wait_time = 1.0
	elif counter >= 7:
		wait_time = 1.5

	# 1. Text setzen
	$keysShownNode.text = movements.pick_random()
	# 2. Warten (abhängig vom Counter)
	await get_tree().create_timer(wait_time).timeout

	# 3. Explosion anzeigen
	if $keysShownNode.text == "left":
		$"ExplosionLeft".reset()
		$"ExplosionRight".reset()
		$"ExplosionRight".monitoring = false
		$"ExplosionLeft".monitoring = true
		$"ExplosionRight".visible = false
		$"ExplosionLeft".visible = true
		$"ExplosionLeft/Soundeffect".play()
	else:
		$"ExplosionLeft".monitoring = false
		$"ExplosionRight".monitoring = true
		$"ExplosionLeft".visible = false
		$"ExplosionRight".visible = true
		$"ExplosionRight/Soundeffect".play()
	# Explosion nach 0.5 Sekunden ausblenden
	await get_tree().create_timer(0.5).timeout
	$"ExplosionLeft".monitoring = false
	$"ExplosionRight".monitoring = false
	$"ExplosionLeft".visible = false
	$"ExplosionRight".visible = false	
	animatedSpritePlayer.frame = 1
	
	
	$Score.text = "Score %d" % score
	$Live.text = "Live %d" % live
	if live == 0:
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	if score >=36:
		get_tree().change_scene_to_file("res://Scenes/EndingScene.tscn")
	# Wieder freigeben
	waiting = true
