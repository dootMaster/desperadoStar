class_name Ship_Energy_UI
extends Control

@onready var hbox = $HBoxContainer as HBoxContainer
@onready var digit_one = $HBoxContainer/DigitOne
@onready var digit_two = $HBoxContainer/DigitTwo

var zero = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0019.png")
var one = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0020.png")
var two = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0021.png")
var three = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0022.png")
var four = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0023.png")
var five = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0031.png")
var six = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0032.png")
var seven = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0033.png")
var eight = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0034.png")
var nine = preload("res://assets/kenney_pixel-shmup/Tiles/tile_0035.png")

func _ready():
	PlayerReactor.connect("update_energy_signal", update_energy_display)
	
func update_energy_display(old_value: int, new_value: int) -> void:
	if new_value == 10:
		digit_one.texture = one
		digit_two.texture = zero
	else:
		digit_one.texture = zero
		match new_value:
			9:
				digit_two.texture = nine
			8:
				digit_two.texture = eight
			7:
				digit_two.texture = seven
			6:
				digit_two.texture = six
			5:
				digit_two.texture = five
			4:
				digit_two.texture = four
			3:
				digit_two.texture = three
			2:
				digit_two.texture = two
			1:
				digit_two.texture = one
			0:
				digit_two.texture = zero
			
