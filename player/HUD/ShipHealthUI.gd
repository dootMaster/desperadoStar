class_name ShipHealthUI
extends Control

enum MODES {hull, shield}

@onready var hull_bar = $Hull
@onready var shield_bar = $Shield

var hull = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0026.png")
var shield = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0024.png")

func take_damage(amount: int) -> void: 
	var current_shield = shield_bar.get_child_count()
	if current_shield == 2:
		shield_bar.remove_child($"2")
