extends KinematicBody2D

# Declare member variables here. Examples:
var Player = Vector2()
var Boss = Vector2()
export (int) var linear_velocity = 600
export (float) var angular_velocity
export (float) var radius
export var velocity_vector = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	Boss = get_viewport_rect().size

var rotation_dir = 0

func get_input():
	Player = get_global_position()
	radius = sqrt(pow(Boss.y - Player.y,2)+pow(Boss.x - Player.x,2))
	angular_velocity = linear_velocity / radius
	
	rotation_dir = 0
	velocity_vector = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity_vector = Vector2(angular_velocity, 0).rotated(rotation)
		print(velocity_vector)
		rotation_dir += 1
	if Input.is_action_pressed("ui_right"):
		velocity_vector = Vector2(-angular_velocity, 0).rotated(rotation)
		rotation_dir -= 1

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * angular_velocity * delta
	velocity_vector += move_and_slide(velocity_vector)
	













#func _process(delta):
#	var input_vector = Vector2()
#	if Input.is_action_pressed("ui_right"):
#		input_vector.x += 1
#	if Input.is_action_pressed("ui_left"):
#		input_vector.x -= 1
#	if Input.is_action_pressed("ui_down"):
#		input_vector.y += 1
#	if Input.is_action_pressed("ui_up"):
#		input_vector.y -= 1
#
#	if input_vector.length() > 0:
#		input_vector = input_vector.normalized() * velocity
#		$AnimatedSprite.play()
#	else:
#		$AnimatedSprite.stop()
#
#	position += input_vector * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
