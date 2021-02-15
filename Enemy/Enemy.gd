extends KinematicBody2D

export var speed = Vector2(0,3)
export var health = 100
export var points = 10
export var damage = 50

onready var Explosion = load("res://Explosion/Explosion.tscn")
onready var Sound = get_node("/root/Game/Cow")


func _physics_process(delta):
	position += speed

	if position.y > get_viewport().size.y + 100:
		queue_free()

func die():
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	explosion.get_node("Animation").play()
	Sound.play()
	queue_free()
