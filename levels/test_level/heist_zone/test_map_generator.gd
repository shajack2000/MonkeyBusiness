extends Node3D

const dir = [Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN]

var grid_size = 14
var grid_steps = 50

func _ready():
	randomize()
	var current_pos = Vector2(0,0)
	
	var current_dir = Vector2.RIGHT
