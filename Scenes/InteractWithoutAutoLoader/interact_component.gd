extends Area2D
class_name InteractComponent

@export var sprite: Sprite2D

signal player_interacted

func get_sprite() -> Sprite2D:
	return sprite

func on_interact():
	player_interacted.emit()
