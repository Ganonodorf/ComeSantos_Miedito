extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "on_interact")

func on_interact():
	if Dialogic.current_timeline != null:
		return
	else:
		Dialogic.start('puerta_timeline')
		get_viewport().set_input_as_handled()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
