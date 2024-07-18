extends Node3D

var banana_loot : PackedScene = preload("res://loot/banana/banana.tscn")
var loot_table : Array[PackedScene] = [banana_loot]
var item_generator : ItemGenerator = ItemGenerator.new()

func _ready():
	pass
	
func _spawn_loot() -> void:
	
	var rooms : Array = $DungeonGenerator3D.get_all_placed_and_preplaced_rooms()
	var loot_spawnpoints : Dictionary = item_generator.spawn_loot_for_level(rooms, loot_table)
	
	for key in loot_spawnpoints.keys():
		for point_set in loot_spawnpoints[key]:
			var loot_instance = key.instantiate()
			loot_instance.position.x = point_set[0]
			loot_instance.position.y = point_set[1]
			loot_instance.position.z = point_set[2]
			add_child(loot_instance)
			print(loot_instance, " spawned")
		
