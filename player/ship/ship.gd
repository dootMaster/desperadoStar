extends CharacterBody2D

@export var max_speed := 400
@export var accel := 3000
@export var friction := 1500
@export var factor := 50

var boost_accel = 8000
var boosting = false
var boost_duration = 0.18 # Duration of the boost in seconds
var boost_timer = 0.0

func _ready():
	pass

func _physics_process(delta):
	move(delta)
	

func move(delta):
	var move_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	var dodge = Input.is_action_just_pressed("ui_select")
	
	if dodge and not boosting and PlayerReactor.current_energy > 0:
		PlayerReactor.decrease_energy(1)
		boosting = true
		boost_timer = 0.0

	if boosting:
		if boost_timer < boost_duration:
			velocity += move_dir * boost_accel * delta
			boost_timer += delta
		else:
			boosting = false
			boost_timer = 0.0
	
	elif move_dir == Vector2.ZERO:
		if velocity.length() > friction * delta:
			velocity -= velocity.normalized() * friction * delta
			velocity = velocity.limit_length(max_speed)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += move_dir * accel * delta
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide()
