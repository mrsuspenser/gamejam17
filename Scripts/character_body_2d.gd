extends CharacterBody2D

@export var speed = 275 #speed of player
var screen_size #game window

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2.ZERO #Movement vector
	var can_move = true
	
	if Input.is_action_pressed("move_right"): #move right
		animated_sprite_2d.play("walk right")
		velocity.x += 1
		
		
	if Input.is_action_pressed("move_left"): #move left
		animated_sprite_2d.play("walk left")
		velocity.x -= 1
		
	if Input.is_action_pressed("move_up"):  #move up
		animated_sprite_2d.play("walk up")
		velocity.y -= 1
		
	if Input.is_action_pressed("move_down"): #move down
		animated_sprite_2d.play("walk down")
		velocity.y += 1
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	move_and_slide() #This I think is how we collide with walls
