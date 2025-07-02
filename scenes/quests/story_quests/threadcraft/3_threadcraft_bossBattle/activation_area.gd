extends Area2D

@export var target_enemy: ThrowingEnemy

func _on_body_entered(body: Node2D) -> void:
	if body is Player and is_instance_valid(target_enemy):
		target_enemy.start()
		queue_free()
