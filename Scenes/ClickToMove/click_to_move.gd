class_name ClickToMove extends Node2D

# MARK: Signals

# MARK: enums & constants

# MARK: Exports

# MARK: Public vars

# MARK: Private vars

# MARK: Onready vars
@onready var sprite_2d: Sprite2D = $Sprite2D

# MARK: Basic lifecycle

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _ready() -> void:
	pass

# MARK: Built-in methods

func _input(event) -> void:
	if event is InputEventMouseButton:
		sprite_2d.position = event.position

# MARK: Public methods

# MARK: Private methods

# MARK: Internal classes
