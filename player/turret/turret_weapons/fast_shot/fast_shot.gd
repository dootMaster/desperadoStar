class_name FastShot
extends CharacterBody2D

@onready var sprite_2d = $Sprite2D as Sprite2D
@onready var boundary_notifier = $BoundaryNotifier as VisibleOnScreenNotifier2D
@onready var q_free_timer = $QFreeTimer as Timer

var direction := Vector2.RIGHT
var speed := 1500
var hull_damage := 1
var shield_damage := 1
var shoot_cost := 2
var upkeep := 2

func _ready():
	pass

func _physics_process(delta):
	move(delta)
	
func move(delta: float) -> void:
	move_and_collide(direction * speed * delta)
	
func _on_boundary_notifier_screen_exited():
	q_free_timer.start(0.8)
	
func _on_q_free_timer_timeout():
	queue_free()
