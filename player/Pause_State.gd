extends State

func enter(_msg := {}) -> void:
	owner.animation_player.play("player_idle")
	owner.velocity = Vector2.ZERO
