extends Area2D
class_name InteractDetector

var can_interact := false
var target: Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Interactuable") and get_parent() is PlayerClickToMove:
		can_interact = true
		target = area
		area.get_sprite().material.set_shader_parameter("enabled", true)
		if target.has_method("show_label"):
			target.show_label()


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("Interactuable") and get_parent() is PlayerClickToMove:
		can_interact = false
		area.get_sprite().material.set_shader_parameter("enabled", false)
		if target.has_method("remove_label"):
			target.remove_label()
		target = null
		

func _input(event: InputEvent) -> void:
	if can_interact and target is InteractComponent:
		if (_check_mouse_event(event) and _check_click_on_sprite(event)) or event.is_action_pressed("interact"):
			if target.has_method("on_interact"):
				target.on_interact()

func _check_mouse_event(event: InputEvent) -> bool:
	return event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT

func _check_click_on_sprite(event: InputEvent) -> bool:
	if target.get_node(str(target.get_path()) + "/CliclableArea"):
		var _rect = target.get_node(str(target.get_path()) + "/CliclableArea").get_rect()
		var _local_pos = to_local(event.position)
		return _rect.has_point(_local_pos)
	else:
		return false
