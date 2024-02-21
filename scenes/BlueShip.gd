extends KinematicBody2D


export var current_velocity = 0
export var rotation_speed = 0.05
export var max_velocity = 5
export var acceleration = 0.3
export var brake_force = 0.1
export var natural_brake = 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	
	if Input.is_action_pressed("move_up"):
		var change_to = current_velocity + acceleration
		if (change_to > max_velocity):
			change_to = max_velocity
		current_velocity = change_to
	elif Input.is_action_pressed("move_down"):
		var change_to = current_velocity - brake_force
		if (change_to < 0):
			change_to = 0
		current_velocity = change_to
	else:
		var change_to = current_velocity - natural_brake
		if (change_to < 0):
			change_to = 0
		current_velocity = change_to

	move_local_y(-current_velocity)

	if Input.is_action_pressed("move_right"):
		rotate(rotation_speed)
		
	if Input.is_action_pressed("move_left"):
		rotate(-rotation_speed)
	
	
