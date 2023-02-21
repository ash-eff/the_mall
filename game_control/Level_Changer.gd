extends Node2D

signal loading_next_level(next_level)
signal level_changing()
signal level_change_complete()

var next_level = null

onready var current_level = $Level_1
onready var anim = $AnimationPlayer

func _ready() -> void:
	current_level.connect('level_changed', self, 'handle_level_changed')
	current_level.connect('level_cleaned_up', self, 'load_next_level')
	current_level.play_level_intro()
	
func handle_level_changed(current_level_name):
	var next_level_name: String
	
	match current_level_name:
		'Level_1':
			next_level_name = 'Level_2'
		'Level_2':
			next_level_name = 'Level_3'
		'Level_3':
			next_level_name = 'Level_1'
		_:
			return
	
	next_level = load("res://levels/" + next_level_name + ".tscn").instance()
	next_level.visible = false
	call_deferred('add_child', next_level)
	#add_child(next_level)
	anim.play("level_close")
	emit_signal('level_changing')
	next_level.connect('level_changed', self, 'handle_level_changed')
	next_level.connect('level_cleaned_up', self, 'load_next_level')
	
func load_next_level():
	emit_signal('loading_next_level', next_level)
	next_level.visible = true
	next_level = null
	anim.play("level_open")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	match anim_name:
		'level_close':
			current_level.cleanup()
			current_level = next_level 
			
		'level_open':
			current_level.play_level_intro()
			emit_signal("level_change_complete")
