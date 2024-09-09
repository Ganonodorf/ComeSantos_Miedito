class_name Npc extends Node2D

# MARK: Signals

# MARK: enums & constants

# MARK: Exports

# MARK: Public vars

# MARK: Private vars

# MARK: Onready vars

# MARK: Basic lifecycle
func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _ready() -> void:
	$InteractComponent.player_interacted.connect(_npc_event)

# MARK: Built-in methods

func _input(event) -> void:
	pass

# MARK: Public methods

# MARK: Private methods
func _npc_event():
	print("Se ha recibido un evento concreto")

# MARK: Internal classes
