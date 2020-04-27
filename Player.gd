extends Area2D

# Declare member variables here. Examples:
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		rotation_dir += 1
	if Input.is_action_pressed('left'):
		rotation_dir -= 1
	if Input.is_action_pressed('down'):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed('up'):
		velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta














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
