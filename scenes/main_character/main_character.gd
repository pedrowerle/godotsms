extends CharacterBody2D

@export var speed = 100
@export var jump_vel = -100
var gravity = 900
@onready var sprite: AnimatedSprite2D = $sprite


func _ready():
	sprite.stop()
	sprite.play("idle")

func _physics_process(delta: float) -> void:
	# Resetar velocidade horizontal
	velocity.x = 0

	# Movimento para a esquerda
	if Input.is_action_pressed("walk_left"):
		velocity.x -= speed
		sprite.play("walk")
		sprite.flip_h = true
	
	# Movimento para a direita
	elif Input.is_action_pressed("walk_right"):
		velocity.x += speed
		sprite.play("walk")
		sprite.flip_h = false
	
	# Se não estiver se movendo, animação idle
	else:
		sprite.play("idle")
   # Pulo
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_vel
	
	# Aplicar gravidade
	if not is_on_floor():
		velocity.y += gravity * delta

	# Mover o personagem
	move_and_slide()
