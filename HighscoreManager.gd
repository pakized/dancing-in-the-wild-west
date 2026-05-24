extends Node

var score = 0
const SAVEPATH = "res://JSON/highscores.json"
var comeFromGame = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	save_score("TEST", 12)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func save_score(player_name: String, score: int):
	var scores = load_scores()
	scores.append({
		"name": player_name,
		"score": score
	})
	scores.sort_custom(func(a, b): return a.score > b.score)
	if scores.size() > 10:
		scores = scores.slice(0, 10)
	var file = FileAccess.open(SAVEPATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(scores))
	file.close()

func load_scores():
	if not FileAccess.file_exists(SAVEPATH):
		return []
	
	var file = FileAccess.open(SAVEPATH, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var data = JSON.parse_string(content)
	if typeof(data) == TYPE_ARRAY:
		return data
	else:
		return []
