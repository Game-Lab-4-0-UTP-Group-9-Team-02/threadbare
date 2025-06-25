extends Node2D

@export var velocidad: float = 150.0
@export var direccion: Vector2 = Vector2.DOWN  # Va hacia abajo

func _process(delta):
	position += direccion.normalized() * velocidad * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Colisión con: ", area.name)
	if area.name == "HitBox":
		queue_free()
 
