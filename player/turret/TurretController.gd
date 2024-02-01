class_name TurretController
extends Node2D

var target_rotation: float = 0.0
var rotation_speed: float = 5.0
var epsilon: float = 0.01

func track_mouse(turret: Node2D, delta: float) -> void:
	target_rotation = global_position.direction_to(get_global_mouse_position()).angle() + PI / 2
	turret.rotation = lerp_angle(turret.rotation, target_rotation, rotation_speed * delta)
	if abs(turret.rotation - target_rotation) < epsilon:
		turret.rotation = target_rotation
		
