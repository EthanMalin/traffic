extends Node

export (PackedScene) var vehicle_scene

func _ready():
	randomize()

func _on_VehicleSpawnTimer_timeout():
	var vehicle = vehicle_scene.instance()
	$Path.add_child(vehicle)
	#spawn another in 10-20 seconds
	$VehicleSpawnTimer.start((randf()*10) + 10)
