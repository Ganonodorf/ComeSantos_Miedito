class_name ClickToMove extends Node2D

# MARK: Signals

# MARK: enums & constants

# MARK: Exports

# MARK: Public vars

# MARK: Private vars

# MARK: Onready vars
@onready var nav_region: NavigationRegion2D = $NavigationRegion2D
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

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
		print("mouse clicked here ", event.position)
		pass

# MARK: Public methods

# MARK: Private methods

# MARK: Internal classes
