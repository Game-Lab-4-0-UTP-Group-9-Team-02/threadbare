extends Area2D

@export_file("*.tscn") var siguiente_minijuego: String

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("jugador"):
		await get_tree().create_timer(0.5).timeout
		if siguiente_minijuego != "":
			SceneSwitcher.change_to_file_with_transition(
				siguiente_minijuego,
				"",  # spawn_point_path vacío
				Transition.Effect.FADE,
				Transition.Effect.FADE
			)
