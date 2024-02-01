class_name Turret
extends Node2D

signal shot()

@onready var fire_timer = $Timer
@onready var turret_controller = $TurretController as TurretController

@export var fire_rate: float = 0.5

var can_fire := true

func _ready():
	fire_timer.connect("timeout", set_can_fire)
	fire_timer.wait_time = fire_rate
	

func _process(delta):
	turret_controller.track_mouse(self, delta)
	shoot()
	
	
func shoot() -> void:
	if Input.is_action_just_pressed("shoot") and can_fire == true and PlayerReactor.current_energy > 0:
		PlayerReactor.decrease_energy(1)
		can_fire = false
		fire_timer.start()
		SignalBus.emit_player_shoot(global_position, (get_global_mouse_position() - global_position).normalized())
		
		
func set_can_fire() -> void:
	can_fire = true
