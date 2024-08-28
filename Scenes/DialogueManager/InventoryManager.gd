extends Node2D


var _lantern: bool = false

func pickLantern() -> void:
	_lantern = true

func dropLantern() -> void:
	_lantern = false
	
func hasLantern() -> bool:
	return _lantern
