extends KinematicBody2D

# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

export (int) var speed = 600
export (float) var radius = 200
export (float) var rotation_speed = speed / radius

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2(-speed, 0).rotated(rotation)
		rotation_dir += 1
	if Input.is_action_pressed("ui_right"):
		velocity = Vector2(speed, 0).rotated(rotation)
		rotation_dir -= 1

func _process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity += move_and_slide(velocity)
	













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
