extends ColorRect

func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()

func _ready():
	show()

