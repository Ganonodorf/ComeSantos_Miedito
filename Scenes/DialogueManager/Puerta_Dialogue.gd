extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var puerta_dialogue: DialogueResource = load("res://Dialogues/DialogueManager/puerta.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "on_interact")

func on_interact():
	DialogueManager.show_example_dialogue_balloon(puerta_dialogue, "start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
