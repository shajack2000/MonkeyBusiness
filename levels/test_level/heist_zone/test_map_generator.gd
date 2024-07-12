extends Node3D

var RNG : RandomNumberGenerator = RandomNumberGenerator.new()
var banana_loot : PackedScene = preload("res://loot/banana/banana.tscn")

func _ready():
	pass
	
func _spawn_loot():
	var rooms : Array = $DungeonGenerator3D.get_all_placed_and_preplaced_rooms()

	for room in rooms:
		var banana_loot_copy = banana_loot.instantiate()
		print(banana_loot_copy)
		var x_variance = (room.voxel_scale.x * room.size_in_voxels.x / 2) - 0.5
		var y_variance = (room.voxel_scale.y * room.size_in_voxels.y / 2) - 0.5
		var loot_x = room.position.x + RNG.randf_range(-x_variance, x_variance)
		var loot_y = room.position.y + RNG.randf_range(-y_variance, y_variance)
		banana_loot_copy.position.x = loot_x
		banana_loot_copy.position.y = loot_y
		banana_loot_copy.position.y = room.position.z + 5
		add_child(banana_loot_copy)
		
