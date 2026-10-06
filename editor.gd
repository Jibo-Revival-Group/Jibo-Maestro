extends Control
@export var subViewport: SubViewport
@onready var viewport = $Panel/VBoxContainer/VSplitContainer/Viewport/HSplitContainer/Viewport/Texture
@onready var timestamp_label = $Panel/VBoxContainer/VSplitContainer/Viewport/HSplitContainer/Viewport/TimeStamp/TimeStamp
@onready var time_manager = $Panel/VBoxContainer/VSplitContainer/Control/Panel/VBoxContainer/TimelineBox/Timeline/List

@export var ViewportSize = Vector2(0, 0)

func _ready() -> void:
	mountViewport(subViewport)

func _process(_delta: float) -> void:
	updateViewportSize()
	update_timestamp()

func updateViewportSize():
	ViewportSize = $Panel/VBoxContainer/VSplitContainer/Viewport/HSplitContainer/Viewport.size

func mountViewport(subviewport: SubViewport):
	var viewport_texture: ViewportTexture = subviewport.get_texture()
	viewport.texture = viewport_texture

func update_timestamp() -> void:
	if time_manager:
		var current_time_str = format_time(time_manager.get_time())
		var duration_str = format_time(time_manager.duration)
		timestamp_label.text = "%s | %s" % [current_time_str, duration_str]

func format_time(seconds: float) -> String:
	var total_ms = int(seconds * 1000)
	var ms = total_ms % 1000
	var total_seconds = total_ms / 1000
	var secs = total_seconds % 60
	var total_minutes = total_seconds / 60
	var mins = total_minutes % 60
	var hours = total_minutes / 60
	return "%02d:%02d:%02d.%03d" % [hours, mins, secs, ms]
