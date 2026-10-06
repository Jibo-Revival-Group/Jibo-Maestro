extends Node

signal time_changed(new_time: float)

var current_time: float = 0.0
var duration: float = 30.0
var pixels_per_second: float = 100.0
var is_playing: bool = false

func set_time(new_time: float) -> void:
	current_time = clamp(new_time, 0.0, duration)
	time_changed.emit(current_time)

func get_time() -> float:
	return current_time

func set_duration(new_duration: float) -> void:
	duration = new_duration
	if current_time > duration:
		set_time(duration)
