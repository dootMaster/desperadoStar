extends Node

signal shoot(location: Vector2, direction: Vector2)

func emit_player_shoot(location: Vector2, direction: Vector2):
	shoot.emit(location, direction)

