extends Control


@export var ShowHead = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ShowHead:
		$Head.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
