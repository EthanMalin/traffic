extends PathFollow

enum {STOP, GO, CAUTION}

var speed = 10

func _process(delta):
	offset += delta * speed
	
func stop():
	speed = 0
	
func go():
	speed = 10

func _on_Area_area_entered(area):
	if area.is_in_group("intersection_vehicle_check_light"):
		# Assumes parent will be the traffic light scene
		var traffic_light = area.get_parent()
		var state = traffic_light.state
		if STOP == state or CAUTION == state:
			stop()
			traffic_light.connect("go", self, "go")
