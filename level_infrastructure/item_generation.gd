class_name ItemGenerator

var RNG : RandomNumberGenerator = RandomNumberGenerator.new()

func spawn_loot_for_level(rooms: Array, loot_table: Array) -> Dictionary:
	var loot_scene : PackedScene
	var loot_to_spawn = {}
	var num_loot_in_room = 0
	
	for room in rooms:
		num_loot_in_room = RNG.randi()
		for i in num_loot_in_room:
			loot_scene = loot_table.pick_random()
			
			if loot_scene not in loot_to_spawn:
				loot_to_spawn[loot_scene] = []
				
			var x_variance = (room.voxel_scale.x * room.size_in_voxels.x / 2) - 1
			var y_variance = (room.voxel_scale.y * room.size_in_voxels.y / 2) - 1
			var z_variance = (room.voxel_scale.y * room.size_in_voxels.y / 2) - 1
			
			var loot_x = room.position.x + RNG.randf_range(-x_variance, x_variance)
			var loot_y = room.position.y + RNG.randf_range(-y_variance, y_variance)
			var loot_z = room.position.z + RNG.randf_range(-z_variance, z_variance)
				
			loot_to_spawn[loot_scene].append([loot_x, loot_y, loot_z])
		
	return loot_to_spawn

	
