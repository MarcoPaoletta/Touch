extends Node

func _ready():
	g.load_game()
	OS.window_maximized = true
	OS.center_window()
	OS.min_window_size = Vector2(800, 600)

func _process(_delta):
	VisualServer.set_default_clear_color(g.current_bg_color)
