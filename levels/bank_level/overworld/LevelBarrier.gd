extends Area3D

func _on_body_entered(body):
	if body is Character:
		print("level barrier entered")
		get_tree().change_scene_to_file("res://levels/test_level/heist_zone/test_scene.tscn")
