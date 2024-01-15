extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	TitleScreenMusicPlayer.is_playing = false
	TitleScreenMusicPlayer.stop_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $Player.position.y > 100:
		$Player.set_def_pos()
	
	
