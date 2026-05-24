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
