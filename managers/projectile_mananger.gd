class_name ProjectileManager
extends Node2D

func _ready(): 
	SignalBus.connect("shoot", build_projectile)
	

func build_projectile(location: Vector2, direction: Vector2) -> void:
	print("projectile manager")
	var new_bullet = Inventory.turret_slot.instantiate()
	
	new_bullet.position = location
	new_bullet.direction = (direction - global_position).normalized()
	new_bullet.rotation = new_bullet.direction.angle()

	spawn_projectile(new_bullet)
	
	
func spawn_projectile(bullet) -> void:
	var projectile_container = NodeExtensions.get_projectile_container()
	
	if projectile_container == null:
		return
		
	projectile_container.add_child(bullet)
