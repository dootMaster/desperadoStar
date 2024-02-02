extends Node

@onready var single_shot = preload("res://player/turret/turret_weapons/single_shot/single_shot.tscn")
@onready var double_shot = preload("res://player/turret/turret_weapons/double_shot/double_shot.tscn")
@onready var ion_shot = preload("res://player/turret/turret_weapons/ion_shot/ion_shot.tscn")
@onready var fast_shot = preload("res://player/turret/turret_weapons/fast_shot/fast_shot.tscn")
@onready var ballistic_shot = preload("res://player/turret/turret_weapons/ballistic_shot/ballistic_shot.tscn")

@onready var ship_backpack = ["single_shot", "double_shot"]
@onready var turret_slot = single_shot
@onready var engine_slot = null
@onready var dodge_slot = null
@onready var shield_slot = null
@onready var current_scrap = 10

var turret_weapons_dict = {
	"single_shot": single_shot,
	"double_shot": double_shot,
	"ion_shot": ion_shot,
	"fast_shot": fast_shot,
	"ballistic_shot": ballistic_shot,
}

func _ready():
	pass

func add_reward_to_backpack(reward) -> void:
	ship_backpack.push_back(reward)
	
func swap_into_turret_slot(new_weapon) -> void:
	var current_weapon = turret_slot
	turret_slot = new_weapon
	ship_backpack.erase(new_weapon)
	ship_backpack.push_back(current_weapon)
	
func increase_scrap(amount) -> void:
	current_scrap += amount
	
func decrease_scrap(amount) -> void:
	current_scrap -= amount
 

