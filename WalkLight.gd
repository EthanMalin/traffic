extends Spatial

# state 0 is don't walk, state 1 is walk
export var state = 0

var state_colors = [Color(0, 0, 1), Color(1, 0, 0)]

func next_state():
	state = (state + 1) % 2
	var mat = $MeshInstance.get_surface_material(0)
	mat.albedo_color = state_colors[state]
	$MeshInstance.set_surface_material(0, mat)

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if BUTTON_LEFT == event.button_index and true == event.pressed:
			next_state()
