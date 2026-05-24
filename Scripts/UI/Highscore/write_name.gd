extends Node2D

func _ready():
	$Control/LineEdit.grab_focus()  # Cursor direkt aktiv
# Button gedrückt
func _on_button_pressed():
	var player_name = $Control/LineEdit.text
	
	if player_name.strip_edges() == "":
		player_name = "Unknown"

	HighscoreManager.save_score(player_name, HighscoreManager.score)

	# Wechsel zur Highscore Tabelle
	get_tree().change_scene_to_file("res://Scenes/Menu/Highscore.tscn")
