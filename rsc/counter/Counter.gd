extends HBoxContainer

func _process(_delta):
	if g.score == 0:
		$Score.text = "0.00"
	else:
		$Score.text = str(g.score)
		$Score.show()
