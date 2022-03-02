extends Node2D

func _init() -> void:
	var screensize: Vector2 = OS.get_screen_size()
	var window: Vector2 = OS.get_real_window_size()
	
	OS.set_window_position(screensize*0.5 - window*0.5)
