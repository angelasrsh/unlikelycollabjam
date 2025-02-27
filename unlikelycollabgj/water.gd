extends Line2D

@export var fs := 100 # nyquist lets go
@export var fmax := 50
@export var length_multiplier := 15

var amplitude := -5.0
var amplitude_direction := 1.0
var amplitude_speed := 2.0  # Speed of amplitude change

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update amplitude over time
	amplitude += amplitude_direction * amplitude_speed * delta
	
	# Reverse direction when reaching limits
	if amplitude > 5.0:
		amplitude = 5.0
		amplitude_direction = -1.0
	elif amplitude < -5.0:
		amplitude = -5.0
		amplitude_direction = 1.0
	
	var array := []
	
	# Create the sine wave with current amplitude
	for i in range(fmax):
		array.append(Vector2(200 + i * length_multiplier, 200 + amplitude * sin(i * fs)))
	
	points = array
