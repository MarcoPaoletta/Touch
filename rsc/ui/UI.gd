extends Node

func _on_Shop_gui_input(event):
	if event.is_action_pressed("touch"):
			get_tree().change_scene("res://rsc/shop/Shop.tscn")
