class_name InventoryUI
extends Control

@onready var item_list := $ItemList as ItemList

@onready var turret_slot = null
@onready var engine_slot = null
@onready var dodge_slot = null
@onready var shield_slot = null
@onready var current_scrap = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	for item: String in Inventory.ship_backpack:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
