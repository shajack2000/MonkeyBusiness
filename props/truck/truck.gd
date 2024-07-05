extends Node3D

signal truck_score_changed

func _on_scoring_area_score_changed(score):
	truck_score_changed.emit(score)
