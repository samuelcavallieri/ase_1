extends Control

const PROLOGUE := "res://src/world/prologue/prologue.tscn"


func _ready() -> void:
	await get_tree().create_timer(1.4).timeout
	SceneRouter.change_scene(PROLOGUE)
