extends Control

@export var show_head = false

var time_manager: Node

func _ready() -> void:
	if show_head:
		$Head.show()
	# Find TimeManager by searching up the tree
	time_manager = _find_time_manager()

func _find_time_manager() -> Node:
	var current = get_parent()
	while current != null:
		if current.has_method("get_time"):
			return current
		current = current.get_parent()
	return null

func _process(_delta: float) -> void:
	if time_manager:
		position.x = time_manager.get_time() * time_manager.pixels_per_second
