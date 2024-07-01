extends RigidBody3D

signal use

@onready var flashlight_light = $flashlight_light
@onready var flashlight_sound = $flashlight_sound

func _on_use():
	toggle_flashlight()


func toggle_flashlight():
	flashlight_sound.play()
	flashlight_light.visible = !flashlight_light.visible
