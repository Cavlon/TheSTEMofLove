extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()

func _ready():
	$AnimatedSprite.animation = "ob_1" 
	$AnimatedSprite.play()
	rng.randomize()

export var velocity = -5
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#'func _on_VisibilityNotifier2D_screen_exited():
	#spawn()
	
	
var offScreen = true
var started = false
func _process(delta):
	if started == true:
		position.x += velocity
		velocity -= 0.5 * delta
		if position.x < 0 and not offScreen:
			offScreen = true
			spawn()


func _on_Player_first_jump():
	started = true
	spawn()
	

var multiplier = 6

func spawn():
	var wait = multiplier * rng.randf_range(0,1)
	yield(get_tree().create_timer(wait),"timeout")
	position.x = 1500
	offScreen = false

	
	
	
	


func _on_Player_end_game():
	$AnimatedSprite.hide() # Replace with function body.
