extends Node2D

signal level_changed(level_name)
signal level_cleaned_up()

onready var level_name = name
onready var level_exit = $Level_Exit
onready var level_enter = $Level_Enter

func play_level_intro() -> void:
	$AnimationPlayer.play('level_title')
	
func cleanup():
	if $Exit_Level.playing:
		yield($Exit_Level, "finished")
	emit_signal('level_cleaned_up')
	queue_free()

func get_level_enter_position():
	return level_enter.get_global_position()

func _on_Level_Exit_level_exited() -> void:
	$Exit_Level.play()
	emit_signal('level_changed', level_name)
