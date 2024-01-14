extends Area3D

var TOTAL_SCORE : int = 0

@onready var LOOT_SOUND := $AudioStreamPlayer3D

signal score_changed

func _on_body_entered(body):
	print("truck body entered")
	print(body.get_class())
	if body is loot:
		TOTAL_SCORE += body.LOOT_VALUE
		score_changed.emit(TOTAL_SCORE)
		LOOT_SOUND.play()
		print("loot scored!")
		

func _on_body_exited(body):
	if body is loot:
		TOTAL_SCORE -= body.LOOT_VALUE
		score_changed.emit(TOTAL_SCORE)
		print("loot removed!")
