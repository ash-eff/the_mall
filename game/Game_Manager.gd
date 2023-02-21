extends Node2D

onready var player = $Player
onready var level_changer = $Level_Changer

func _ready() -> void:
	level_changer.connect('level_changing', player, 'on_level_changed')
	level_changer.connect('level_change_complete', player, 'on_level_loaded')

func _on_Level_Changer_loading_next_level(next_level) -> void:
	var spawn_pos = next_level.get_level_enter_position()
	$Player.position = spawn_pos


func _on_Level_Changer_level_change_complete() -> void:
	pass # Replace with function body.


func _on_Level_Changer_level_changing() -> void:
	pass # Replace with function body.
