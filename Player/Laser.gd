extends RayCast2D

var is_casting = false
var decay = 0.1
var recharge = 0.01
var damage = 10

func _physics_process(delta):
	$Line2D.points[1] = cast_to
	if is_casting and is_colliding():
		var c = get_collider()
		var target = (c.position + Vector2(0,50)) - get_parent().position
		$Line2D.points[1].y = target.y
		$Target.position = target

func fire(pos):
	is_casting = true
	cast_to = pos - global_position
	$Target.position = cast_to
	$Target.monitoring = true

func stop():
	is_casting = false
	cast_to = Vector2.ZERO
	$Target.position = Vector2.ZERO
	$Target.monitoring = false


func _on_Target_body_entered(body):
	body.die()
