# timer_manager.gd
extends Node

var tiempo_total: float = 0.0
var activo: bool = true

func _process(delta: float) -> void:
	if activo:
		tiempo_total += delta

func reiniciar():
	tiempo_total = 0.0
	activo = true

func pausar():
	activo = false

func continuar():
	activo = true

func get_tiempo_formateado() -> String:
	var minutos = int(tiempo_total) / 60
	var segundos = int(tiempo_total) % 60
	return "%02d:%02d" % [minutos, segundos]
