extends CharacterBody2D

@export var speed = 150
@onready var animatedSprite = $AnimatedSprite2D
var last_direction = 0


	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_action_just_pressed("left_click"):
		print("clicking")
	
	if input_direction == Vector2.LEFT:
		animatedSprite.play("move_left")
		last_direction = 1
	elif input_direction == Vector2.RIGHT:
		animatedSprite.play("move_right")
		last_direction = 3
	elif input_direction == Vector2.UP:
		animatedSprite.play("move_up")
		last_direction = 2
	elif input_direction == Vector2.DOWN:
		animatedSprite.play("move_down")
		last_direction = 0
	else:
		if (last_direction == 0): animatedSprite.play("idle_down")
		elif (last_direction == 1): animatedSprite.play("idle_left")
		elif (last_direction == 2): animatedSprite.play("idle_up")
		else: animatedSprite.play("idle_right")
	
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
