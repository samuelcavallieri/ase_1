extends Node

const BUS_MUSIC := &"Music"
const BUS_AMBIENCE := &"Ambience"
const BUS_SFX := &"SFX"
const BUS_VOICE := &"Voice"

var music_player := AudioStreamPlayer.new()
var ambience_player := AudioStreamPlayer.new()


func _ready() -> void:
	music_player.bus = BUS_MUSIC
	ambience_player.bus = BUS_AMBIENCE
	add_child(music_player)
	add_child(ambience_player)


func play_music(stream: AudioStream, from_position := 0.0) -> void:
	if music_player.stream == stream and music_player.playing:
		return
	music_player.stream = stream
	music_player.play(from_position)


func stop_music() -> void:
	music_player.stop()


func play_ambience(stream: AudioStream) -> void:
	ambience_player.stream = stream
	ambience_player.play()
