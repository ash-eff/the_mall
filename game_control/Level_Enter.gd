extends Area2D

signal level_entered

func _on_Level_Enter_body_entered(body: Node) -> void:
	if body.name == "Player":
		emit_signal("level_entered")
