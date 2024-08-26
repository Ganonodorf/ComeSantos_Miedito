class_name PlayerClickToMove extends CharacterBody2D

# MARK: Signals

# MARK: enums & constants

# MARK: Exports
@export var speed := 300.0
@export var agent: NavigationAgent2D

# MARK: Public vars

# MARK: Private vars
var _moving := false
# MARK: Onready vars
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# MARK: Basic lifecycle

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	_move()

# MARK: Built-in methods

func _input(event) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		_moving = true
		agent.target_position = event.position

# MARK: Public methods

# MARK: Private methods
func _on_navigation_agent_2d_navigation_finished() -> void:
	velocity = Vector2.ZERO
	_moving = false
	animated_sprite.play("IDLE")
	
func _move():
	velocity = Vector2.ZERO
	var targetPos := agent.get_next_path_position()
	var dir := targetPos - global_position;
	
	if targetPos.distance_to(global_position) < 3.0: return
	velocity = dir.normalized() * speed
	if _moving:
		_face_to_target_path()
	else:
		animated_sprite.play("IDLE")
	move_and_slide()

func _face_to_target_path():
	if velocity.round().x >= -speed * 0.1 and velocity.round().x <= speed * 0.1 and velocity.y <= 0:
		animated_sprite.play("NORTH")
	elif velocity.round().y >= -speed * 0.1 and velocity.round().y <= speed * 0.1 and velocity.x >= 0:
		animated_sprite.play("EAST")
	elif velocity.round().x >= -speed * 0.1 and velocity.round().x <= speed * 0.1 and velocity.y >= 0:
		animated_sprite.play("SOUTH")
	elif velocity.round().y >= -speed * 0.1 and velocity.round().y <= speed * 0.1 and velocity.x <= 0:
		animated_sprite.play("WEST")
	elif velocity.x >= 0 and velocity.y <= 0:
		animated_sprite.play("NE")
	elif velocity.x <= 0 and velocity.y <= 0:
		animated_sprite.play("NW")
	elif velocity.x >= 0 and velocity.y >= 0:
		animated_sprite.play("SE")
	elif velocity.x <= 0 and velocity.y >= 0:
		animated_sprite.play("SW")
		
# MARK: Internal classes
