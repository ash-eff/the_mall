extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()
var mouse_position = Vector2()

onready var player_sprite = $Sprite
#onready var gun_handler = $GunHandler

		 
func _ready() -> void:
	pass
	$AnimationPlayer.play("player_idle")

func _physics_process(delta):
	get_input()
	check_velocity()
	set_mouse_position()
	flip_sprite()
	velocity = move_and_slide(velocity)
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func check_velocity():
	if velocity.x != 0 || velocity.y != 0:
		$AnimationPlayer.play("player_run")
	else:
		$AnimationPlayer.play("player_idle")
	
func set_mouse_position():
	mouse_position = get_local_mouse_position()
	
func flip_sprite():
	if mouse_position.x >=0:
		player_sprite.scale.x = 1
		#gun_handler.scale.x = 1
	else:
		player_sprite.scale.x = -1
		#gun_handler.scale.x = -1
