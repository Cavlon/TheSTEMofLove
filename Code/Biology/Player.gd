extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "jump_one" # Replace with function body.

signal first_jump
signal end_game
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

export var velocity = Vector2.ZERO 
var start = false
var lay = 17

func _process(_delta):
	
	if velocity.y == 0 and Input.is_action_pressed("jump") and position.y == 0:
		velocity.y = -20 
		if start == false:
			start = true
			emit_signal("first_jump")
	#elif position.y <= 150:
	#	position.y = 150
	#	velocity.y += 0
	elif velocity.y == 20:
		velocity.y = 0
		position.y = 0
	elif position.y < 0:
		velocity.y += 1 #* delta
	#print("hi")
	
	elif position.y == 0 and Input.is_action_just_pressed("duck"):
		$AnimatedSprite.animation = "duck_one"
		$AnimatedSprite.play()
		position.y = lay
	elif Input.is_action_just_released("duck"):
		$AnimatedSprite.animation = "jump_one"
		$AnimatedSprite.play()
		position.y = 0
	position += velocity 






func _on_Player_body_entered(_body):
	print("hi")
	hide() # Player disappears after being hit.
	emit_signal("end_game")
	$CollisionShape2D.set_deferred("disabled", true)


