extends Node2D

func _ready() -> void:
	var scores = HighscoreManager.load_scores()

	$Control/RichTextLabel.clear()

	var rank = 1

	for score in scores:
		$Control/RichTextLabel.append_text(
			"#" + str(rank) + " " + score["name"] + "  " + str(score["score"]) + "\n"
		)
		rank += 1
		if HighscoreManager.comeFromGame:
			$Control/Button3.visible = false
			$Control/Button2.visible = true
		else:
			$Control/Button3.visible = true
			$Control/Button2.visible = false





func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/MainMenu.tscn")
