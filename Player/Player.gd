extends KinematicBody2D

export var speed = 7


func _physics_process(delta):
	position += get_input()*speed
	if Input.is_action_pressed("shoot") and not $Laser.is_casting:
		$Laser.fire(Vector2(global_position.x, 0))
	elif not Input.is_action_pressed("shoot") and $Laser.is_casting:
		$Laser.stop()
	


func get_input():
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	return input_dir.rotated(rotation)


func _on_Damage_body_entered(body):
	body.die()
