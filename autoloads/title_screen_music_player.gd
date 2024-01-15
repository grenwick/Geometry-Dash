extends Node

var title_song = load("res://Music/new_start_music.wav")

var song_time_elapsed = 0.0
var is_playing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_music():
	$AudioStreamPlayer.stream = title_song
	$AudioStreamPlayer.play()
	
func stop_music():
	$AudioStreamPlayer.stop()

