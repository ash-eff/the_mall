extends Area2D

signal level_exited

func _on_Level_Exit_body_entered(body: Node) -> void:
	if body.name == "Player":
		emit_signal("level_exited")
