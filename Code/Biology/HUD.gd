extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Player_first_jump():
	print("bonk")
	$ScoreTimer.start()



var score = 0
func _on_ScoreTimer_timeout():
	score += 1
	$Score.text = str(score)
	$Score.update()

func _on_StartTimer_timeout():
	print("hi")
	$ScoreTimer.start()


func _on_Player_end_game():
	$ScoreTimer.stop()
