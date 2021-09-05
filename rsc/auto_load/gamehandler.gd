extends Node

var increase = 1
var score = 100000
# var score = 0
var touches = 0

var ball_skins_state = false
var ball_color = Color(1, 1, 1)
var skin

var particle_modulate = Color(1, 1, 1)
var current_bg_color = "785151"
var current_item_color = Color(0.341176, 0.023529, 0.313726)
var item_bought_color = Color(0.168627, 0.509804, 0.552941)

var can_buy_item = [true, true, true, true]
var can_change_color = [true, false]
var ball = [true, false]
var bg = [true, false]

var x1 = true
var x2 = false

func x1():
	x1 = true
	x2 = false
func x2():
	x1 = false
	x2 = true

func update_score():
	score += increase
	get_tree().get_nodes_in_group("score")[0].text = str(score) 
	get_tree().get_nodes_in_group("touch")[0].play()
	save_game()

func change_bg_color(c):
	VisualServer.set_default_clear_color(c)
	current_bg_color = c
	
var path = "user://save.sv"
func save_game():
	var save_file = File.new()
	save_file.open(path, File.WRITE)
	var data = {
		"increase" : increase,
		"score" : score,
		"ball_skins_state" : ball_skins_state,
		"ball_color" : ball_color,
		"skin" : skin,
		"particle_modulate" : particle_modulate,
		"current_bg_color" : current_bg_color,
		"current_item_color" : current_item_color,
		"item_bought_color" : item_bought_color,
		"x1" : x1,
		"x2" : x2,
		"can_buy_item" : can_buy_item,
		"can_change_color" : can_change_color,
		"ball" : ball,
		"bg" : bg
	}
	save_file.store_var(data)
	save_file.close()

func load_game():
	var save_file = File.new()
	if !save_file.file_exists(path):
		return
	save_file.open(path, File.READ)
	var data = save_file.get_var()
	increase = data["increase"]
	score = data["score"]
	ball_skins_state = data["ball_skins_state"]
	ball_color = data["ball_color"]
	skin = data["skin"]
	particle_modulate = data["particle_modulate"]
	current_bg_color = data["current_bg_color"]
	current_item_color = data["current_item_color"]
	item_bought_color = data["item_bought_color"]
	x1 = data["x1"]
	x2 = data["x2"]
	can_buy_item = data["can_buy_item"]
	can_change_color = data["can_change_color"]
	ball = data["ball"]
	bg = data["bg"]
	save_file.close()
