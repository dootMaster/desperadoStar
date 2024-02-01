extends Node

signal update_energy_signal(old_value: int, new_value: int)
signal overload_signal()

@export_group("Energy Values")
@export var max_energy := 10
@export var current_energy := 10

@export_group("Recharge Values")
@export var recharge_time: float = 2.0 #seconds
@export var recharge_rate: int = 1

@export_group("Overclock Values")
@export var overclock := false
@export var overclock_level := 2

var reactor_timer_autoload
var reactor_recharge_timer

#@onready var reactor_timer_autoload = get_node("/root/ReactorTimer")
#@onready var reactor_recharge_timer = reactor_timer_autoload.timer

func _ready():
	reactor_timer_autoload = get_node("/root/ReactorTimer")
	reactor_recharge_timer = reactor_timer_autoload.timer
	
	reactor_recharge_timer.connect("timeout", recharge_energy)
	reactor_recharge_timer.one_shot = true
	reactor_recharge_timer.wait_time = recharge_time
	
func _process(_delta):
	#print(reactor_recharge_timer.time_left)
	pass

func recharge_energy() -> void:
	var old_value = current_energy
	#var total_recharge_rate = recharge_rate * overclock_level
	current_energy += 1
	current_energy = clamp(current_energy, 0, max_energy)
	print("recharge: current:", current_energy, " max:", max_energy)
	update_energy_signal.emit(old_value, current_energy)
	if current_energy < max_energy:
		reactor_recharge_timer.start()

func decrease_energy(amount: int) -> void:
	var old_value = current_energy
	current_energy -= amount
	if current_energy <= 0:
		overloaded()
	current_energy = clamp(current_energy, 0, max_energy)
	update_energy_signal.emit(old_value, current_energy)
	if reactor_recharge_timer.is_stopped():
		reactor_recharge_timer.start()
		#print("recharging")

func increase_max_energy(amount: int) -> void:
	max_energy += amount
	
func decrease_max_energy(amount: int) -> void:
	max_energy -= amount
	
func overloaded() -> void:
	overload_signal.emit()
