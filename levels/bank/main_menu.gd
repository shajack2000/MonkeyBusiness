extends Control

func _process(delta):
	if $MenuMusicCool.playing == false:
		$MenuMusicCool.play()

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://levels/test_level/heist_zone/test_scene.tscn")


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://levels/test_level/heist_zone/test_scene.tscn")


func _on_settings_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
