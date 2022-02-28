extends Character

onready var sword: Node2D = get_node("Sword")
onready var sword_animation: AnimationPlayer = sword.get_node("SwordAnimationPlayer")
func _process(_delta: float) -> void: 
	
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	
	# if mouse is needed in the future:)
	if mouse_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
		
	elif mouse_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
	sword.rotation = mouse_direction.angle()
	if sword.scale.y == 1 and mouse_direction.x < 0:
		sword.scale.y = -1
	elif sword.scale.y == -1 and mouse_direction.x > 0:
		sword.scale.y = 1
	if Input.is_action_just_pressed("ui_attack") and not sword_animation.is_playing():
		sword_animation.play("Attack")
	
	
		 
func get_input() -> void:
	mov_direction = Vector2.ZERO
	if velo.x != 0:
	   animated_sprite.animation = "run right"
	   animated_sprite.flip_h = velo.x < 0
	   
	
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
	elif Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
	elif Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
		
	
	
	
	
	
		

	

