extends Node

onready var button3 = $ItemsContainer/GridContainer/Button3
onready var button4 = $ItemsContainer/GridContainer/Button4

func _on_Home_pressed():
	get_tree().change_scene("res://rsc/main/Main.tscn")

func _process(_delta):
	boost()
	print(g.skin)

func _ready():
	set_color()
	g.load_game()

func set_color():
	if !g.can_buy_item[0]:
		$ItemsContainer/GridContainer/Button1.self_modulate = g.item_bought_color
	if !g.can_buy_item[1]:
		$ItemsContainer/GridContainer/Button2.self_modulate = g.item_bought_color
	if !g.can_buy_item[2]:
		button3.self_modulate = g.current_item_color
	if !g.can_buy_item[3]:
		button4.self_modulate = g.item_bought_color

func boost():
	if g.x1 == true and g.x2 == false:
		g.increase = 1
	if g.x2 == true and g.x1 == false:
		g.increase = 2
	# si el potenciador es 1
	if g.x1 == true and g.x2 == false:
		button3.self_modulate = g.current_item_color # lo pintamos del actual
		if g.can_buy_item[2] == true: # si se puede comprar
			button4.self_modulate = Color(1, 1, 1)
		else:
			button4.self_modulate = g.item_bought_color 

	if g.x1 == false and g.x2 == true:
		button4.self_modulate = g.current_item_color
		button3.self_modulate = g.item_bought_color 
	g.save_game()
	
func _buy(price, item_nu):
	# si se puede comprar
	if g.can_buy_item[item_nu] == true and g.score >= price:
		g.score -= price
		g.can_change_color = true
		g.can_buy_item[item_nu] = false
	g.save_game()
	
func _on_Buy1_pressed():
	_buy(10000, 0)
	if !g.can_buy_item[0]:
		$ItemsContainer/GridContainer/Button1.self_modulate = g.item_bought_color
		$ChangeBallColor.show()
		$ChangeBallColor/ColorPickerBall.color = g.skin
		$ChangeBallColor/Ball.modulate = g.skin
		
func _on_Buy2_pressed():
	_buy(10000, 1)	
	if !g.can_buy_item[1]:
		$ItemsContainer/GridContainer/Button2.self_modulate = g.item_bought_color
		$ChangeBgColor.show()
		$ChangeBgColor/ColorPicker.color = g.current_bg_color

func _on_Buy3_pressed():
	g.x1()
	button3.self_modulate = g.current_item_color

func _on_Buy4_pressed():
	_buy(1000, 2)
	if !g.can_buy_item[2]:
		button4.self_modulate = g.item_bought_color
		g.x2()

func _on_ColorPicker_color_changed(color):
	g.change_bg_color(color)

func _on_Ready_pressed():
	$ChangeBgColor.hide()
	$ChangeBallColor.hide()

func _on_NotBuyButton_pressed():
	$NotBuy.hide()

func _on_ColorPickerBall_color_changed(color):
	g.skin = color
	$ChangeBallColor/Ball.modulate = color
	g.particle_modulate = color
	g.ball_skins_state = true



