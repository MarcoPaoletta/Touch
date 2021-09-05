extends Area2D

# vars
var play_part = false
onready var input_event = connect("input_event", self, "_on_input_event")
	
# called every frame
func _process(_delta):
	keyboard()
	skin_state()
	particle_state()
		
func keyboard():		
	if Input.is_key_pressed(KEY_ESCAPE) or Input.is_key_pressed(KEY_Q):
		get_tree().quit() 
	if Input.is_action_just_pressed("full"):
		OS.window_maximized = !OS.window_maximized

func particle_state():
	$Particles2D.modulate = g.particle_modulate

func skin_state():
	if g.ball_skins_state == true:
		$BallState.modulate = g.skin
		g.ball_color = g.skin
	
# receiptor method of the input sign and particles 
func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("touch"):
		g.touches += 1
		g.update_score()
		$AnimationPlayer.play("mov")
		play_part = true
		play_touch_particles()
		yield($AnimationPlayer, "animation_finished")
		play_part = false
		play_touch_particles()
		
func play_touch_particles():
	if play_part: # true
		$Particles2D.emitting = true
	if !play_part: # false
		$Particles2D.emitting = false
