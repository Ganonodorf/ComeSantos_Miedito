extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite: Sprite2D = $Sprite2D

func on_interact():
	print("interact")

func _input(event: InputEvent) -> void:
	if interaction_area.player_in_range:
		if (_check_mouse_event(event) and _check_click_on_sprite(event)) or event.is_action_pressed("interact"):
			on_interact()

func _check_mouse_event(event: InputEvent) -> bool:
	return event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT

func _check_click_on_sprite(event: InputEvent) -> bool:
	return sprite.get_rect().has_point(to_local(event.position))
