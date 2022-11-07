extends Spatial

signal stop
signal go
signal caution

enum {STOP, GO, CAUTION, NUM_STATES}

export var state = STOP
export var caution_timeout = 3

var state_lights = []

func _ready():
	state_lights = [$Stop, $Go, $Caution]
	
func next_state():
	state_lights[state].hide()
	state = (state + 1) % NUM_STATES
	state_lights[state].show()
	
	if STOP == state:
		print("stop")
		emit_signal("stop")
	if GO == state:
		print("go")
		emit_signal("go")
	if CAUTION == state:
		print("caution")
		emit_signal("caution")
		$LightTimer.start(caution_timeout)

func _on_LightTimer_timeout():
	next_state()

func _on_ClickArea_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if BUTTON_LEFT == event.button_index and true == event.pressed:
			if CAUTION != state:
				next_state()
