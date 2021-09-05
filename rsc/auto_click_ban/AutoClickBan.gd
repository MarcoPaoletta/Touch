extends Node

func _on_AntiCheat_timeout():
	if g.touches > 400:
		get_tree().quit()
	g.touches = 0
