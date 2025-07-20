extends Area2D

@export var speed = 450 #speed of player
var screen_size #game window

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO #Movement vector
	if Input.is_action_pressed("move_right"): #move right and flip char to default(right)
		velocity.x += 1
		$AnimatedSprite2D.flip_h = false 
	if Input.is_action_pressed("move_left"): #move left and flip char facing left
		velocity.x -= 1
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("move_up"):  #move up, find way to flip up
		velocity.y -= 1
		$AnimatedSprite2D.flip_v = true
	if Input.is_action_pressed("move_down"): #move down, find way to flip down
		velocity.y += 1
		$AnimatedSprite2D.flip_v = false

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
