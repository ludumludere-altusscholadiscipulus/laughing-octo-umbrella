extends Node2D

onready var text = $RichTextLabel
onready var scoretext = $RichTextLabel2
onready var timer = $Timer

var letters = ["W","A","S","D"]
var score : int = 0

func _ready():
	text.text = generateletter()

func generateletter():
	randomize()
	var new_letter = letters[randi()%4]
	timer.start()
	return new_letter

func _process(delta):
	scoretext.text = "Score: " + str(score)
	if Input.is_action_just_pressed("A") or Input.is_action_just_pressed("D") or Input.is_action_just_pressed("S") or Input.is_action_just_pressed("W"):
		timer.stop()
		if Input.is_action_just_pressed("A") and text.text == "A":
			score += 1
			text.text = generateletter()
			timer.start()
				
		elif Input.is_action_just_pressed("D") and text.text == "D":
			score += 1
			text.text = generateletter()
			timer.start()
			
		elif Input.is_action_just_pressed("S") and text.text == "S":
			score += 1
			text.text = generateletter()
			timer.start()
				
		elif Input.is_action_just_pressed("W") and text.text == "W":
			score += 1
			text.text = generateletter()
			timer.start()
		else:
			score = 0
			text.text = generateletter()
			timer.start()


func _on_Timer_timeout():
	score = 0
	text.text = generateletter()
	timer.start()
