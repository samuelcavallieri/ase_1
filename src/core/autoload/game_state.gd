extends Node

signal flag_changed(flag_name: StringName, value: Variant)

const INITIAL_STATE := {
	"chapter": "prologue",
	"spawn_point": "origin",
	"flags": {},
	"party": ["elerii"],
}

var chapter: StringName = &"prologue"
var spawn_point: StringName = &"origin"
var flags: Dictionary = {}
var party: Array[StringName] = [&"elerii"]


func reset() -> void:
	chapter = StringName(INITIAL_STATE.chapter)
	spawn_point = StringName(INITIAL_STATE.spawn_point)
	flags = INITIAL_STATE.flags.duplicate(true)
	party.assign(INITIAL_STATE.party)


func set_flag(flag_name: StringName, value: Variant = true) -> void:
	flags[flag_name] = value
	flag_changed.emit(flag_name, value)


func get_flag(flag_name: StringName, fallback: Variant = false) -> Variant:
	return flags.get(flag_name, fallback)


func serialize() -> Dictionary:
	return {
		"chapter": String(chapter),
		"spawn_point": String(spawn_point),
		"flags": flags.duplicate(true),
		"party": party.map(func(member: StringName) -> String: return String(member)),
	}


func deserialize(data: Dictionary) -> void:
	chapter = StringName(data.get("chapter", INITIAL_STATE.chapter))
	spawn_point = StringName(data.get("spawn_point", INITIAL_STATE.spawn_point))
	flags = data.get("flags", {}).duplicate(true)
	party.clear()
	for member in data.get("party", INITIAL_STATE.party):
		party.append(StringName(member))
