extends HBoxContainer

onready var score_text = $ScoreText
onready var eq_text = $EquationText
onready var lives_text = $Lives

func _ready():
	randomize()

func _process(delta):
	score_text.text = "Score: " + str(global.score)
	eq_text.text = global.eq + "  = ?"
	lives_text.text = "x " + str(global.lives)