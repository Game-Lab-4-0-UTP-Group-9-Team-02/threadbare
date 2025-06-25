extends Area2D

@export var velocidad: float = 150.0
@export var direccion: Vector2 = Vector2.DOWN  # Movimiento hacia abajo

func _process(delta: float) -> void:
	position += direccion.normalized() * velocidad * delta
	rotation = direccion.angle()


# Detecta colisiones con otras Áreas (como el HitBox del jugador)
func _on_Flecha_area_entered(area: Area2D) -> void:

	if area.name == "HitBox" and area.monitoring:
		call_deferred("queue_free")
	else:
		var jugador: Node = area.get_parent()
		if jugador.is_in_group("jugador"):
			if jugador.has_method("recibir_golpe"):
				jugador.recibir_golpe()
			call_deferred("queue_free")


# Detecta colisiones físicas con paredes o cuerpos (como TileMap o el jugador)
func _on_Flecha_body_entered(body: Node2D) -> void:

	# Si choca con una pared (TileMap en el grupo "pared")
	if body.is_in_group("pared"):
		call_deferred("queue_free")
		return

	# Si choca con el hitbox mientras ataca
	if body.name == "HitBox" and body.monitoring:
		call_deferred("queue_free")
		return

	# Si choca directamente con el jugador
	if body.is_in_group("jugador"):
		if body.has_method("recibir_golpe"):
			body.recibir_golpe()
		call_deferred("queue_free")
