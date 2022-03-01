extends KinematicBody2D

class_name Character , "res://Art_Assets/dungeon rpg pack/0x72_DungeonTilesetII_v1.4/frames/elf_m_idle_anim_f0.png"

const friction: float = 0.15

export(int) var acc: int = 40
export(int) var max_speed: int = 100

onready var state_machine: Node = get_node("FiniteStateMachine")
onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

var mov_direction: Vector2 = Vector2.ZERO
var velo: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	velo = move_and_slide(velo)
	velo = lerp(velo, Vector2.ZERO, friction)

func move() -> void: 
	mov_direction = mov_direction.normalized()
	velo += mov_direction*acc
	velo = velo.clamped(max_speed) 

