extends Node2D

signal level_changed(level_name)
signal level_cleaned_up()

onready var level_name = name
onready var level_exit = $Level_Exit

func play_loaded_sound() -> void:
	$Enter_Level.play()
	
func cleanup():
	if $Exit_Level.playing:
		yield($Exit_Level, "finished")
	emit_signal('level_cleaned_up')
	queue_free()

func _on_Level_Exit_level_exited() -> void:
	$Exit_Level.play()
	emit_signal('level_changed', level_name)
