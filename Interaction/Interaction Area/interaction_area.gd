extends Area2D
class_name InteractionArea

@onready var sprite: Sprite2D = $"../Sprite2D"
@export var action_name: String = "interact"

var player_in_range := false

var interact: Callable = func():
	pass 
	
func _on_body_entered(body: Node):
	if body.is_in_group("player"): 
		InteractionManager.register_area(self)
		var label: Label = Label.new()
		get_parent().add_child(label)
		label.text = "[E] to interact"
		label.name = "InteractLabel"
		label.global_position.y -= 60
		label.global_position.x -= label.size.x/2
		player_in_range = true
		sprite.material.set_shader_parameter("enabled", true)


func _on_body_exited(body: Node):
	if body.is_in_group("player"):
		InteractionManager.unregister_area(self)
		if $"../InteractLabel":
			$"../InteractLabel".queue_free()
		player_in_range = false
		sprite.material.set_shader_parameter("enabled", false)
