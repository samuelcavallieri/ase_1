extends Node

const SAVE_VERSION := 1
const SAVE_PATH := "user://save_01.json"


func save_game() -> Error:
	var payload := {
		"version": SAVE_VERSION,
		"game_state": GameState.serialize(),
	}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		return FileAccess.get_open_error()
	file.store_string(JSON.stringify(payload, "\t"))
	return OK


func load_game() -> Error:
	if not FileAccess.file_exists(SAVE_PATH):
		return ERR_FILE_NOT_FOUND
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return FileAccess.get_open_error()
	var payload: Variant = JSON.parse_string(file.get_as_text())
	if not payload is Dictionary:
		return ERR_PARSE_ERROR
	if int(payload.get("version", 0)) != SAVE_VERSION:
		return ERR_FILE_UNRECOGNIZED
	GameState.deserialize(payload.get("game_state", {}))
	return OK
