extends RigidBody3D

signal use

@onready var pistol_sound := $pistol_sound
@onready var bullet := $bullet
@onready var muzzle_flash := $muzzle_flash
@onready var flash_timer := $flash_timer

func fire_gun():
	pistol_sound.play()
	bullet.emitting = true
	muzzle_flash.visible = true
	flash_timer.start()

func _on_use():
	fire_gun()


func _on_flash_timer_timeout():
	muzzle_flash.visible = false
