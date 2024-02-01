class_name HealthComponent
extends Node

signal update_hull(old_value: int, new_value: int)
signal update_shield(old_value: int, new_value: int)
signal you_died()

@export var max_hull := 3
@export var current_hull := 3

@export var max_shield := 2
@export var current_shield := 2
@export var recharge_time := 10.0

@onready var shield_recharge_timer = $ShieldRechargeTimer as Timer

func _ready():
	shield_recharge_timer.connect("timeout", recharge_shield)
	shield_recharge_timer.wait_time = recharge_time
	
	
func increase_hull(amount: int) -> void:
	var old_value = current_hull
	current_hull += amount
	current_hull = clamp(current_hull, 0, max_hull)
	update_hull.emit(old_value, current_hull)
	
	
func decrease_hull(amount: int) -> void:
	var old_value = current_hull
	current_hull -= amount
	current_hull = clamp(current_hull, 0, max_hull)
	if current_hull == 0: 
		you_died.emit()
	else:
		update_hull.emit(old_value, current_hull)
	
	
func increase_shield(amount: int) -> void:
	var old_value = current_shield
	current_shield += amount
	current_shield = clamp(current_shield, 0, max_shield)
	update_shield.emit(old_value, current_shield)
	
	
func decrease_shield(amount: int) -> void:
	var old_value = current_shield
	current_shield -= amount
	current_shield = clamp(current_shield, 0, max_shield)
	update_shield.emit(old_value, current_shield)
	
	# interesting gameplay ramifications here:
	# do we want to restart the timer every
	# time damage is received?
	if shield_recharge_timer.is_stopped(): 
		shield_recharge_timer.start()
		
		
func recharge_shield() -> void:
	var old_value = current_shield
	current_shield += 1
	current_shield = clamp(current_shield, 0, max_shield)
	update_shield.emit(old_value, current_shield)
	if current_shield < max_shield:
		shield_recharge_timer.start()
