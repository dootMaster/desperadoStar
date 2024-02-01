extends Control

@onready var start_button := %MenuBar/start
@onready var exit_button := %MenuBar/exit

func _ready():
	get_tree().paused = false

func _on_start_pressed():
	print("new game!")

func _on_exit_pressed():
	get_tree().quit()

