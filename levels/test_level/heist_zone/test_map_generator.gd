extends Node3D

func _ready():
	pass
	
func _spawn_loot():
	var rooms = $DungeonGenerator3D.get_all_placed_and_preplaced_rooms()
	var banana_loot = load("res://loot/banana/banana.tscn")
	var banana_loot_copy = banana_loot.instantiate()
	pass
	#for room in rooms:
		#room.position.x
		
