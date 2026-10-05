extends Control
@export var subViewport: SubViewport
@onready var viewport = $Panel/VBoxContainer/VSplitContainer/Viewport/HSplitContainer/Viewport/Texture
# Called when the node enters the scene tree for the first time.


@export var ViewportSize = Vector2(0,0)






func _ready() -> void:
	mountViewport(subViewport)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateViewportSize()
	pass


func updateViewportSize():
	ViewportSize = $Panel/VBoxContainer/VSplitContainer/Viewport/HSplitContainer/Viewport.size
func mountViewport(subviewport: SubViewport):
	var viewport_texture: ViewportTexture = subviewport.get_texture()
	viewport.texture = viewport_texture
	
