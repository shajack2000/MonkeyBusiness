extends Area3D

var TOTAL_SCORE : int = 0

@onready var LOOT_SOUND := $AudioStreamPlayer3D

func _on_body_entered(body):
	if body.get_class() == "loot":
		TOTAL_SCORE += body.loot_value
		LOOT_SOUND.play()
		

func _on_body_exited(body):
	if body.get_class() == "loot":
		TOTAL_SCORE -= body.loot_value
