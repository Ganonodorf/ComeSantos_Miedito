extends Area2D
class_name InteractComponent

@export var sprite: Sprite2D

signal player_interacted

func get_sprite() -> Sprite2D:
	return sprite

func on_interact():
	player_interacted.emit()
	
func show_label():
	var label: Label = Label.new()
	get_parent().add_child(label)
	label.text = "[E] to interact"
	label.name = "InteractLabel"
	label.global_position.y -= 60
	label.global_position.x -= label.size.x/2

func remove_label():
	if $"../InteractLabel":
		$"../InteractLabel".queue_free()
