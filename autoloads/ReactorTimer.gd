extends Node

var timer: Timer

func _ready():
	timer = Timer.new()
	add_child(timer)
