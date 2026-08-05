extends Node

signal transition_started(target: String)
signal transition_finished(target: String)

var _busy := false


func change_scene(target: String, spawn: StringName = &"origin") -> void:
	if _busy:
		return
	_busy = true
	GameState.spawn_point = spawn
	transition_started.emit(target)
	var error := get_tree().change_scene_to_file(target)
	if error != OK:
		push_error("Não foi possível abrir a cena: %s (%s)" % [target, error])
		_busy = false
		return
	await get_tree().process_frame
	_busy = false
	transition_finished.emit(target)
